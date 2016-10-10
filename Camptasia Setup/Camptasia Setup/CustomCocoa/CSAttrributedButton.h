//
//  CSAttrributedButton.h
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CSAttrributedButton : NSButton


@property (nonatomic, strong) IBInspectable NSColor *bgColor;

@property (nonatomic, strong) IBInspectable NSColor *textColor;

@property (nonatomic, strong) IBInspectable NSColor *borderColor;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, assign) IBInspectable BOOL showUnderlineText;


@end
