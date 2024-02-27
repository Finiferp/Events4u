import { Component, OnInit, input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder } from '@angular/forms';
import { SearchServiceService } from '../search-service.service';

@Component({
  selector: 'app-category-dropdown',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './category-dropdown.component.html',
  styleUrl: './category-dropdown.component.scss'
})
export class CategoryDropdownComponent implements OnInit  {
  options: any[] = [];

  constructor(private searchService: SearchServiceService) {}

  ngOnInit() {
    this.fetchCategories();
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

  search(selectedCategory: string, searchInputValue: string) {
    const inputData = {"category": selectedCategory, "title": searchInputValue}
    this.searchService.sendSearchParam(inputData);
  }

  onEnter(event: KeyboardEvent, selectedCategory: string, searchInputValue: string) {
    if (event.key === "Enter") {
      this.search(selectedCategory, searchInputValue);
    }
  }

  
}
