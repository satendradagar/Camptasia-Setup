//
//  NSViewController+Navigation.h
//  Camptasia Setup
//
//  Created by Satendra Singh on 09/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSViewController (Navigation)

-(void)pushViewController:(NSViewController *)viewController;

-(void)popViewController;

@end
