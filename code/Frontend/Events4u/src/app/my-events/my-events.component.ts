import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-my-events',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './my-events.component.html',
  styleUrl: './my-events.component.scss'
})
export class MyEventsComponent {
  public eventsData: any[] = [];
  token = this.localService.getItem("token");


  constructor(private router: Router, private localService: LocalService) { }

  async ngOnInit() {
    const response = await fetch(`http://192.168.129.237:3000/myEvents`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }

    const data = await response.json();
    this.eventsData = data.data;
    
  }

  async exportList(id: any) {
    console.log(id);
    
    try {
      const response = await fetch(`http://192.168.129.237:3000/event/exportList/${id}`, {
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
