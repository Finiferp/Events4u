import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-review-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './review-audit.component.html',
  styleUrl: './review-audit.component.scss'
})
export class ReviewAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://127.0.0.1:3000/audit/review`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
