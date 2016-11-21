//
//  CSToolTipController.m
//  Camtasia Setup
//
//  Created by Satendra Singh on 14/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSToolTipController.h"

@interface CSToolTipController ()

@property (weak) IBOutlet NSTextField *header;

@property (weak) IBOutlet NSImageView *topImage;

@property (weak) IBOutlet NSTextField *topMessage;

@property (weak) IBOutlet NSImageView *bottomImage;

@property (weak) IBOutlet NSTextField *bottomMessage;


@end


@implementation CSToolTipController
{
    NSString *headerMsg;
    NSString *icon1;
    NSString *icon2;
    NSString *msg1;
    NSString *msg2;
}
-initWithHeader:(NSString *)title firstIcon:(NSString *)iconOne firstTitle:(NSString *)msgOne secondIcon:(NSString *)iconTwo secondMessage:(NSString *)msgTwo{
    
    self = [super initWithNibName:@"CSToolTipController" bundle:nil];
    if (self) {
        headerMsg = title;
        icon1 = iconOne;
        icon2 = iconTwo;
        msg1 = msgOne;
        msg2 = msgTwo;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _header.stringValue =headerMsg;
    if (icon1) {
        _firstIconHeight.constant = 260;
    }
    else{
        _firstIconHeight.constant = 0.0;
    }

    if (icon2) {
        _bottomIconHeight.constant = 260;
    }
    else{
        _bottomIconHeight.constant = 0.0;
    }
    

    _topImage.image = [NSImage imageNamed:icon1];
    _bottomImage.image = [NSImage imageNamed:icon2];
    _topMessage.stringValue = msg1;
    _bottomMessage.stringValue = msg2;
    // Do view setup here.
}

@end
