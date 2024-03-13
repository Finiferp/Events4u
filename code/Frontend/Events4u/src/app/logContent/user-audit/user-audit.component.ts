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
    const response = await fetch(`http://192.168.129.237:3000/audit/user`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
