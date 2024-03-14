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
  public eventsData: any[] = [];                // Initialize eventsData as an empty array
  token = this.localService.getItem("token")    // Get token from local storage

  constructor( private router: Router, private localService: LocalService) { }

  /**
   * Fetch attended events data from the backend
   * 
   * @return {void} 
   */
  async ngOnInit() {
    // Fetch attended events data from the backend
    const response = await fetch(`http://192.168.129.237:3000/events/attended`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    // Redirect to login page if unauthorized or forbidden
    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }

    // Parse response data and assign it to eventsData
    const data = await response.json();
    this.eventsData = data.data;

  }


  /**
   * goTo method navigates to the specified URL.
   *
   * @param {string} url - the URL to navigate to
   * @return {void} 
   */
    goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
