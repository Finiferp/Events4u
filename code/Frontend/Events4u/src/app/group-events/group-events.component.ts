import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, ActivatedRoute } from '@angular/router';
import { LocalService } from '../local.service';
@Component({
  selector: 'app-group-events',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './group-events.component.html',
  styleUrl: './group-events.component.scss'
})
export class GroupEventsComponent implements OnInit {
  public eventsData: any[] = [];                // Array to store events data
  id: any;                                      // ID of the group
  token = this.localService.getItem("token");   // Get token from LocalService

  constructor(private router: Router, private route: ActivatedRoute, private localService: LocalService) { }


  async ngOnInit() {
    this.getIdFromUrl();        // Get group ID from the URL
    const response = await fetch(`http://192.168.129.237:3000/group/events/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    // Redirect to login page if unauthorized or forbidden
    if (response.status === 401 || response.status === 403) {
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.eventsData = data.data;

    // Check if the current user is the owner of any events in the group
    if (this.eventsData) {
      let contains = false;
      this.eventsData.forEach((event: any) => {
        if (event.owner_FK === data.userID) {
          contains = true;
        }
      });

      // If the user is not the owner of any events, check if they are an active user in the group
      if (!contains) {
        this.checkActiveUser(data.userID);
      }
    } else {
      this.eventsData = [];
    }
  }

  /**
   * Asynchronously checks if the user is active.
   *
   * @param {number} userID - the ID of the user to check
   * @return {void} 
   */
  async checkActiveUser(userID: number) {
    const response = await fetch(`http://192.168.129.237:3000/group/users/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    // If the user is not an group user, redirect to myEvents page
    const data = await response.json();
    const userArray = data.data;
    if (userArray) {
      let redirect = true;
      userArray.forEach((user: any) => {
        if (user.user_code_PK === userID) {
          redirect = false;
        }
      });
      if (redirect) {
        this.goTo(`/myEvents`);
      }
    } else {
      this.goTo(`/myEvents`);
    }

  }

  /**
   * A description of the entire function.
   *
   * @param {string} url - description of parameter
   * @return {void} description of return value
   */
  goTo(url: string) {
    this.router.navigateByUrl(url);
  }

  /**
   * Gets the ID from the URL and assigns it to the 'id' property.
   */
  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }
}
