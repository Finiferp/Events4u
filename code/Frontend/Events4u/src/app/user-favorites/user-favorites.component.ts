import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, ActivatedRoute  } from '@angular/router';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-user-favorites',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-favorites.component.html',
  styleUrl: './user-favorites.component.scss'
})
export class UserFavoritesComponent {
  public eventData: any[] = [];                 // Array to store event data retrieved from the server
  token = this.localService.getItem("token");   // Retrieve token from local storage
  ngOnInit() {
    this.loadEvent(); // Call the method to load event data
  }

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) {}

  /**
   * Load an event by fetching data from a specific URL based on the ID obtained from the URL.
   */
  async loadEvent() {
    // If token is null it means user is not logged in, redirect to login
    if(this.token === null){
      this.router.navigateByUrl("/login");
    }
    // Fetch event data from the server based on the location ID
    const response = await fetch(`http://192.168.129.237:3000/user/favorites`, {
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
   * A description of the entire function.
   *
   * @param {string} url - description of parameter
   * @return {void} description of return value
   */
  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}

