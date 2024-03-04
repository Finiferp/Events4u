import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LocationAuditComponent } from './location-audit.component';

describe('LocationAuditComponent', () => {
  let component: LocationAuditComponent;
  let fixture: ComponentFixture<LocationAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LocationAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(LocationAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
