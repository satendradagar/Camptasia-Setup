//
//  CSCheckboxView.h
//  Camptasia Setup
//
//  Created by Satendra Singh on 09/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CSAttrributedButton.h"

@interface CSCheckboxView : NSView

@property (weak) IBOutlet CSAttrributedButton *button;

@property (weak) IBOutlet NSTextField *label;

- (void)configureState:(BOOL)isDisable;

@end
