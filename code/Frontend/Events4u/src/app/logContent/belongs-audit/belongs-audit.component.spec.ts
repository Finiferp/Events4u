import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BelongsAuditComponent } from './belongs-audit.component';

describe('BelongsAuditComponent', () => {
  let component: BelongsAuditComponent;
  let fixture: ComponentFixture<BelongsAuditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BelongsAuditComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(BelongsAuditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
