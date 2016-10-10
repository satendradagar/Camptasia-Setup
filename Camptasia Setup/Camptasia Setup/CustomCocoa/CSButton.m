//
//  CSButton.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSButton.h"

@implementation CSButton

-(void)awakeFromNib{
    [self setWantsLayer:YES];
}
- (void)drawRect:(NSRect)dirtyRect {
    
    [super drawRect:dirtyRect];
    NSLog(@"State = %ld",(long)self.state);
    if (self.state == 1) {
        [self.layer setBorderWidth:5.0];
        [self.layer setBorderColor:[[NSColor colorWithRed:108/255.0 green:167/255.0 blue:84/255.0 alpha:1.0] CGColor]];
    }
    else{
        [self.layer setBorderWidth:5.0];
        [self.layer setBorderColor:[[NSColor colorWithRed:202/255.0 green:8/255.0 blue:19/255.0 alpha:1.0] CGColor]];
    }
        // Drawing code here.//108 167 84
}

@end
