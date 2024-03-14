import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchServiceService } from '../search-service.service';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-events-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-list.component.html',
  styleUrl: './events-list.component.scss'
})
export class EventsListComponent implements OnInit {
  public eventsData: any[] = [];              // Array to store the fetched events
  clickEventsubscription: Subscription;       // Subscription to listen for search events
  token = this.localService.getItem("token"); // Retrieve token from local storage


  constructor(private searchEvent: SearchServiceService, private router: Router, private localService: LocalService) {
    this.clickEventsubscription = this.searchEvent.getSearchEvent().subscribe((data)=>{      
      this.search(data);
    });
  }

  async ngOnInit() {
    // Fetch all events when the component initializes
    const response = await fetch(`http://192.168.129.237:3000/event/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.eventsData = data.data;  // Store fetched events in the eventsData array
  }

  /**
   * Asynchronously searches for data using the provided input data.
   *
   * @param {any} inputData - the input data for the search
   * @return {void} 
   */
  async search(inputData: any){    
    const response = await fetch(`http://192.168.129.237:3000/event/search`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    const data = await response.json();
    this.eventsData = data.data;        // Store search results in the eventsData array
  }

  /**
   * Navigate to the specified URL.
   *
   * @param {string} url - the URL to navigate to
   * @return {void} 
   */
  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}

