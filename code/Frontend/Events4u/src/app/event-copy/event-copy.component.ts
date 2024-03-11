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
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;
  @ViewChild('groupSelect', { static: true }) groupSelect!: ElementRef;

  public eventData: any = {};
  public id: any = -1;
  categories: string[] = [];
  options: any[] = [];
  locations: any[] = [];
  groups: any[] = [];
  token = this.localService.getItem("token");

  constructor(private route: ActivatedRoute, private router: Router, private localService: LocalService) { };


  eventAddForm = new FormGroup({
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
    isVisible: new FormControl(true),
    group: new FormControl(0),
  });
  public file: any;
  public isDialogOpen: boolean = false;

  ngOnInit() {
    this.loadEvent();
    this.fetchCategories();
    this.fetchLocations();
    this.fetchGroups();
  }

  async fetchGroups() {
    const response = await fetch(`http://127.0.0.1:3000/myGroups`, {
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
    this.groups = data.data;
  }

  async loadEvent() {
    this.getIdFromUrl();
    const response = await fetch(`http://127.0.0.1:3000/event/${this.id}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();

    if (data.redirect !== undefined) {
      this.router.navigateByUrl("/myEvents");
    } else {
      this.eventData = data.data;
      this.locationSelect.nativeElement.selectedIndex = this.eventData.eventLocationCode;
      
      this.eventAddForm.patchValue({ title: this.eventData.eventTitle });
      this.eventAddForm.patchValue({ startDateTime: new Date(this.eventData.startDateTime).toISOString().slice(0, 16) });
      this.eventAddForm.patchValue({ endDateTime: new Date(this.eventData.endDateTime).toISOString().slice(0, 16) });
      this.eventAddForm.patchValue({ price: this.eventData.eventPrice });
      this.eventAddForm.patchValue({ location: this.eventData.eventLocationCode });
      this.eventAddForm.get('group')?.setValue(1);
      this.eventAddForm.patchValue({ categories: this.eventData.categories });
      this.categories = this.eventData.categories;
      this.eventAddForm.patchValue({ isVisible: this.eventData.isVisible === 1 ? true : false });
      
    }

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
    // console.log(event.target.files[0]);
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


  async onSubmit() {
    let title = this.eventAddForm.value.title;
    let startDateTime = this.eventAddForm.value.startDateTime;
    let endDateTime = this.eventAddForm.value.endDateTime;
    let price = this.eventAddForm.value.price;
    let location = this.eventAddForm.value.location;
    let categories = this.eventAddForm.value.categories;
    let group = this.eventAddForm.value.group;    

    if (title && startDateTime && endDateTime && price && location && categories && group) {
      const formData = new FormData();
      formData.append("title", title);
      formData.append("startDateTime", startDateTime)
      formData.append("endDateTime", endDateTime)
      formData.append("price", price)
      formData.append("location", location)
      formData.append("categories", categories)
      formData.append("imageUrl", this.file);
      formData.append("group", group+"");



      const response = await fetch(`http://127.0.0.1:3000/event/create`, {
        method: "POST",
        body: formData,
      });

      if(response.ok){
        Swal.fire({
          title: 'Created!',
          text: 'Your event has been created.',
          icon: 'success'
        }).then((result) => {
          if (result.isConfirmed) {
            this.router.navigateByUrl('/myEvents');  
          }
        });
      }
    }
  }
}
