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

  constructor(private router: Router) { }

  /**
   * A description of the entire function.
   *
   */
  async register() {
    const { firstName, lastName, email, password } = this.registerForm.value;
    if (firstName && lastName && email && password) {
      Swal.fire({
        title: "Terms and Conditions",
        html: `<p>To use your register on our website you have to accept the terms and conditions.<br> If you accept you give the concent to show your full name when you comment on events, apply or are invited for groups, create an event or group, and if you mark an event as attending or interested, so that the owner can see who is interested in his event. This is valid as long as you have an account  </p>`,
        icon: 'info',
        confirmButtonText: 'Accept',
        cancelButtonText: 'Decline',
        showCancelButton: true,
      }).then(async (result) => {
        if (result.isConfirmed) {
          const inputData = { firstName, lastName, email, password }
          const isEmail = await this.checkEmail(email);           // email verification
          console.log(isEmail);

          if (isEmail) {
            const response = await fetch('http://192.168.129.237:3000/user/register', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify(inputData)
            });
            if (response.ok) {                            // If registration is successful
              Swal.fire({
                title: 'Registered!',
                text: 'You have been registered.',
                icon: 'success'
              }).then((result) => {
                if (result.isConfirmed) {
                  this.router.navigateByUrl('/login');    // Navigating to the login page after successful registration
                }
              });
            }
          }

        } else {
          Swal.fire({
            title: "Can't register",
            text: "You can not register without accepting the terms and conditions",
            icon: 'error'
          })
        }
      }
      );
    } else {  // If any field is empty
      // Displaying error alert using SweetAlert2
      Swal.fire({
        title: 'Error!',
        text: 'You must fill out all the fields, in order to register.',
        icon: 'error'
      })

    }
  }

  /**
   * A function to check the validity of an email by sending a verification request to the server.
   *
   * @param {any} email - the email to be verified
   * @return {boolean} returns true if the email is verified, false otherwise
   */
  // async checkEmail(email: any) {
  //   const inputData = { email };

  //   const response = await fetch('http://192.168.129.237:3000/verify/email', {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json'
  //     },
  //     body: JSON.stringify(inputData)
  //   });

  //   const data = await response.json();
  //   const originalCode = data.hashedCode;
  //   let isEmailRight = false;

  //   Swal.fire({
  //     title: 'Enter the 4-Digit Code send to your email adress.',
  //     input: 'text',
  //     inputAttributes: {
  //       maxlength: "4",
  //       autocapitalize: 'off',
  //       autocorrect: 'off'
  //     },
  //     showCancelButton: true,
  //     confirmButtonText: 'Submit',
  //     cancelButtonText: 'Cancel',
  //     preConfirm: (code) => {
  //       let hashedCode = +this.customHash(code);

  //       if (+originalCode !== hashedCode) {
  //         Swal.showValidationMessage('Please enter a valid 4-digit code');
  //         isEmailRight = false;
  //       } else {
  //         isEmailRight = true;

  //       }
  //     }
  //   })

  //   return isEmailRight;

  // }

  async checkEmail(email: any): Promise<boolean> {
    const inputData = { email };

    const response = await fetch('http://192.168.129.237:3000/verify/email', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
    });

    const data = await response.json();
    const originalCode = data.hashedCode;

    return new Promise((resolve, reject) => {
        Swal.fire({
            title: 'Enter the 4-Digit Code sent to your email address.',
            input: 'text',
            inputAttributes: {
                maxlength: "4",
                autocapitalize: 'off',
                autocorrect: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'Submit',
            cancelButtonText: 'Cancel',
            preConfirm: (code) => {
                let hashedCode = +this.customHash(code);
                if (+originalCode !== hashedCode) {
                    Swal.showValidationMessage('Please enter a valid 4-digit code');
                    return false;
                } else {
                    return true;
                }
            }
        }).then((result) => {
            if (result.isConfirmed) {
                resolve(true); // Resolve with true if confirmed
            } else {
                resolve(false); // Resolve with false if canceled
            }
        }).catch((error) => {
            reject(error); // Reject if there is an error
        });
    });
}


  customHash(data: string): string {
    let hash = 0;
    if (data.length == 0) return hash.toString();
    for (let i = 0; i < data.length; i++) {
      let char = data.charCodeAt(i);
      hash = (hash << 20) - hash + char;
      hash = hash & hash;
    }
    return hash.toString();
  }


  async luxID() {
    const response = await fetch("http://192.168.129.237:3000/luxId/codeVerifier", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    const challenge = data.challenge;
    const state = data.state;


    window.location.href = `https://login-uat.luxid.lu/mga/sps/oauth/oauth20/authorize?response_type=code&client_id=lam_bts_1&redirect_uri=http%3A%2F%2Flocalhost:8081&nonce=UjWO_F3Y0-jbb_71QcA8f34Lpbb5hpAbQ9o5YDqLHkc&code_challenge_method=S256&scope=openid%20email&code_challenge=${challenge}&state=${state}`;

  }
}
