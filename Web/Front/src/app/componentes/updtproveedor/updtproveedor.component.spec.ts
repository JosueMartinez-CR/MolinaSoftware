import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdtproveedorComponent } from './updtproveedor.component';

describe('UpdtproveedorComponent', () => {
  let component: UpdtproveedorComponent;
  let fixture: ComponentFixture<UpdtproveedorComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UpdtproveedorComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UpdtproveedorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
