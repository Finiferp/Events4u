import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SearchServiceService } from '../search-service.service';
import { Subscription } from 'rxjs';

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

  constructor(private searchEvent: SearchServiceService) {
    this.clickEventsubscription = this.searchEvent.getSearchEvent().subscribe((data)=>{      
      this.search(data);
    });
  }

  async ngOnInit() {
    const response = await fetch(`http://127.0.0.1:3000/event/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.eventsData = data.data;
  }

  async search(inputData: any){
    console.log(inputData);
    
    const response = await fetch(`http://127.0.0.1:3000/event/search`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    const data = await response.json();
    this.eventsData = data.data;   
    console.log(this.eventsData);

  }
}

