import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchServiceService } from '../search-service.service';
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute } from '@angular/router';
import { LocalService } from '../local.service';
import { LoginStatusService } from '../login-status.service';


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


  constructor(private searchEvent: SearchServiceService, private router: Router, private localService: LocalService, private route: ActivatedRoute, private loginStatusService: LoginStatusService) {
    this.clickEventsubscription = this.searchEvent.getSearchEvent().subscribe((data) => {
      this.search(data);
    });
  }

  async ngOnInit() {
    this.authenticate();
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


  async authenticate() {
    console.log("TRying");
    
    // Subscribe to route parameters to get the 'code' value
    this.route.queryParams.subscribe(async params => {
      const code = params['code'];
      if(code){
        console.log("yess");
        
        const inputData = { "code": code };

        const response = await fetch(`http://192.168.129.237:3000/luxId/authenticate`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(inputData)
        });
        const data = await response.json();
        const { email, firstName, lastName, password, login } = data;
        console.log(email, firstName, lastName, password, login);
        

        if(!login) {
          const inputData = { firstName, lastName, email, password }
          const response = await fetch('http://192.168.129.237:3000/user/register', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(inputData)
          });
        }

          const inputData2 = { email, password };
          const response2 = await fetch('http://192.168.129.237:3000/user/login', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(inputData2)
          });

          if (response2.ok) {
            const data2 = await response2.json();
            const token = data2.token;
            this.localService.setItem('token', token);
            this.router.navigateByUrl('/myEvents');
            this.loginStatusService.sendLoginStatus(true);
          }
        }
    });

  }
}

