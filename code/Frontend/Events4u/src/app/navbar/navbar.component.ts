import { Component, Renderer2, OnInit } from '@angular/core';
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
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent implements OnInit {

  public isLoggedIn: boolean = false;
  token = this.localService.getItem("token");
  locations: any[] = [];


  constructor(private renderer: Renderer2, private router: Router, private localService: LocalService, private loginStatusService: LoginStatusService) {
    this.loginStatusService.getLoginStatus().subscribe((data) => {
      this.isLoggedIn = data;
    });


  }

  async ngOnInit() {
    this.fetchLocations();

    const response = await fetch(`http://127.0.0.1:3000/user/loginStatus`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.isLoggedIn = data.isLoggedIn;
  }

  scrollToFooter() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }

  goTo(route: string) {
    this.router.navigateByUrl(route);
  }

  async logout() {
    this.localService.removeItem("token");
    //TODO delete token from DB
    this.router.navigateByUrl("/events");
    this.isLoggedIn = false;
  }

  async fetchLocations() {
    const response = await fetch(`http://127.0.0.1:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data;
  }

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
