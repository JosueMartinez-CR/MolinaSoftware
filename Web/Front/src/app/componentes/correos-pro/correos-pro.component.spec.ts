import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CorreosProComponent } from './correos-pro.component';

describe('CorreosProComponent', () => {
  let component: CorreosProComponent;
  let fixture: ComponentFixture<CorreosProComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CorreosProComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CorreosProComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
