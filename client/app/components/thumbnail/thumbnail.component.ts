import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';

@Component({
    selector: 'app-thumbnail',
    templateUrl: './thumbnail.component.html',
    styleUrls: ['./thumbnail.component.css']
})
export class ThumbnailComponent {

    @Input()
    public imageName: string;

    @Input("width")
    public imageWidth: number;

    @Input("height")
    public imageHeight: number;

    @Output()
    public mouseEnter: EventEmitter<string> = new EventEmitter<string>();

    @Output()
    public mouseLeave: EventEmitter<undefined> = new EventEmitter<undefined>();

    public imageMouseEnter(): void {
        this.mouseEnter.emit(this.imageName); 
    }

    public imageMouseLeave(): void {
        this.mouseLeave.emit(); 
  }
}