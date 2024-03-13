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
  options: any[] = [];
  @ViewChild('searchInput') searchInput!: ElementRef;


  constructor(private searchService: SearchServiceService, private router: Router) {}

  ngOnInit() {
    this.fetchCategories();
  }

  async fetchCategories() {
    const response = await fetch(`http://192.168.129.237:3000/categories`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
    const data = await response.json();        
    this.options = data.data;    
  }

  search(selectedCategory: string, searchInputValue: string) {
    this.router.navigate(["/events"]).then(() => {
      const inputData = {"category": selectedCategory, "title": searchInputValue}
      this.searchService.sendSearchParam(inputData);
    });  

  }

  onInput(selectedCategory: string, searchInputValue: string) {
      this.search(selectedCategory, searchInputValue);
  }

  onEnter(event: KeyboardEvent, selectedCategory: string, searchInputValue: string) {
    if (event.key === "Enter") {
      this.search(selectedCategory, searchInputValue);
    }
  }

  public emptyTheSearch(){
    if (this.searchInput) {
      this.searchInput.nativeElement.value = ''; 
    }
  }
  
}
