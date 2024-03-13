import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-attending-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './attending-audit.component.html',
  styleUrl: './attending-audit.component.scss'
})
export class AttendingAuditComponent {
  public data: any[] = [];

  ngOnInit(): void {
      this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/attending`, {
      method: "GET",
    });
    const data = await response.json();
    this.data = data.data;
  }
}
