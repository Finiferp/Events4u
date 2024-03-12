import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AttendingAuditComponent } from './attending-audit.component';

describe('AttendingAuditComponent', () => {
  let component: AttendingAuditComponent;
  let fixture: ComponentFixture<AttendingAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AttendingAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AttendingAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
