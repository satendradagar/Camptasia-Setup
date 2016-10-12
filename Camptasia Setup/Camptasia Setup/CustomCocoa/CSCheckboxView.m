//
//  CSCheckboxView.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 09/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSCheckboxView.h"

@implementation CSCheckboxView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)configureState:(BOOL)isDisable{
    
    self.button.enabled = isDisable;
    if (NO == isDisable) {
        self.button.bgColor = [NSColor lightGrayColor];
        self.label.textColor = [NSColor lightGrayColor];

    }
    else{
        self.button.bgColor = nil;
        self.label.textColor = [NSColor blackColor];
        
    }
    
}

-(BOOL)canContinue{
    
    if (NO == self.button.enabled || YES == self.button.state) {
        
        return YES;
        
    }
    return NO;
}

@end
