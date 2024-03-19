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
  public groupData: any = {};                   // Object to store group data
  public usersData: any[] = [];                 // Array to store group users data
  public users: any[] = [];                     // Array to store all users
  public showAddUserFormFlag: boolean = false;  // Flag to control display of add user form
  id: any = -1;                                 // Variable to store group ID
  token = this.localService.getItem("token");   // Variable to store token from local storage

  constructor(private route: ActivatedRoute, private localService: LocalService, private router: Router) { }

  ngOnInit(): void {
    this.getIdFromUrl();    // Call method to get ID from URL
    this.loadGroup();       // Call method to load group data
    this.loadGroupUsers();  // Call method to load group users
  }

  /**
   * Asynchronously loads the group data from the specified API endpoint using the current instance's ID and token for authentication.
   */
  async loadGroup() {
    const response = await fetch(`http://192.168.129.237:3000/group/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      }
    });
    // Handle unauthorized or forbidden status
    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.groupData = data.data;
  }

  /**
   * Retrieves the ID from the URL using the route parameter map subscription.
   */
  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  /**
   * Load group users asynchronously.
   */
  async loadGroupUsers() {
    const response = await fetch(`http://192.168.129.237:3000/group/users/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      }
    });
    const data = await response.json();
    this.usersData = data.data;

    this.loadUsers();
  }

  /**
   * A description of the entire function.
   *
   * @param {any} name - description of parameter
   * @return {Promise<void>} description of return value
   */
  async editGroup(name: any) {
    const inputData = { name, groupID: this.id };
    const response = await fetch(`http://192.168.129.237:3000/group/update`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    this.loadGroup();
  }

  /**
   * Load users from a remote server and update the local users data.
   *
   * @return {Promise<void>} A promise that resolves once the data is loaded and updated.
   */
  async loadUsers() {
    const response = await fetch(`http://192.168.129.237:3000/users`, {
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

    const ownerName = this.groupData.owner_name;
    console.log(this.users);
    
    let indexToRemove = this.users.findIndex(user => user.user_name === ownerName);
    console.log(indexToRemove);
    
    if (indexToRemove !== -1) {
      this.users.splice(indexToRemove,1);
    }
  }

  /**
   * Removes items from arr2 that have the same primary key as any item in arr1.
   *
   * @param {any[]} arr1 - array of items
   * @param {any[]} arr2 - array of items
   * @return {any[]} filtered array
   */
  removeItemsWithSamePK(arr1: any[], arr2: any[]): any[] {
    const pkSet = new Set(arr1.map(item => item.user_code_PK));
    return arr2.filter(item => !pkSet.has(item.user_code_PK));
  }

  /**
   * showAddUserForm - A description of the entire function.
   */
  showAddUserForm() {
    this.showAddUserFormFlag = !this.showAddUserFormFlag;
  }

  /**
   * Add a new user to the group using the provided userID.
   *
   * @param {any} userID - The ID of the user to be added.
   * @return {void} No return value.
   */
  async addUser(userID: any) {
    const inputData = { userID: userID, groupID: this.id };
    const response = await fetch(`http://192.168.129.237:3000/group/user/add`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData)
    });
    const data = await response.json();
    this.loadGroupUsers();
  }

  /**
   * A description of the entire function.
   *
   * @param {any} userID - description of parameter
   * @return {Promise<void>} description of return value
   */
  async deleteUser(userID: any) {
    // Confirm user deletion with SweetAlert
    const result = await Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this event!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    });

    // If user confirms deletion
    if (!result.isConfirmed) {
      // Delete user from the group
      const inputData = { userID: userID, groupID: this.id };
      const response = await fetch(`http://192.168.129.237:3000/group/user/delete`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputData)
      });

      // If deletion is successful, show success message and reload group users data
      if (response.ok) {
        Swal.fire({
          title: 'Removed!',
          text: 'The user has been removed from the Group.',
          icon: 'success'
        });
        this.loadGroupUsers();
      } else {
        // If deletion fails, show error message
        Swal.fire({
          title: 'Error',
          text: 'Something went wrong. Please try again.',
          icon: 'error'
        });
      }
     
    }
  }
}
