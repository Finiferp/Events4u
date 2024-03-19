import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { LocalService } from '../local.service';


@Component({
  selector: 'app-event-copy',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-copy.component.html',
  styleUrl: './event-copy.component.scss'
})
export class EventCopyComponent {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;         // Reference to category div element 
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;   // Reference to location select element
  @ViewChild('groupSelect', { static: true }) groupSelect!: ElementRef;         // Reference to group select element

  public eventData: any = {};                 // Object to store event data
  public id: any = -1;                        // Initialize id variable
  categories: string[] = [];                  // Array to store categories
  options: any[] = [];                        // Array to store options
  locations: any[] = [];                      // Array to store locations
  groups: any[] = [];                         // Array to store groups
  token = this.localService.getItem("token"); // Get token from local storage
  public file: any;                           // Initialize file variable
  public isDialogOpen: boolean = false;       // Initialize dialog state

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) { };

  // Define form group for event addition
  eventAddForm = new FormGroup({
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
    group: new FormControl(0),
  });


  ngOnInit() {
    this.loadEvent();       // Load event data
    this.fetchCategories(); // Fetch categories
    this.fetchLocations();  // Fetch locations
    this.fetchGroups();     // Fetch groups
  }

  /**
   * Fetches groups from the specified URL using a GET request
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
    this.groups = data.data;  // Set groups array
  }

  /**
   * Loads an event from the server and performs various operations based on the retrieved data.
   *
   * @return {Promise<void>} A promise indicating the completion of the function
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

    if (data.redirect !== undefined) {      // Redirect to myEvents if redirection is specified
      this.router.navigateByUrl("/myEvents");
    } else {
      this.eventData = data.data;
      const activeUser =data.activeUser;
      const ownerID = data.data.ownerCode;
      if(activeUser !== ownerID){         // Redirect to myEvents if active user is not the owner
        this.router.navigateByUrl("/myEvents");
      }

      // Set form values
      this.locationSelect.nativeElement.selectedIndex = this.eventData.eventLocationCode;
      this.eventAddForm.patchValue({ title: this.eventData.eventTitle });
      this.eventAddForm.patchValue({ startDateTime: new Date(this.eventData.startDateTime).toISOString().slice(0, 16) });
      this.eventAddForm.patchValue({ endDateTime: new Date(this.eventData.endDateTime).toISOString().slice(0, 16) });
      this.eventAddForm.patchValue({ price: this.eventData.eventPrice });
      this.eventAddForm.patchValue({ location: this.eventData.eventLocationCode });
      this.eventAddForm.get('group')?.setValue(1);
      this.eventAddForm.patchValue({ categories: this.eventData.categories });
      this.categories = this.eventData.categories;      
    }

  }

  /**
   * Get the ID from the URL.
   */
  getIdFromUrl(): void {
    // Get id parameter from URL
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  /**
   * Asynchronously fetches locations from the specified URL.
   *
   * @return {Promise<void>} The function does not return a value explicitly, but it fetches locations and stores them in the 'locations' property of the class instance.
   */
  async fetchLocations() {
    const response = await fetch(`http://192.168.129.237:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data;   // Set locations array
  }

  /**
   * Fetches categories from a specific URL and sets the options based on the retrieved data.
   */
  async fetchCategories() {
    const response = await fetch(`http://192.168.129.237:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.options = data.data;   // Set options array
  }

  /**
   * A description of the entire function.
   *
   * @param {any} selectedValue - description of parameter
   */
  onOptionChange(selectedValue: any) {
    if (selectedValue === 'addLocation') {  // Open dialog for adding location
      this.isDialogOpen = true;
      this.locationSelect.nativeElement.selectedIndex = 0;
    } else {                                // Close dialog
      this.isDialogOpen = false;
    }
  }


  /**
   * A description of the entire function.
   *
   * @param {string} category - description of parameter
   * @return {void} description of return value
   */
  addCategory(category: string): void {   // Add category if not already present & update input field
    if (category && !this.categories.includes(category)) {
      this.categories.push(category);
      this.updateInputField();
    }
  }

  /**
   * Deletes the last category in the list if there are any categories present.
   */
  deleteLastCategory(): void {
    if (this.categories.length > 0) { // Delete last category & update input field
      this.categories.pop();
      this.updateInputField();
    }
  }

  /**
   * Update the input field with the joined categories and patch the form value.
   *
   * @return {void} No return value
   */
  updateInputField(): void {
    const inputField = this.categoryDiv.nativeElement.querySelector('input');
    inputField.value = this.categories.join(',');
    this.eventAddForm.patchValue({ categories: this.categories.join(',') });
  }

  /**
   * A description of the entire function.
   *
   * @param {any} event - description of parameter
   * @return {void} description of return value
   */
  onFileChange(event: any) {
    // console.log(event.target.files[0]);
    this.file = event.target.files[0];
  }

  /**
   * Creates a new location.
   *
   * @param {any} newLocation - the new location to be created
   * @return {Promise<void>} 
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
      this.fetchLocations();      // Fetch updated locations
      this.isDialogOpen = false;  // Close dialog
    }
  }


  /**
   * A description of the entire function.
   *
   * @param {type} paramName - description of parameter
   * @return {type} description of return value
   */
  async onSubmit() {
    // Handle form submission
    let title = this.eventAddForm.value.title;
    let startDateTime = this.eventAddForm.value.startDateTime;
    let endDateTime = this.eventAddForm.value.endDateTime;
    let price = this.eventAddForm.value.price;
    let location = this.eventAddForm.value.location;
    let categories = this.eventAddForm.value.categories;
    let group = this.eventAddForm.value.group;    

    if (title && startDateTime && endDateTime && price && location && categories && group) {
      const formData = new FormData();  // Create new FormData object
      // Append form data to FormData object
      formData.append("title", title);
      formData.append("startDateTime", startDateTime)
      formData.append("endDateTime", endDateTime)
      formData.append("price", price)
      formData.append("location", location)
      formData.append("categories", categories)
      formData.append("imageUrl", this.file);
      formData.append("group", group+"");



      const response = await fetch(`http://192.168.129.237:3000/event/create`, {
        method: "POST",
        body: formData,
      });

      if(response.ok){
        // If response is ok, show success message
        Swal.fire({
          title: 'Created!',
          text: 'Your event has been created.',
          icon: 'success'
        }).then((result) => {
          if (result.isConfirmed) {
            this.router.navigateByUrl('/myEvents'); // Redirect to myEvents page
          }
        });
      }
    }
  }
}
