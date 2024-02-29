import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-my-events',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './my-events.component.html',
  styleUrl: './my-events.component.scss'
})
export class MyEventsComponent {
  public eventsData: any[] = [];

  constructor(private router: Router) { }

  async ngOnInit() {
    const response = await fetch(`http://127.0.0.1:3000/myEvents`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.eventsData = data.data;
    console.log(this.eventsData);
    
  }

  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
