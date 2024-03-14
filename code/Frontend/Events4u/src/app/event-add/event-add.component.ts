import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-event-add',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-add.component.html',
  styleUrl: './event-add.component.scss'
})
export class EventAddComponent implements OnInit {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;       // ViewChild for categoryDiv element
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef; // ViewChild for locationSelect element

  categories: string[] = [];                  // Array to store selected categories
  options: any[] = [];                        // Array to store options for categories
  locations: any[] = [];                      // Array to store available locations
  groups: any[] = [];                         // Array to store user groups
  public file: any;                           // Variable to store selected file for event image
  public isDialogOpen: boolean = false;       // Variable to track if location dialog is open or not
  token = this.localService.getItem("token"); // Token retrieved from LocalService

  eventAddForm = new FormGroup({         // Form group for event creation form
    title: new FormControl(''),          // Form control for event title
    startDateTime: new FormControl(''),  // Form control for event start date and time
    endDateTime: new FormControl(''),    // Form control for event end date and time
    price: new FormControl(''),          // Form control for event price
    location: new FormControl(''),       // Form control for event location
    categories: new FormControl(''),     // Form control for event categories
    group: new FormControl(''),          // Form control for event group
  });


  constructor(private router: Router, private localService: LocalService) { }

  ngOnInit() {
    this.fetchCategories();                               // Fetch categories from server
    this.fetchLocations();                                // Fetch locations from server
    this.fetchGroups();                                   // Fetch user groups from server
    this.locationSelect.nativeElement.selectedIndex = 0;  // Set location select index to default
    this.eventAddForm.get('group')?.setValue('1');        // Set default group value

  }

  /**
   * Async function to fetch groups from the specified URL using a GET request with proper authorization.
   *
   * @return {Promise<void>} Resolves with the fetched group data
   */
  async fetchGroups() {
    const response = await fetch(`http://192.168.129.237:3000/myGroups`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      }
    });

    // Redirect to login page if unauthorized
    if(response.status === 401 || response.status === 403){
      this.router.navigateByUrl("/login");
    }

    const data = await response.json();
    this.groups = data.data;  // Assign fetched groups to local variable
  }

  /**
   * Fetches locations from the specified URL using the GET method and stores the retrieved data in the 'locations' property.
   *
   * @return {Promise<void>} Promise that resolves once the locations are fetched and stored.
   */
  async fetchLocations() {
    const response = await fetch(`http://192.168.129.237:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data; // Assign fetched locations to local variable
  }

  /**
   * Fetches categories from the specified endpoint using the GET method.
   *
   * @return {Promise<void>} Resolves once the categories are fetched and assigned to this.options
   */
  async fetchCategories() {
    const response = await fetch(`http://192.168.129.237:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.options = data.data; // Assign fetched categories to local variable
  }

  /**
   * Handles the change event when an option is selected.
   *
   * @param {any} selectedValue - the value selected by the user
   * @return {void} 
   */
  onOptionChange(selectedValue: any) {
    if (selectedValue === 'addLocation') {
      this.isDialogOpen = true;                             // Open location dialog if selected option is 'addLocation'
      this.locationSelect.nativeElement.selectedIndex = 0;  // Set location select index to default
    } else {
      this.isDialogOpen = false;                            // Close location dialog for other options
    }
  }



  async onSubmit() {
    // Get form values
    let title = this.eventAddForm.value.title;
    let startDateTime = this.eventAddForm.value.startDateTime;
    let endDateTime = this.eventAddForm.value.endDateTime;
    let price = this.eventAddForm.value.price;
    let location = this.eventAddForm.value.location;
    let categories = this.eventAddForm.value.categories;
    let group = this.eventAddForm.value.group;

    // Check if all required fields are filled
    if (title && startDateTime && endDateTime && price && location && categories && group) {
      const formData = new FormData(); // Create FormData object to send form data
      // Append form data to FormData object
      formData.append("title", title);
      formData.append("startDateTime", startDateTime);
      formData.append("endDateTime", endDateTime);
      formData.append("price", price);
      formData.append("location", location);
      formData.append("categories", categories);
      formData.append("imageUrl", this.file);
      formData.append("group", group);



      const response = await fetch(`http://192.168.129.237:3000/event/create`, {
        method: "POST",
        body: formData,
      });

      if(response.ok){
        // If response is successful, show success message using SweetAlert
        Swal.fire({
          title: 'Created!',
          text: 'Your event has been created.',
          icon: 'success'
        }).then((result) => {
          if (result.isConfirmed) {
            this.router.navigateByUrl('/myEvents'); // Redirect to user's events page 
          }
        });
      }
    }
  }

  /**
   * Adds a category to the list of categories if it is not already included, and updates the input field.
   *
   * @param {string} category - the category to be added
   * @return {void} 
   */
  addCategory(category: string): void {
    if (category && !this.categories.includes(category)) {
      this.categories.push(category); // Add category to selected categories array
      this.updateInputField();        // Update input field with selected categories
    }
  }

  /**
   * Deletes the last category from the list of categories, and updates the input field.
   *
   * @return {void} 
   */
  deleteLastCategory(): void {
    if (this.categories.length > 0) {
      this.categories.pop();    // Remove last category from selected categories array
      this.updateInputField();  // Update input field with selected categories
    }
  }

  /**
   * Update the input field with the joined categories and patch the form value.
   */
  updateInputField(): void {
    const inputField = this.categoryDiv.nativeElement.querySelector('input');   // Get input field element
    inputField.value = this.categories.join(',');                               // Set input field value to selected categories joined by comma
    this.eventAddForm.patchValue({ categories: this.categories.join(',') });    // Patch form value with selected categories
  }

  /**
   * A description of the entire function.
   *
   * @param {any} event - description of parameter
   * @return {void} 
   */
  onFileChange(event: any) {
    this.file = event.target.files[0];  // Get selected file from event
  }

  /**
   * A function to create a new location.
   *
   * @param {any} newLocation - the new location to be created
   * @return {Promise<void>} a promise that resolves when the location is created
   */
  async createLocation(newLocation: any) {

    const inputData = { "adress": newLocation.value };

    const response = await fetch(`http://192.168.129.237:3000/location/add`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData),
    });
    if (await response.ok) {
      this.fetchLocations();      // Fetch locations after adding new location
      this.isDialogOpen = false;  // Close location dialog
    }
  }

  
}

