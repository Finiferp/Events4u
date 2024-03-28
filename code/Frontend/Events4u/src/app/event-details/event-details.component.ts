import { Component, OnInit  } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ReviewsComponent } from '../reviews/reviews.component';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';
import { TooltipModule } from 'primeng/tooltip';



@Component({
  selector: 'app-event-details',
  standalone: true,
  imports: [CommonModule, ReviewsComponent, TooltipModule],
  templateUrl: './event-details.component.html',
  styleUrl: './event-details.component.scss'
})
export class EventDetailsComponent implements OnInit {
  public eventData: any = {};                 // Stores the event data fetched from the API
  public id: any = -1;                        // Initialize the event ID variable
  token = this.localService.getItem("token"); // Get the authentication token from the local storage
  userConcent = false;                        // Represents whether the user has agreed to the terms and conditions

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) { };

  async ngOnInit() {
    this.loadUser()        // Load user data
    this.loadEvent()  //Load event details
  } 

  /**
   * Load event data from the server and update the component state accordingly.
   */
  async loadEvent(){
    this.getIdFromUrl();  // Get the event ID from the URL parameters
    const response = await fetch(`http://192.168.129.237:3000/event/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    if (data.redirect !== undefined) {          // Check if a redirect is required
      const redirectedUrl = data.redirect;
      this.router.navigateByUrl(redirectedUrl); // Redirect to the specified URL
    } else {
      this.eventData = data.data;               // Store the event data
    }
  }


  async loadUser() {
    const response = await fetch(`http://192.168.129.237:3000/getUser`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    if(response.ok){
      const data = await response.json();
      const user = data.data;
      console.log(user);
      
      this.userConcent = user.haveConcent === 1 ? true : false;
    }
   
  }

  /**
   * Retrieves the ID from the URL and assigns it to the 'id' property.
   *
   * @return void
   */
  getIdFromUrl(): void {
    // Extract the event ID from the URL parameters
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  /**
   * A function to toggle the favorite status of an event.
   *
   * @param {number} isFav - the current favorite status
   * @param {number} eventID - the ID of the event
   * @return {Promise<void>} - no return value
   */
  async toggleFavorite(isFav: number, eventID: number){
    let isFavorited = isFav === 0 ? 1 : 0;      // Toggle the favorite status
    const inputData = { isFavorited, eventID };
    
    const response = await fetch(`http://192.168.129.237:3000/event/favorite`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
      body: JSON.stringify(inputData)
    }); 
    this.loadEvent(); // Reload the event details after toggling the favorite status
  }

  /**
   * toggleAsInterested function toggles the user's interest in an event.
   */
  async toggleAsInterested(){
    const eventID = this.eventData.eventCode;
    const isInterested = this.eventData.isInterested === 0 ? 1 : 0;

    const inputData = { eventID, isInterested };

    const response = await fetch(`http://192.168.129.237:3000/event/interested`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
      body: JSON.stringify(inputData)
    });
    this.loadEvent(); // Reload the event details after toggling the attendance status
  }

  /**
   * Asynchronously toggles the user as attending or not attending an event.
   *
   * @return {Promise<void>} This function does not return anything.
   */
  async toggleAsAttending(){
    const eventID = this.eventData.eventCode;
    const isAttending = this.eventData.isAttending === 0 ? 1 : 0;

    const inputData = { eventID, isAttending };

    const response = await fetch(`http://192.168.129.237:3000/event/attending`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
      body: JSON.stringify(inputData)
    });
    this.loadEvent(); // Reload the event details after toggling the attendance status
  }


}
