//
//  CSUtility.h
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface CSUtility : NSObject

// -------------------------------------------------------------------------
//	addAutoresizingConstraintsToChild: child withParent:parent
//
//	Add autoresizing constraints to child view erespect of parent.
// -------------------------------------------------------------------------
+(void)addAutoresizingConstraintsToChild:(NSView *)childView withParent:(NSView *)parentView;


// -------------------------------------------------------------------------
//	addAutoresizingConstraintsToChild: child withParent:parent withTopSpace:space
//
//	Add autoresizing constraints to child view erespect of parent with a fixed top.
// -------------------------------------------------------------------------
+(void)addAutoresizingConstraintsToChild:(NSView *)childView withParent:(NSView *)parentView withTopSpace:(CGFloat)top;
@end
