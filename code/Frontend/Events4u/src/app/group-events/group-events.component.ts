import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, ActivatedRoute } from '@angular/router';
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
  constructor(private router: Router, private route: ActivatedRoute) {}
  

  async ngOnInit() {
    this.getIdFromUrl();
    const response = await fetch(`http://127.0.0.1:3000/group/events/${this.id}`, {
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

  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }
}
