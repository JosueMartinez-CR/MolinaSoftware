import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdproductComponent } from './updproduct.component';

describe('UpdproductComponent', () => {
  let component: UpdproductComponent;
  let fixture: ComponentFixture<UpdproductComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UpdproductComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UpdproductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
