import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-category-audit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './category-audit.component.html',
  styleUrl: './category-audit.component.scss'
})
export class CategoryAuditComponent implements OnInit {
  public data: any[] = [];

  ngOnInit(): void {
      this.fetchInfo();
  }

  async fetchInfo() {
    const response = await fetch(`http://192.168.129.237:3000/audit/category`, {
      method: "GET",
    });
    const data = await response.json();
    this.data = data.data;
  }

}
