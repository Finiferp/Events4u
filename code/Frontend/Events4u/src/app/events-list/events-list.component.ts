import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchServiceService } from '../search-service.service';
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute, NavigationExtras } from '@angular/router';
import { LocalService } from '../local.service';
import { LoginStatusService } from '../login-status.service';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-events-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-list.component.html',
  styleUrl: './events-list.component.scss'
})
export class EventsListComponent implements OnInit {
  public eventsData: any[] = [];                      // Array to store the fetched events
  clickEventsubscription: Subscription;               // Subscription to listen for search events
  token = this.localService.getItem("token");         // Retrieve token from local storage


  constructor(private searchEvent: SearchServiceService,
    private router: Router,
    private localService: LocalService,
    private route: ActivatedRoute,
    private loginStatusService: LoginStatusService) {
    this.clickEventsubscription = this.searchEvent.getSearchEvent().subscribe((data) => {
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

    this.route.queryParams.subscribe(async params => {
      const code = params['code'];
      const state = params['state'];
      const urlWithoutParams = window.location.pathname;                  // Get the current URL without parameters
      window.history.replaceState({}, document.title, urlWithoutParams);  // Replace the current URL with the URL without parameters

      if (code !== undefined && state !== undefined) {
        this.authenticate(code, state);
      }

    });

  }

  /**
   * Asynchronously searches for data using the provided input data.
   *
   * @param {any} inputData - the input data for the search
   * @return {void} 
   */
  async search(inputData: any) {
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
  goTo(url: string) {
    this.router.navigateByUrl(url);
  }

  /**
   * Authenticates the user using the provided code and state.
   *
   * @param {any} code - The code used for authentication.
   * @param {any} state - The state associated with the authentication.
   * @return {Promise<void>} A promise that resolves when the authentication is complete.
   */
  async authenticate(code: any, state: any) {

    const inputData = { "code": code, state };



    const response = await fetch(`http://192.168.129.237:3000/luxId/authenticate`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    if (response.ok) {

      const data = await response.json();
      const { information, login } = data;
      if (login) {
        this.localService.setItem('token', information);
        this.router.navigateByUrl('/myEvents');
        this.loginStatusService.sendLoginStatus(true);
      } else {
        Swal.fire({
          title: "Terms and Conditions",
          html: `<p>To use your register on our website you have to accept the terms and conditions.<br> If you accept you give the concent to show your full name when you comment on events, apply or are invited for groups, create an event or group, and if you mark an event as attending or interested, so that the owner can see who is interested in his event. This is valid as long as you have an account  </p>`,
          icon: 'info',
          confirmButtonText: 'Accept',
          cancelButtonText: 'Decline',
          showCancelButton: true,
        }).then((result) => {
          if (result.isConfirmed) {
            this.localService.setItem('token', information);
            this.router.navigateByUrl('/myEvents');
            this.loginStatusService.sendLoginStatus(true);
          } else {
            Swal.fire({
              title: "Can't register",
              text: "You can not register without accepting the terms and conditions",
              icon: 'error'
            })
            this.router.navigateByUrl('/register');
          }
        }
        );
      }


    }
  }
}

