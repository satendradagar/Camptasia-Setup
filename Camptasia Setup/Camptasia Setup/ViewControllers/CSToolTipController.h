//
//  CSToolTipController.h
//  Camtasia Setup
//
//  Created by Satendra Singh on 14/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CSToolTipController : NSViewController

-initWithHeader:(NSString *)title firstIcon:(NSString *)iconOne firstTitle:(NSString *)msgOne secondIcon:(NSString *)iconTwo secondMessage:(NSString *)msgTwo;

@property (weak) IBOutlet NSLayoutConstraint *firstIconHeight;

@property (weak) IBOutlet NSLayoutConstraint *bottomIconHeight;
@end
