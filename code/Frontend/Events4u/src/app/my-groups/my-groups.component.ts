import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { LocalService } from '../local.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-my-groups',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './my-groups.component.html',
  styleUrl: './my-groups.component.scss'
})
export class MyGroupsComponent implements OnInit {
  public groupsData: any[] = [];              // Array to store the user's groups
  public isDialogOpen: boolean = false;       // Flag to track whether the create group dialog is open
  token = this.localService.getItem("token"); // Retrieve token from LocalService
  public allGroupsData: any[] = [];           // Array to store all groups

  constructor(private router: Router, private localService: LocalService) { }
  ngOnInit(): void {
    this.loadGroups();      // Call the loadGroups method when the component initializes
  }

  /**
   * Asynchronously loads groups data from the server.
   */
  async loadGroups() {
    const response = await fetch(`http://192.168.129.237:3000/myGroups`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });

    // Handle unauthorized or forbidden status
    if (response.status === 401 || response.status === 403) {
      this.router.navigateByUrl("/login");
    }
    const data = await response.json();
    this.groupsData = data.data;
    this.loadAllGroups();   // Call the loadAllGroups method when the component initializes
  }


  /**
   * Loads all groups from a specified endpoint and processes the data.
   *
   * @return {void} 
   */
  async loadAllGroups() {
    const response = await fetch(`http://192.168.129.237:3000/groups/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();
    if(data.data){
      this.allGroupsData = data.data;
      this.allGroupsData = this.removeItemsWithSamePK(this.groupsData, this.allGroupsData);
    }else{
      this.allGroupsData = [];
    }
   
    
    

  }


  async applyForGroup(groupID: string) {
    const { value: text } = await Swal.fire({
      input: 'textarea',
      inputLabel: 'Why do you want to join this group?',
      inputPlaceholder: 'Type your message here...',
      inputAttributes: {
        'aria-label': 'Type your message here'
      },
      showCancelButton: true
    });

    if (text) {
      Swal.fire(
        'Applied for Group!',
        '',
        'success'
      )
      const inputData = { "message": text, groupID };
      const response = await fetch(`http://192.168.129.237:3000/user/apply`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `${this.token}`
        },
        body: JSON.stringify(inputData)
      });
      this.loadAllGroups();
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
    const pkSet = new Set(arr1.map(item => item.group_code_PK));
    return arr2.filter(item => !pkSet.has(item.group_code_PK));
  }


  /**
   * toggleDialog - A function to toggle the state of the dialog.
   */
  toggleDialog() {
    this.isDialogOpen = !this.isDialogOpen;
  }

  /**
   * Create a new group.
   *
   * @param {any} newGroup - the new group to be created
   * @return {Promise<void>} a Promise that resolves with no value
   */
  async createGroup(newGroup: any) {
    // console.log(newGroup.value);
    const inputData = { "name": newGroup.value };
    const response = await fetch(`http://192.168.129.237:3000/group/create`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
      body: JSON.stringify(inputData),
    });

    // Redirect to login page if unauthorized
    if (await response.ok) {
      this.loadGroups();
      this.isDialogOpen = false;
    }
  }

  /**
   * A function to navigate to a specific URL based on the given ID.
   *
   * @param {any} id - the ID used to construct the URL
   * @return {void} 
   */
  goTo(id: any) {
    this.router.navigateByUrl('/group/edit/' + id);
  }

  /**
   * A description of the entire function.
   *
   * @param {any} id - description of parameter
   * @return {void} description of return value
   */
  changeTo(id: any) {
    this.router.navigateByUrl('/group/events/' + id);
  }
}
