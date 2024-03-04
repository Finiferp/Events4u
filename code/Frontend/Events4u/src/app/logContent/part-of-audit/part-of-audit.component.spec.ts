import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PartOfAuditComponent } from './part-of-audit.component';

describe('PartOfAuditComponent', () => {
  let component: PartOfAuditComponent;
  let fixture: ComponentFixture<PartOfAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PartOfAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PartOfAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
