import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavoriteAuditComponent } from './favorite-audit.component';

describe('FavoriteAuditComponent', () => {
  let component: FavoriteAuditComponent;
  let fixture: ComponentFixture<FavoriteAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FavoriteAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FavoriteAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
