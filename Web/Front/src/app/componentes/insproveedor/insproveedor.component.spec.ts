import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsproveedorComponent } from './insproveedor.component';

describe('InsproveedorComponent', () => {
  let component: InsproveedorComponent;
  let fixture: ComponentFixture<InsproveedorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsproveedorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InsproveedorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
