import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsproductComponent } from './insproduct.component';

describe('InsproductComponent', () => {
  let component: InsproductComponent;
  let fixture: ComponentFixture<InsproductComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsproductComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InsproductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
