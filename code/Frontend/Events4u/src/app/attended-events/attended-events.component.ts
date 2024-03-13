import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-attended-events',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './attended-events.component.html',
  styleUrl: './attended-events.component.scss'
})
export class AttendedEventsComponent implements OnInit {
  public eventsData: any[] = [];
  token = this.localService.getItem("token")

  constructor( private router: Router, private localService: LocalService) { }

  async ngOnInit() {
    const response = await fetch(`http://192.168.129.237:3000/events/attended`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.eventsData = data.data;

  }


  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
