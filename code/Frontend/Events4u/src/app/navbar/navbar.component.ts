import { Component, Renderer2  } from '@angular/core';


@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [],
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent {

  constructor(private renderer: Renderer2) {}

  scrollToFooter() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }
}
