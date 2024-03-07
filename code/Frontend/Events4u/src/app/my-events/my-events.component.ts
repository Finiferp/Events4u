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

  async exportList(id: any) {
    console.log(id);
    
    try {
      const response = await fetch(`http://127.0.0.1:3000/event/exportList/${id}`, {
        method: "GET"
      });
  
      if (!response.ok) {
        throw new Error('Failed to download PDF');
      }
  
      const blob = await response.blob();
  
      const url = window.URL.createObjectURL(blob);
  
      const a = document.createElement('a');
  
      a.href = url;
  
      a.download = 'exportList.pdf';
  
      document.body.appendChild(a);
  
      a.click();
  
      document.body.removeChild(a);
  
      window.URL.revokeObjectURL(url);
    } catch (error) {
      console.error('Error downloading PDF:', error);
    }
  }

  goTo(url:string){
    this.router.navigateByUrl(url);
  }
}
