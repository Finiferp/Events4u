import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-belongs-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './belongs-audit.component.html',
  styleUrl: './belongs-audit.component.scss'
})
export class BelongsAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/belongs`, {
      method: "GET",
    });
    const data = await response.json();
    this.data = data.data;
  }
}
