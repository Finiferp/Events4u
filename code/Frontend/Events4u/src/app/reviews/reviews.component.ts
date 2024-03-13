import { Component, Input, SimpleChanges,OnChanges   } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { format } from 'date-fns';


@Component({
  selector: 'app-reviews',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './reviews.component.html',
  styleUrl: './reviews.component.scss'
})
export class ReviewsComponent implements OnChanges {
  currentRating: number = 0;
  reviewText: string = '';
  reviews: Review[] = [];
  @Input() eventID!: number;

  rate(star: number): void {
    this.currentRating = star;
  }

  ngOnChanges(changes: SimpleChanges) {
    if ('eventID' in changes && this.eventID) {
      this.fetchReviews();
    }
  }


  async fetchReviews() {
    console.log(await this.eventID);
    
    const response = await fetch(`http://192.168.129.237:3000/event/getReviews/${this.eventID}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    });
    const data = await response.json();
    this.reviews = data.data;
  }
  async submitReview() {
    if (this.reviewText && this.currentRating > 0) {
      const rawDAte = new Date();
      const newReview: Review = {
        text: this.reviewText,
        stars: this.currentRating,
        date: format(rawDAte, 'yyyy-MM-dd'),
      };
      const inputData = { eventID: this.eventID, review: newReview.text, stars: newReview.stars, date: newReview.date };
      const response = await fetch(`http://192.168.129.237:3000/event/addReview`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(inputData)
      });
      this.resetForm();
      this.fetchReviews
    } else {
      alert('Please provide both rating and review text.');
    }
  }

  resetForm(): void {
    this.currentRating = 0;
    this.reviewText = '';
  }
}


interface Review {
  text: string;
  stars: number; 
  date: string;
  user?: string;
}
