import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
@Component({
  selector: 'app-my-groups',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './my-groups.component.html',
  styleUrl: './my-groups.component.scss'
})
export class MyGroupsComponent implements OnInit {
  public groupsData: any[] = [];
  public isDialogOpen: boolean = false;

  constructor(private router: Router) {}
  ngOnInit(): void {
    this.loadGroups();
  }

  async loadGroups() {
    const response = await fetch(`http://127.0.0.1:3000/myGroups`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    const data = await response.json();
    this.groupsData = data.data;
  }


  toggleDialog() {
    this.isDialogOpen = !this.isDialogOpen;
  }

  async createGroup(newGroup: any) {
    console.log(newGroup.value);
    const inputData = { "name": newGroup.value };
    const response = await fetch(`http://127.0.0.1:3000/group/create`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData),
    });
    if(await response.ok) {
      this.loadGroups();
      this.isDialogOpen = false;
    }
  }

  goTo(id: any) {
    this.router.navigateByUrl('/group/edit/'+ id);
  }
}
