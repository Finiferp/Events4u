import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-group-edit',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './group-edit.component.html',
  styleUrl: './group-edit.component.scss'
})
export class GroupEditComponent implements OnInit {
  public groupData: any = {};
  public usersData: any[] = [];
  public users: any[] = [];
  public showAddUserFormFlag: boolean = false;
  id: any = -1;
  token = this.localService.getItem("token");

  constructor(private route: ActivatedRoute, private localService: LocalService, private router: Router) { }

  ngOnInit(): void {
    this.getIdFromUrl();
    this.loadGroup();
    this.loadGroupUsers();
  }

  async loadGroup() {
    const response = await fetch(`http://127.0.0.1:3000/group/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      }
    });
    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.groupData = data.data;
  }

  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  async loadGroupUsers() {
    const response = await fetch(`http://127.0.0.1:3000/group/users/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      }
    });
    const data = await response.json();
    this.usersData = data.data;

    this.loadUsers();
  }

  async editGroup(name: any) {
    const inputData = { name, groupID: this.id };
    const response = await fetch(`http://127.0.0.1:3000/group/update`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    this.loadGroup();
  }

  async loadUsers() {
    const response = await fetch(`http://127.0.0.1:3000/users`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      }
    });
    const data = await response.json();
    if (this.usersData === null) {
      this.users = data.data;
    } else {
      this.users = this.removeItemsWithSamePK(this.usersData, data.data);
    }
  }

  removeItemsWithSamePK(arr1: any[], arr2: any[]): any[] {
    const pkSet = new Set(arr1.map(item => item.user_code_PK));
    return arr2.filter(item => !pkSet.has(item.user_code_PK));
  }
  showAddUserForm() {
    this.showAddUserFormFlag = !this.showAddUserFormFlag;
  }

  async addUser(userID: any) {
    const inputData = { userID: userID, groupID: this.id };
    const response = await fetch(`http://127.0.0.1:3000/group/user/add`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    const data = await response.json();
    this.loadGroupUsers();
  }

  async deleteUser(userID: any) {
    const result = await Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this event!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    });

    if (!result.isConfirmed) {
      const inputData = { userID: userID, groupID: this.id };
      const response = await fetch(`http://127.0.0.1:3000/group/user/delete`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputData)
      });
      if (response.ok) {
        Swal.fire({
          title: 'Removed!',
          text: 'The user has been removed from the Group.',
          icon: 'success'
        });
        this.loadGroupUsers();
      } else {
        Swal.fire({
          title: 'Error',
          text: 'Something went wrong. Please try again.',
          icon: 'error'
        });
      }
     
    }
  }
}
