import { Component, OnInit, ViewChild,  ElementRef} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder } from '@angular/forms';
import { SearchServiceService } from '../search-service.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-category-dropdown',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './category-dropdown.component.html',
  styleUrl: './category-dropdown.component.scss'
})
export class CategoryDropdownComponent implements OnInit  {
  options: any[] = [];                                 // Initialize options as an empty array
  @ViewChild('searchInput') searchInput!: ElementRef;  // Get reference to search input element


  constructor(private searchService: SearchServiceService, private router: Router) {}

  ngOnInit() {
    this.fetchCategories(); // Fetch categories when component initializes
  }

  /**
   * Fetches categories from a specified URL using a GET request.
   *
   */
  async fetchCategories() {
    const response = await fetch(`http://192.168.129.237:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();        
    this.options = data.data;    // Update options with fetched categories
  }

  /**
   * Perform a search operation based on the selected category and search input value.
   *
   * @param {string} selectedCategory - the category selected for the search
   * @param {string} searchInputValue - the input value used for searching
   * @return {void} 
   */
  search(selectedCategory: string, searchInputValue: string) {
    this.router.navigate(["/events"]).then(() => {
      const inputData = {"category": selectedCategory, "title": searchInputValue}
      this.searchService.sendSearchParam(inputData); // Send search parameters to the service
    });  

  }

  /**
   * A description of the entire function.
   *
   * @param {string} selectedCategory - description of parameter
   * @param {string} searchInputValue - description of parameter
   * @return {void} description of return value
   */
  onInput(selectedCategory: string, searchInputValue: string) {
      this.search(selectedCategory, searchInputValue);  // Trigger search on input
  }

  /**
   * A function that is triggered when the Enter key is pressed, and it calls the search function if the Enter key is pressed.
   *
   * @param {KeyboardEvent} event - the keyboard event object
   * @param {string} selectedCategory - the selected category
   * @param {string} searchInputValue - the value in the search input
   */
  onEnter(event: KeyboardEvent, selectedCategory: string, searchInputValue: string) {
    if (event.key === "Enter") {
      this.search(selectedCategory, searchInputValue);  // Trigger search on Enter key press
    }
  }

  /**
   * Empties the search input field if it exists.
   */
  public emptyTheSearch(){
    if (this.searchInput) {
      this.searchInput.nativeElement.value = '';  // Clear the search input
    }
  }
  
}
