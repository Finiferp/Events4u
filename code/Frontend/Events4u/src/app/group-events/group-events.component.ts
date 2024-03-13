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
  public eventsData: any[] = [];
  id: any;
  token = this.localService.getItem("token")

  constructor(private router: Router, private route: ActivatedRoute, private localService: LocalService) { }


  async ngOnInit() {
    this.getIdFromUrl();
    const response = await fetch(`http://192.168.129.237:3000/group/events/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    if (response.status === 401 || response.status === 403) {
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.eventsData = data.data;
    if (this.eventsData) {
      let contains = false;
      this.eventsData.forEach((event: any) => {
        if (event.owner_FK === data.userID) {
          contains = true;
        }
      });
      if (!contains) {
        this.checkActiveUser(data.userID);
      }
    } else {
      this.eventsData = [];
    }
  }

  async checkActiveUser(userID: number) {
    const response = await fetch(`http://192.168.129.237:3000/group/users/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

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

  goTo(url: string) {
    this.router.navigateByUrl(url);
  }

  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }
}
