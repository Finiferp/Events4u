import { Component, Renderer2, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CategoryDropdownComponent } from '../category-dropdown/category-dropdown.component';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';
import { LoginStatusService } from '../login-status.service';
import { SidebarModule } from 'primeng/sidebar';
import { ButtonModule } from 'primeng/button';


@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, CategoryDropdownComponent, SidebarModule, ButtonModule],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent implements OnInit {
  @ViewChild('dropdown') dropdown!: CategoryDropdownComponent;

  public isLoggedIn: boolean = false;
  token = this.localService.getItem("token");
  locations: any[] = [];
  public isAdmin: boolean = false;
  sidebarVisible: boolean = false;


  constructor(private renderer: Renderer2, private router: Router, private localService: LocalService,
     private loginStatusService: LoginStatusService) {
    this.loginStatusService.getLoginStatus().subscribe((data) => {
      this.isLoggedIn = data;
    });
  }

  toggleSideBar(){
    this.sidebarVisible = !this.sidebarVisible;
    console.log(this.sidebarVisible);
    
  }

  async ngOnInit() {
    this.fetchLocations();

    const response = await fetch(`http://192.168.129.237:3000/user/loginStatus`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.isLoggedIn = data.isLoggedIn;
    if(this.isLoggedIn){
      this.checkAdmin();
    }
  }

  scrollToFooter() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }

  goTo(route: string) {
    this.router.navigateByUrl(route);
    this.dropdown.emptyTheSearch();
  }

  async logout() {
    this.localService.removeItem("token");
    this.router.navigateByUrl("/events");
    this.isLoggedIn = false;
  }

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

  async checkAdmin() {
    const response = await fetch(`http://192.168.129.237:3000/user/adminStatus`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.isAdmin = data.data.isAdmin;
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
