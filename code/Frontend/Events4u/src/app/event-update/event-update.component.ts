import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-event-update',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-update.component.html',
  styleUrl: './event-update.component.scss'
})
export class EventUpdateComponent {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;

  public eventData: any = {};
  public id: any = -1;
  categories: string[] = [];
  options: any[] = [];
  locations: any[] = [];

  constructor(private route: ActivatedRoute) { };


  eventUpdateForm = new FormGroup({
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
  });
  public file: any;
  public isDialogOpen: boolean = false;

  ngOnInit() {
    this.loadEvent();
    this.fetchCategories();
    this.fetchLocations();    
  }

  async loadEvent(){
    this.getIdFromUrl();
    const response = await fetch(`http://127.0.0.1:3000/event/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();    
    this.eventData = data.data; 

    console.log(this.eventData);
    console.log(this.eventData.eventLocationCode);
    this.locationSelect.nativeElement.selectedIndex = this.eventData.eventLocationCode;

  }

  getIdFromUrl(): void {
    this.route.paramMap.subscribe((params) => {
      this.id = params.get('id');
    });
  }

  async fetchLocations() {
    const response = await fetch(`http://127.0.0.1:3000/location/all`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.locations = data.data;
  }

  async fetchCategories() {
    const response = await fetch(`http://127.0.0.1:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();
    this.options = data.data;
  }

  onOptionChange(selectedValue: any) {
    if (selectedValue === 'addLocation') {
      this.isDialogOpen = true;
      this.locationSelect.nativeElement.selectedIndex = 0;
    } else {
      this.isDialogOpen = false;
    }
  }



  async onSubmit() {
    let eventID = this.eventData.eventCode;
    let title = this.eventUpdateForm.value.title;
    let startDateTime = this.eventUpdateForm.value.startDateTime;
    let endDateTime = this.eventUpdateForm.value.endDateTime;
    let price = this.eventUpdateForm.value.price;
    let location = this.eventUpdateForm.value.location;
    let categories = this.eventUpdateForm.value.categories;
    console.log(eventID,title,startDateTime,endDateTime,price,location,categories);
    
    /*
        if (title && startDateTime && endDateTime && price && location && categories) {
          const formData = new FormData();
          formData.append("title", title);
          formData.append("startDateTime", startDateTime)
          formData.append("endDateTime", endDateTime)
          formData.append("price", price)
          formData.append("location", location)
          formData.append("categories", categories)
          formData.append("imageUrl", this.file);
          
          
    
          const response = await fetch(`http://127.0.0.1:3000/event/create`, {
            method: "POST",
            body: formData,
          });
        }*/
  }

  addCategory(category: string): void {
    if (category && !this.categories.includes(category)) {
      this.categories.push(category);
      this.updateInputField();
    }
  }

  deleteLastCategory(): void {
    if (this.categories.length > 0) {
      this.categories.pop();
      this.updateInputField();
    }
  }

  updateInputField(): void {
    const inputField = this.categoryDiv.nativeElement.querySelector('input');
    inputField.value = this.categories.join(',');
    this.eventUpdateForm.patchValue({ categories: this.categories.join(',') });
  }

  onFileChange(event: any) {
    console.log(event.target.files[0]);
    this.file = event.target.files[0];
  }

  async createLocation(newLocation: any) {

    const inputData = { "adress": newLocation.value };
    
    const response = await fetch(`http://127.0.0.1:3000/location/add`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(inputData),
    });
    if (await response.ok) {
      this.fetchLocations();
      this.isDialogOpen = false;
    }
  }
}
