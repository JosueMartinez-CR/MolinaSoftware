import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TelefonosProComponent } from './telefonos-pro.component';

describe('TelefonosProComponent', () => {
  let component: TelefonosProComponent;
  let fixture: ComponentFixture<TelefonosProComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TelefonosProComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TelefonosProComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
