import { Component, OnInit  } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-event-details',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './event-details.component.html',
  styleUrl: './event-details.component.scss'
})
export class EventDetailsComponent implements OnInit {
  public eventData: any = {};
  public id: any = -1;

  constructor(private route: ActivatedRoute) { };

  async ngOnInit() {
    this.loadEvent()
  } 

  async loadEvent(){
    this.getIdFromUrl();
    const response = await fetch(`http://127.0.0.1:3000/event/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();    
    this.eventData = data.data; 
  }

  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  async toggleFavorite(isFav: number, eventID: number){
    let isFavorited = isFav === 0 ? 1 : 0;
    const inputData = { isFavorited, eventID };
    
    const response = await fetch(`http://127.0.0.1:3000/event/favorite`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    }); 
    this.loadEvent();
  }
}
