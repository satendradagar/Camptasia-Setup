//
//  CSAttrributedButton.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSAttrributedButton.h"

@implementation CSAttrributedButton


// -------------------------------------------------------------------------
//	awakeFromNib
//
//	Intial setup.
// -------------------------------------------------------------------------
- (void)awakeFromNib
{
    [self setCustomTitleWithString:self.title];
    [self setWantsLayer:YES];
}

// -------------------------------------------------------------------------
//	setCustomTitleWithString:
//
//	Set custom title with given text color and fonts.
// -------------------------------------------------------------------------
-(void)setCustomTitleWithString:(NSString *)title{
    
    if (self.textColor)
        {
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
            [style setAlignment:NSCenterTextAlignment];
            
            NSMutableDictionary *attrsDictionary  = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                     self.textColor, NSForegroundColorAttributeName,
                                                     self.font, NSFontAttributeName,
                                                     style, NSParagraphStyleAttributeName, nil];
            if (self.showUnderlineText) {
                
                [attrsDictionary setObject:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
                
            }
            NSAttributedString *attrString = [[NSAttributedString alloc]initWithString:title attributes:attrsDictionary];
            
            [self setAttributedTitle:attrString];
        }
    
}

// -------------------------------------------------------------------------
//	setTitle:
//
//	override method.
// -------------------------------------------------------------------------
-(void)setTitle:(NSString *)title{
    
    [self setCustomTitleWithString:title];
    
}

// -------------------------------------------------------------------------
//	setTextColor:
//
//	Method to set text color.
// -------------------------------------------------------------------------
-(void)setTextColor:(NSColor *)newColor{
    _textColor = newColor;
    [self setCustomTitleWithString:self.title];
}

// -------------------------------------------------------------------------
//	resetCursorRects
//
//	Method to reset cursor rect of button.
// -------------------------------------------------------------------------
- (void)resetCursorRects
{
    if (self.showUnderlineText) {
        
        [self addCursorRect:[self bounds] cursor: [NSCursor pointingHandCursor]];
        
    } else {
        [super resetCursorRects];
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    if (self.bgColor)
        {
            // add a background colour
        [self.bgColor setFill];
        NSRectFill(dirtyRect);
        }
    if (self.borderWidth > 0.0) {
        
        [self.layer setBorderWidth:self.borderWidth];
        [self.layer setBorderColor:self.borderColor.CGColor];
        
    }
    [super drawRect:dirtyRect];
}

@end
