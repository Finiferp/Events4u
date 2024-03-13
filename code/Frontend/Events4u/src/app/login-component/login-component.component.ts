import { Component } from '@angular/core';
import { Router } from '@angular/router';
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
  imports: [CommonModule, ReactiveFormsModule, InputTextModule, PasswordModule,],
  templateUrl: './login-component.component.html',
  styleUrl: './login-component.component.scss'
})
export class LoginComponentComponent {

  loginForm = new FormGroup({
    email: new FormControl(''),
    password: new FormControl(''),
  });

  constructor(private router: Router, private localService: LocalService, private loginStatusService: LoginStatusService) { }


  async login() {
    const { email, password } = this.loginForm.value;

    if (email && password) {
      const inputData = { email, password }
      const response = await fetch('http://192.168.129.237:3000/user/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
      });


      if (response.ok) {
        const data = await response.json();
        const token = data.token;
        this.localService.setItem('token', token);
        this.router.navigateByUrl('/myEvents');
        this.loginStatusService.sendLoginStatus(true);
      } else {
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
      Swal.fire({
        title: 'Error!',
        text: 'You must fill out all the fields, in order to login!',
        icon: 'error'
      });
    }

  }

}
