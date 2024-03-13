import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchServiceService } from '../search-service.service';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-events-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-list.component.html',
  styleUrl: './events-list.component.scss'
})
export class EventsListComponent implements OnInit {
  public eventsData: any[] = [];
  clickEventsubscription: Subscription;
  token = this.localService.getItem("token");


  constructor(private searchEvent: SearchServiceService, private router: Router, private localService: LocalService) {
    this.clickEventsubscription = this.searchEvent.getSearchEvent().subscribe((data)=>{      
      this.search(data);
    });
  }

  async ngOnInit() {
    const response = await fetch(`http://192.168.129.237:3000/event/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    this.eventsData = data.data;
  }

  async search(inputData: any){    
    const response = await fetch(`http://192.168.129.237:3000/event/search`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    const data = await response.json();
    this.eventsData = data.data;   
  }

  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}

