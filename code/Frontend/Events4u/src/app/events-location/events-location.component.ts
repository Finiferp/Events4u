import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, ActivatedRoute  } from '@angular/router';
import { LocalService } from '../local.service';



@Component({
  selector: 'app-events-location',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-location.component.html',
  styleUrl: './events-location.component.scss'
})
export class EventsLocationComponent {
  public eventData: any[] = [];                 // Array to store event data retrieved from the server
  public id: any;                               // Variable to store the location ID
  token = this.localService.getItem("token");   // Retrieve token from local storage
  ngOnInit() {
    this.loadEvent(); // Call the method to load event data
  }

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) {}

  /**
   * Load an event by fetching data from a specific URL based on the ID obtained from the URL.
   */
  async loadEvent() {
    this.getIdFromUrl();  // Extract location ID from the URL
    // Fetch event data from the server based on the location ID
    const response = await fetch(`http://192.168.129.237:3000/events/location/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.eventData = data.data; // Assign retrieved event data to eventData array
  }

  /**
   * This function retrieves the ID from the URL using the route parameter map.
   *
   * @return {void} 
   */
  getIdFromUrl(): void {
    // Get location ID from route parameters
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
      
    });    
  }

  /**
   * A description of the entire function.
   *
   * @param {string} url - description of parameter
   * @return {void} description of return value
   */
  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
