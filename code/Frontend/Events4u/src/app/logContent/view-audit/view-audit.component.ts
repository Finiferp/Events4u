import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-view-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './view-audit.component.html',
  styleUrl: './view-audit.component.scss'
})
export class ViewAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch('http://127.0.0.1:3000/audit/view', {
      method: 'GET',
    })
    const data = await response.json();
    this.data = data.data;
  }
}
