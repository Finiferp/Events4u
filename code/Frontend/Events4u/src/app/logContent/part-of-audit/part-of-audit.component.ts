import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-part-of-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './part-of-audit.component.html',
  styleUrl: './part-of-audit.component.scss'
})
export class PartOfAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://127.0.0.1:3000/audit/partOf`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
