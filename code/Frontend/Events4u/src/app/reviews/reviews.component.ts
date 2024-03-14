import { Component, Input, SimpleChanges,OnChanges   } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { format } from 'date-fns';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-reviews',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './reviews.component.html',
  styleUrl: './reviews.component.scss'
})
export class ReviewsComponent implements OnChanges {
  currentRating: number = 0;      // Current rating of the review
  reviewText: string = '';        // Text of the review
  reviews: Review[] = [];         // Array to store fetched reviews
  @Input() eventID!: number;      // Input property to receive the event ID from the parent component

  /**
   * Set the rating to the specified star value.
   *
   * @param {number} star - the star value to set the rating to
   * @return {void} 
   */
  rate(star: number): void {
    this.currentRating = star;
  }

  /**
   * Handle changes to input properties.
   *
   * @param {SimpleChanges} changes - object containing the changed properties
   * @return {void} 
   */
  ngOnChanges(changes: SimpleChanges) {
    if ('eventID' in changes && this.eventID) {
      this.fetchReviews();
    }
  }


  /**
   * Async function to fetch reviews.
   *
   * @return {Promise<void>} The function does not return anything.
   */
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


  /**
   * A description of the entire function.
   *
   * @param {type} paramName - description of parameter
   * @return {type} description of return value
   */
  async submitReview() {
    // Check if both review text and rating are provided
    if (this.reviewText && this.currentRating > 0) {
      // Create a new review object with current date
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

      // Reset the form after submitting the review
      this.resetForm();
      this.fetchReviews
    } else {
      // Alert if rating or review text is missing
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Please provide both rating and review text.',
      })
    }
  }

  /**
   * Reset the form by setting current rating to 0 and clearing the review text.
   *
   * @return {void} 
   */
  resetForm(): void {
    this.currentRating = 0;
    this.reviewText = '';
  }
}


// Interface for defining the structure of a review
interface Review {
  text: string;
  stars: number; 
  date: string;
  user?: string;
}
