import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LocalService } from '../local.service';

@Component({
  selector: 'app-event-update',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-update.component.html',
  styleUrl: './event-update.component.scss'
})
export class EventUpdateComponent implements OnInit {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;         // ViewChild for category div
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;   // ViewChild for location select

  public eventData: any = {};                   // Event data object
  public id: any = -1;                          // Event ID
  categories: string[] = [];                    // Array to hold categories
  options: any[] = [];                          // Options array       
  locations: any[] = [];                        // Array to hold locations
  oldImageUrl: string = '';                     // Old image URL
  groups: any[] = [];                           // Array to hold groups
  token = this.localService.getItem("token");   // Token for authentication
  public file: any;                             // File object
  public isDialogOpen: boolean = false;         // Flag for dialog visibility

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) { };


  eventUpdateForm = new FormGroup({   // Form group for event update form
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
    isVisible: new FormControl(true),
    group: new FormControl(''),
  });
 

  ngOnInit() {
    this.loadEvent();         // Load event data
    this.fetchCategories();   // Fetch categories
    this.fetchLocations();    // Fetch locations
    this.fetchGroups();       // Fetch groups
  }

  /**
   * Fetches groups data from a specified URL using a GET request.
   */
  async fetchGroups() {
    const response = await fetch(`http://192.168.129.237:3000/myGroups`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      }
    });
    const data = await response.json();
    this.groups = data.data;  // Assign fetched locations to the component property
  }

  /**
   * Loads an event from the server and updates the UI based on the retrieved data.
   *
   * @return {Promise<void>} a promise that resolves when the event is loaded and UI is updated
   */
  async loadEvent() {
    this.getIdFromUrl();
    const response = await fetch(`http://192.168.129.237:3000/event/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "Authorization": `${this.token}`
      },
    });
    const data = await response.json();

    // Check if the response contains a redirect URL
    if (data.redirect !== undefined) {
      const redirectedUrl = data.redirect;
      this.router.navigateByUrl("/myEvents"); // Redirect to the specified URL
    } else {
      this.eventData = data.data;
      const activeUser = data.activeUser;
      const ownerID = data.data.ownerCode;
      // Redirect if the active user is not the owner of the event
      if(activeUser !== ownerID){
        this.router.navigateByUrl("/myEvents");
      }

      // Set selected location in the location select dropdown
      this.locationSelect.nativeElement.selectedIndex = this.eventData.eventLocationCode;
      // Patch form controls with event data
      this.eventUpdateForm.patchValue({ title: this.eventData.eventTitle });
      this.eventUpdateForm.patchValue({ startDateTime: new Date(this.eventData.startDateTime).toISOString().slice(0, 16) });
      this.eventUpdateForm.patchValue({ endDateTime: new Date(this.eventData.endDateTime).toISOString().slice(0, 16) });
      this.eventUpdateForm.patchValue({ price: this.eventData.eventPrice });
      this.eventUpdateForm.patchValue({ location: this.eventData.eventLocationCode });
      this.eventUpdateForm.get('group')?.setValue('1');
      this.categories = this.eventData.categories;
      this.eventUpdateForm.patchValue({ categories: this.categories.join(',') });
      this.eventUpdateForm.patchValue({ isVisible: this.eventData.isVisible === 1 ? true : false });
      this.oldImageUrl = this.eventData.eventImage;
    }

  }

  /**
   * Get the ID from the URL.
   *
   */
  getIdFromUrl(): void {
    // Subscribe to route parameters and extract the ID
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  /**
   * Fetches locations from the specified URL and updates the locations property with the retrieved data.
   */
  async fetchLocations() {
    const response = await fetch(`http://192.168.129.237:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data;  // Assign fetched locations to the component property
  }

  /**
   * Fetches categories data from a specified URL using a GET request,
   * stores the retrieved data in the 'options' property.
   */
  async fetchCategories() {
    const response = await fetch(`http://192.168.129.237:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.options = data.data; // Assign fetched categories to the component property
  }

  /**
   * A function that handles the change event for the option selection.
   *
   * @param {any} selectedValue - the selected value triggering the change event
   * @return {void} 
   */
  onOptionChange(selectedValue: any) {

    if (selectedValue === 'addLocation') {  // Open dialog for adding location
      this.isDialogOpen = true;
      this.locationSelect.nativeElement.selectedIndex = 0;
    } else {
      this.isDialogOpen = false;            // Close dialog
    }
  }

  /**
   * Submit the form data to update the event information.
   *
   * @return {Promise<void>} Promise that resolves when the event has been updated
   */
  async onSubmit() {
    // Check if all required fields are filled
    let eventID = this.eventData.eventCode;
    let title = this.eventUpdateForm.value.title;
    let startDateTime = this.eventUpdateForm.value.startDateTime;
    let endDateTime = this.eventUpdateForm.value.endDateTime;
    let price = this.eventUpdateForm.value.price;
    let location = this.eventUpdateForm.value.location;
    let categories = this.eventUpdateForm.value.categories;
    let isVisible = this.eventUpdateForm.value.isVisible;
    let group = this.eventUpdateForm.value.group;

    if (eventID && title && startDateTime && endDateTime && price && location && categories && group) {
      const formData = new FormData();  // Create new FormData object
      // Append form data to FormData object
      formData.append("eventID", eventID);
      formData.append("title", title);
      formData.append("startDateTime", startDateTime)
      formData.append("endDateTime", endDateTime)
      formData.append("price", price)
      formData.append("location", location)
      formData.append("categories", categories)
      formData.append("imageUrl", this.file);
      formData.append("oldImageUrl", this.oldImageUrl);
      formData.append("isVisible", isVisible ? '1' : '0');
      formData.append("group", group);



      const response = await fetch(`http://192.168.129.237:3000/event/update`, {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        // Display success message
        Swal.fire({
          title: 'Updated!',
          text: 'Your event has been updated.',
          icon: 'success'
        }).then((result) => {
          if (result.isConfirmed) {
             this.ngOnInit();
          }
        });
       
      }
    }
  }

  /**
   * Adds a category to the list of categories if it is not already included, then updates the input field.
   *
   * @param {string} category - the category to add
   * @return {void} 
   */
  addCategory(category: string): void {
    // If the category is not already present in the array, add it
    if (category && !this.categories.includes(category)) {
      this.categories.push(category);
      this.updateInputField();
    }
  }

  /**
   * Deletes the last category from the list and updates the input field.
   *
   * @return {void} 
   */
  deleteLastCategory(): void {
    // If there are categories in the array, remove the last one
    if (this.categories.length > 0) {
      this.categories.pop();
      this.updateInputField();
    }
  }

  /**
   * Updates the input field with the joined categories and patches the form with updated categories.
   *
   * @return {void} 
   */
  updateInputField(): void {
    // Find the input field in the DOM and update its value with the current list of categories
    const inputField = this.categoryDiv.nativeElement.querySelector('input');
    inputField.value = this.categories.join(',');
    this.eventUpdateForm.patchValue({ categories: this.categories.join(',') }); // Patch the form control with the updated categories
  }

  /**
   * A method to handle file change event.
   *
   * @param {any} event - the event object
   * @return {void} 
   */
  onFileChange(event: any) {
    // console.log(event.target.files[0]);
    this.file = event.target.files[0];
  }

  /**
   * Create a new location using the provided data.
   *
   * @param {any} newLocation - the data for the new location
   * @return {Promise<void>} a Promise that resolves when the location is successfully created
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
      // Fetch updated locations
      this.fetchLocations();
      this.isDialogOpen = false;
    }
  }


  /**
   * Delete a specific event after confirming with the user, and handle the API response accordingly.
   *
   * @return {void} 
   */
  async onDelete() {
    // Display a confirmation dialog using SweetAlert2
    const result = await Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this event!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    });

    // Check if the user confirmed the deletion
    if (result.isConfirmed) {
      const eventID = this.eventData.eventCode;
      const inputData = { eventID };

      const response = await fetch(`http://192.168.129.237:3000/event/delete`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputData)
      });

      // Check if the request was successful
      if (response.ok) {
        // Display a success message using SweetAlert2
        Swal.fire({
          title: 'Deleted!',
          text: 'Your event has been deleted.',
          icon: 'success'
        }).then((result) => {
          // Redirect the user to the 'myEvents' page after the success message is closed
          if (result.isConfirmed) {
            this.router.navigateByUrl('/myEvents');
          }
        });
      } else {
        // Display an error message using SweetAlert2 if the deletion fails
        Swal.fire(
          'Error!',
          'Failed to delete the event.',
          'error'
        );
      }
    }
  }
}
