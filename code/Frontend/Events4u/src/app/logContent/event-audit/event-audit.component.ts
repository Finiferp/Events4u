import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-event-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './event-audit.component.html',
  styleUrl: './event-audit.component.scss'
})
export class EventAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/event`, {
      method: "GET",
    });
    const data = await response.json();    
    this.data = data.data;
  }
}
