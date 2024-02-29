import { Component, Renderer2  } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CategoryDropdownComponent } from '../category-dropdown/category-dropdown.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule, CategoryDropdownComponent],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent {

  constructor(private renderer: Renderer2, private router: Router) {}

  scrollToFooter() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }

  toHome() {
    this.router.navigate(['/events']);
  }
}
