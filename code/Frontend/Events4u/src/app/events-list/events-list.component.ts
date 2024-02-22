import { Component, OnInit, AfterViewChecked } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-events-list',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-list.component.html',
  styleUrl: './events-list.component.scss'
})
export class EventsListComponent implements OnInit {
  public eventsData: any[] = [];
  async ngOnInit() {
    const response = await fetch(`http://127.0.0.1:3000/event/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();    
    this.eventsData = data.data; 
    console.log(this.eventsData[0].eventImage);
    
  }  
}
