import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-favorite-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './favorite-audit.component.html',
  styleUrl: './favorite-audit.component.scss'
})
export class FavoriteAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
    this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://127.0.0.1:3000/audit/favorite`, {
      method: "GET",
    })
    const data = await response.json();
    this.data = data.data;
  }
}
