import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-group-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './group-audit.component.html',
  styleUrl: './group-audit.component.scss'
})
export class GroupAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/group`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
