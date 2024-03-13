import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-interested-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './interested-audit.component.html',
  styleUrl: './interested-audit.component.scss'
})
export class InterestedAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
      this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/interested`, {
      method: "GET",
    });
    const data = await response.json();
    this.data = data.data;
  }
}
