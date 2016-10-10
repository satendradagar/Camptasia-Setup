//
//  NSViewController+Navigation.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 09/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "NSViewController+Navigation.h"
#import "CSUtility.h"

@implementation NSViewController (Navigation)

-(void)pushViewController:(NSViewController *)viewController{
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.0];
    [self addChildViewController:viewController];
    NSRect selfBoud = self.view.bounds;
    selfBoud.origin = NSMakePoint(-viewController.view.frame.size.width, viewController.view.frame.size.height);
    viewController.view.frame = selfBoud;

    [self.view.animator addSubview:viewController.view];
    selfBoud.origin = NSZeroPoint;
    viewController.view.frame = selfBoud;

    [CSUtility addAutoresizingConstraintsToChild:viewController.view withParent:self.view];
    [NSAnimationContext endGrouping];

}
@end
