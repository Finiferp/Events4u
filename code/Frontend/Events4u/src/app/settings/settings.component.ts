import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LocalService } from '../local.service';
import { TooltipModule } from 'primeng/tooltip';
import Swal from 'sweetalert2';



@Component({
  selector: 'app-settings',
  standalone: true,
  imports: [CommonModule, TooltipModule],
  templateUrl: './settings.component.html',
  styleUrl: './settings.component.scss'
})
export class SettingsComponent implements OnInit {
  acceptEmails: boolean = false;                // Boolean flag for accepting emails
  token = this.localService.getItem("token");   // Token for authentication

  constructor(private localService: LocalService) { }


  async ngOnInit() {
    const response = await fetch(`http://192.168.129.237:3000/getUser`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      }
    });
    const data = await response.json();
    const user = data.data;

    this.acceptEmails = user.acceptsNotifications === 1 ? true : false;

  }


  async toggleMails() {
    this.acceptEmails = this.acceptEmails ? false : true
    const response = await fetch(`http://192.168.129.237:3000/user/toggle/mail`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
      body: JSON.stringify({
        acceptsNotifications: this.acceptEmails ? 1 : 0
      })
    });

    if (response.ok) {
      Swal.fire({
        icon: 'success',
        title: 'Success',
        text: 'Your email preferences have been updated!',
      })
    }
  }


}
