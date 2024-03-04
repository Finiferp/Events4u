import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-user-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-audit.component.html',
  styleUrl: './user-audit.component.scss'
})
export class UserAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://127.0.0.1:3000/audit/user`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
