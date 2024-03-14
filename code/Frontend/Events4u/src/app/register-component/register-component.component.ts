import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms'; 
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { InputMaskModule } from 'primeng/inputmask';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-register-component',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, InputTextModule, PasswordModule, InputMaskModule],
  templateUrl: './register-component.component.html',
  styleUrl: './register-component.component.scss'
})
export class RegisterComponentComponent {

  // Creating a FormGroup to manage form controls
  registerForm = new FormGroup({
    firstName: new FormControl(''),
    lastName: new FormControl(''),
    email: new FormControl(''),
    password: new FormControl(''),
  });

  constructor (private router: Router) { }

  /**
   * A description of the entire function.
   *
   */
  async register() {
    const { firstName, lastName, email, password } = this.registerForm.value;

    if(firstName && lastName && email && password) {
      const inputData = { firstName, lastName, email, password }
      const response = await fetch('http://192.168.129.237:3000/user/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
      });
      
      if(response.ok){  // If registration is successful
        // Displaying success alert using SweetAlert2
        Swal.fire({
          title: 'Registered!',
          text: 'You have been registered.',
          icon: 'success'
        }).then((result) => {
          if (result.isConfirmed) {
            this.router.navigateByUrl('/login');  // Navigating to the login page after successful registration
          }
        });
      }
    } else {  // If any field is empty
      // Displaying error alert using SweetAlert2
      Swal.fire({
        title: 'Error!',
        text: 'You must fill out all the fields, in order to register.',
        icon: 'error'
      })

    }
    
  }
}
