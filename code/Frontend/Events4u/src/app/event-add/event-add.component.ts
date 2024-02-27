import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';


@Component({
  selector: 'app-event-add',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-add.component.html',
  styleUrl: './event-add.component.scss'
})
export class EventAddComponent implements OnInit {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;

  categories: string[] = [];
  options: any[] = [];
  locations: any[] = [];

  eventAddForm = new FormGroup({
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
    this.fetchCategories();
    this.fetchLocations();
    this.locationSelect.nativeElement.selectedIndex = 0;

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
    let title = this.eventAddForm.value.title;
    let startDateTime = this.eventAddForm.value.startDateTime;
    let endDateTime = this.eventAddForm.value.endDateTime;
    let price = this.eventAddForm.value.price;
    let location = this.eventAddForm.value.location;
    let categories = this.eventAddForm.value.categories;
    
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
        }
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
    this.eventAddForm.patchValue({ categories: this.categories.join(',') });
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

