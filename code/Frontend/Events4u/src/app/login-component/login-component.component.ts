import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import Swal from 'sweetalert2';
import { LocalService } from '../local.service';
import { LoginStatusService } from '../login-status.service';

@Component({
  selector: 'app-login-component',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, InputTextModule, PasswordModule],
  templateUrl: './login-component.component.html',
  styleUrl: './login-component.component.scss'
})
export class LoginComponentComponent {

  // Initialize login form with email and password fields
  loginForm = new FormGroup({
    email: new FormControl(''),
    password: new FormControl(''),
  });

  constructor(private router: Router, 
    private localService: LocalService, 
    private loginStatusService: LoginStatusService, 
    private route: ActivatedRoute,
    ) {  }



  /**
   * A function for user login.
   */
  async login() {
    const { email, password } = this.loginForm.value;

    if (email && password) {      // Check if email and password are provided
      const inputData = { email, password }
      const response = await fetch('http://192.168.129.237:3000/user/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
      });

      // If login is successful, store token in local storage and navigate to myEvents page
      if (response.ok) {
        const data = await response.json();
        const token = data.token;
        this.localService.setItem('token', token);
        this.router.navigateByUrl('/myEvents');
        this.loginStatusService.sendLoginStatus(true);
      } else {
        // If response status is 400, show email not found error, otherwise display error message from the backend
        if (response.status === 400) {
          Swal.fire({
            title: 'Error!',
            text: "No such email found!",
            icon: 'error'
          });
        } else {
          const data = await response.json();
          const message = data.message;
          Swal.fire({
            title: 'Wrong credentials!',
            text: message,
            icon: 'error'
          });
        }
      }
    } else {
      // If email or password is not provided, show error message
      Swal.fire({
        title: 'Error!',
        text: 'You must fill out all the fields, in order to login!',
        icon: 'error'
      });
    }
  }

  /**
   * A function that makes an asynchronous request to fetch the LuxID, then sets the verifier in local storage and redirects the user to the LuxID login page.
   *
   * @return {Promise<void>} A Promise that resolves when the LuxID is fetched and the user is redirected.
   */
  async luxID() {
    const response =await fetch("http://192.168.129.237:3000/luxId/codeVerifier", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    const challenge = data.challenge;
    const state = data.state;


    window.location.href=`https://login-uat.luxid.lu/mga/sps/oauth/oauth20/authorize?response_type=code&client_id=lam_bts_1&redirect_uri=http%3A%2F%2Flocalhost:8081&nonce=UjWO_F3Y0-jbb_71QcA8f34Lpbb5hpAbQ9o5YDqLHkc&code_challenge_method=S256&scope=openid%20email&code_challenge=${challenge}&state=${state}`;

  }

  
}


