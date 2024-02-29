import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-events-location',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './events-location.component.html',
  styleUrl: './events-location.component.scss'
})
export class EventsLocationComponent {
  public eventData: any[] = [];
  public id: any;

  ngOnInit() {
    this.loadEvent();
  }

  constructor(private route: ActivatedRoute, private router: Router) { };


  async loadEvent() {
    this.getIdFromUrl();
    const response = await fetch(`http://127.0.0.1:3000/events/location/${this.id}`, {
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
  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
