import { Component } from '@angular/core';
import { FormGroup, FormControl, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-event-add',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './event-add.component.html',
  styleUrl: './event-add.component.scss'
})
export class EventAddComponent {
  eventAddForm = new FormGroup({
    title: new FormControl(''),
    startDateTime: new FormControl(''),
    endDateTime: new FormControl(''),
    price: new FormControl(''),
    location: new FormControl(''),
    categories: new FormControl(''),
    imageUrl: new FormControl(''),
  });

  onSubmit() {
    let title = this.eventAddForm.value.title;
    let startDateTime = this.eventAddForm.value.startDateTime;
    let endDateTime = this.eventAddForm.value.endDateTime;
    let price = this.eventAddForm.value.price;
    let location = this.eventAddForm.value.location;
    let categories = this.eventAddForm.value.categories;
    let imageUrl = this.eventAddForm.value.imageUrl;
    console.log(title,startDateTime,endDateTime,price,location,categories,imageUrl);
    
  }
}
