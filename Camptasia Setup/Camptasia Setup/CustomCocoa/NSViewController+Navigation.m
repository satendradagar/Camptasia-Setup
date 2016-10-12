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
    viewController.view.alphaValue = 0.0;
//    selfBoud.origin = NSMakePoint(-viewController.view.frame.size.width, viewController.view.frame.size.height);
    viewController.view.frame = selfBoud;

    [NSApp.mainWindow.contentView addSubview:viewController.view];
    [CSUtility addAutoresizingConstraintsToChild:viewController.view withParent:NSApp.mainWindow.contentView];

//    [self.view.animator addSubview:viewController.view];
//    [CSUtility addAutoresizingConstraintsToChild:viewController.view withParent:self.view];
//    selfBoud.origin = NSZeroPoint;
//    viewController.view.frame = selfBoud;
    viewController.view.alphaValue = 1.0;
    [NSAnimationContext endGrouping];
//    [viewController.view becomeFirstResponder];
}

-(void)popViewController{
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:1.0];
    NSRect selfBoud = self.view.bounds;
    self.view.frame = selfBoud;
    self.view.alphaValue = 0.0;
    [NSAnimationContext endGrouping];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
