import { Component, ElementRef, ViewChild, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-event-update',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './event-update.component.html',
  styleUrl: './event-update.component.scss'
})
export class EventUpdateComponent implements OnInit {
  @ViewChild('categoryDiv', { static: true }) categoryDiv!: ElementRef;
  @ViewChild('locationSelect', { static: true }) locationSelect!: ElementRef;

  public eventData: any = {};
  public id: any = -1;
  categories: string[] = [];
  options: any[] = [];
  locations: any[] = [];
  oldImageUrl: string = '';
  groups: any[] = [];

  constructor(private route: ActivatedRoute, private router: Router) { };


  eventUpdateForm = new FormGroup({
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
    isVisible: new FormControl(true),
    group: new FormControl(''),
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
      }
    });
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
      const redirectedUrl = data.redirect;
      this.router.navigateByUrl(redirectedUrl); // TODO go back to myevents
    } else {
      this.eventData = data.data;
      this.locationSelect.nativeElement.selectedIndex = this.eventData.eventLocationCode;

      this.eventUpdateForm.patchValue({ title: this.eventData.eventTitle });
      this.eventUpdateForm.patchValue({ startDateTime: new Date(this.eventData.startDateTime).toISOString().slice(0, 16) });
      this.eventUpdateForm.patchValue({ endDateTime: new Date(this.eventData.endDateTime).toISOString().slice(0, 16) });
      this.eventUpdateForm.patchValue({ price: this.eventData.eventPrice });
      this.eventUpdateForm.patchValue({ location: this.eventData.eventLocationCode });
      this.eventUpdateForm.get('group')?.setValue('1');
      this.categories = this.eventData.categories;
      this.eventUpdateForm.patchValue({ isVisible: this.eventData.isVisible === 1 ? true : false });
      this.oldImageUrl = this.eventData.eventImage;
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



  async onSubmit() {
    let eventID = this.eventData.eventCode;
    let title = this.eventUpdateForm.value.title;
    let startDateTime = this.eventUpdateForm.value.startDateTime;
    let endDateTime = this.eventUpdateForm.value.endDateTime;
    let price = this.eventUpdateForm.value.price;
    let location = this.eventUpdateForm.value.location;
    let categories = this.eventUpdateForm.value.categories;
    let isVisible = this.eventUpdateForm.value.isVisible;
    let group = this.eventUpdateForm.value.group;
    //console.log(eventID,title,startDateTime,endDateTime,price,location,categories);
    console.log(group);
    
    // console.log(this.oldImageUrl);
    if (eventID && title && startDateTime && endDateTime && price && location && categories && group) {
      const formData = new FormData();
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

      

      const response = await fetch(`http://127.0.0.1:3000/event/update`, {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        this.ngOnInit();
      }
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
    this.eventUpdateForm.patchValue({ categories: this.categories.join(',') });
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


  async onDelete() {
    const result = await Swal.fire({
      title: 'Are you sure?',
      text: 'You will not be able to recover this event!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    });

    if (result.isConfirmed) {
      const eventID = this.eventData.eventCode;
      const inputData = { eventID };

      const response = await fetch(`http://127.0.0.1:3000/event/delete`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputData)
      });

      if (response.ok) {
        Swal.fire({
          title: 'Deleted!',
          text: 'Your event has been deleted.',
          icon: 'success'
        }).then((result)=>{
            if(result.isConfirmed){
              this.router.navigateByUrl('/events');  // TODO use location of MYEVENTS
            }
        });
      } else {
        Swal.fire(
          'Error!',
          'Failed to delete the event.',
          'error'
        );
      }
    }
  }
}
