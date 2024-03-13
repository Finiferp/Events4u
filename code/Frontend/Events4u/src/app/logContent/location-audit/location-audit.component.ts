import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-location-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './location-audit.component.html',
  styleUrl: './location-audit.component.scss'
})
export class LocationAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/location`, {
      method: 'GET',
    })
    const data = await response.json();
    this.data = data.data;
  }
}
