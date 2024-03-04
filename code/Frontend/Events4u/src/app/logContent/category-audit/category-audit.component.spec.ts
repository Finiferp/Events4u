import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CategoryAuditComponent } from './category-audit.component';

describe('CategoryAuditComponent', () => {
  let component: CategoryAuditComponent;
  let fixture: ComponentFixture<CategoryAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CategoryAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CategoryAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
