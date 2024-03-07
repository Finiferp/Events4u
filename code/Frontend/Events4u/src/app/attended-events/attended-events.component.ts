import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-attended-events',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './attended-events.component.html',
  styleUrl: './attended-events.component.scss'
})
export class AttendedEventsComponent implements OnInit {
  public eventsData: any[] = [];

  constructor( private router: Router) { }

  async ngOnInit() {
    const response = await fetch(`http://127.0.0.1:3000/events/attended`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.eventsData = data.data;
  }


  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
