//
//  CSComponentsViewController.h
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CSButton.h"

@interface CSComponentsViewController : NSViewController

@property (weak) IBOutlet CSButton *lectureButton;
@property (weak) IBOutlet CSButton *presentationButton;

@property (weak) IBOutlet CSButton *learningButton;

@end
