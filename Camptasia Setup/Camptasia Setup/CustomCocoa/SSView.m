//
//  SSView.m
//  MacOptimizer
//
//  Created by Satendra Dagar on 20/03/16.
//
//

#import "SSView.h"

@implementation SSView

- (void)drawRect:(NSRect)dirtyRect
{
    if (self.bgColor)
    {
        // add a background colour
        [self.bgColor setFill];
        NSRectFill(dirtyRect);
    }
    
    [super drawRect:dirtyRect];
}

- (void)mouseDown:(NSEvent *)theEvent{
        //Do nothing to not propagate the click event to descendant views
}

@end
