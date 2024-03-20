import { Component, Renderer2, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CategoryDropdownComponent } from '../category-dropdown/category-dropdown.component';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';
import { LoginStatusService } from '../login-status.service';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, CategoryDropdownComponent],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss',
})
export class NavbarComponent implements OnInit {
  @ViewChild('dropdown') dropdown!: CategoryDropdownComponent;  // Using ViewChild to access the CategoryDropdownComponent

  panelState: string = 'closed';                // State variable for sidebar panel
  public isLoggedIn: boolean = false;           // Flag to track user login status
  token = this.localService.getItem("token");   // Retrieving token from local storage
  locations: any[] = [];                        // Array to store locations data
  public isAdmin: boolean = false;              // Flag to track user admin status
  showSidebar = false;                          // Flag to control the visibility of the sidebar
  showDropdown: boolean = false;                // Flag to control the visibility of the dropdown menu

  /**
   * toggleDropdown - A function to toggle the dropdown display
   */
  toggleDropdown() {
    this.showDropdown = !this.showDropdown;
  }

  /**
   * toggleSidebar - A function to toggle the visibility of the sidebar.
   */
  toggleSidebar() {
    this.showSidebar = !this.showSidebar;
  }


  constructor(private renderer: Renderer2, private router: Router, private localService: LocalService,
    private loginStatusService: LoginStatusService) {
    this.loginStatusService.getLoginStatus().subscribe((data) => {
      this.isLoggedIn = data;      
      if(this.isLoggedIn ){
        this.checkAdmin();
      }
    });
  }

  async ngOnInit() {
    this.fetchLocations(); // Fetch locations

    const response = await fetch(`http://192.168.129.237:3000/user/loginStatus`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.isLoggedIn = data.isLoggedIn;
    // Check if user is logged in, if so check if the user is an admin
    if (this.isLoggedIn) {
      this.checkAdmin();
    }
  }

  /**
   * Scrolls to the footer of the window using smooth behavior.
   */
  scrollToFooter() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }

  /**
   * Navigates to the specified route and empties the search dropdown.
   *
   * @param {string} route - the route to navigate to
   */
  goTo(route: string) {
    this.router.navigateByUrl(route);
    this.dropdown.emptyTheSearch();
  }

  /**
   * A method to log out the user by removing the token from local storage, redirecting to the events page, and setting the isLoggedIn flag to false.
   *
   */
  async logout() {
    this.localService.removeItem("token");
    this.router.navigateByUrl("/events");
    this.isLoggedIn = false;
  }

  /**
   * Fetches locations from a specified URL using a GET request.
   */ 
  async fetchLocations() {
    const response = await fetch(`http://192.168.129.237:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data;
  }

  /**
   * Asynchronously checks the admin status of the user.
   */
  async checkAdmin() {
    this.token = this.localService.getItem("token");   // Retrieving the new token from local storage
    
    const response = await fetch(`http://192.168.129.237:3000/user/adminStatus`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    const admin = data.data.isAdmin;
    this.isAdmin = admin === 1 ? true : false;     
  }

  /**
   * Changes the location based on the provided locationId.
   *
   * @param {string} locationId - the ID of the new location
   */
  changeLocation(locationId: string) {
    if (locationId !== "-1") {
      this.router.navigateByUrl(`/events`, { skipLocationChange: true }).then(() =>
        this.router.navigate([`/event/location/${locationId}`])
      );
    } else {
      this.router.navigateByUrl(`/events`);
    }
  }
}
