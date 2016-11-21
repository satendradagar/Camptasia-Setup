//
//  CSSetupViewController.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSSetupViewController.h"
#import "CSCheckboxView.h"
#import "CSGetReadyController.h"
#import "NSViewController+Navigation.h"
#import "CSUtility.h"
#import "CSToolTipController.h"
#import "CSPresentationTip.h"

@interface CSSetupViewController ()<NSPopoverDelegate>
{
    
    NSPopover *toolTipPopover;
    
}

@property (weak) IBOutlet CSCheckboxView *studioLights;

@property (weak) IBOutlet CSCheckboxView *roomLights;

@property (weak) IBOutlet CSCheckboxView *lapelMicrophone;

@property (weak) IBOutlet CSCheckboxView *presentationLoaded;

@property (weak) IBOutlet CSCheckboxView *learningGlass;

@property (weak) IBOutlet CSAttrributedButton *continueButton;

@end

@implementation CSSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    BOOL isLecture = [CSUtility valueForKey:defaultsLectureKey];
    BOOL isPresentation = [CSUtility valueForKey:defaultsPresentationKey];
    BOOL isLearning = [CSUtility valueForKey:defaultsLearningKey];
    
    if (NO == isLecture && NO == isLearning) {
        [self.studioLights configureState:NO];
        [self.roomLights configureState:NO];
        [self.learningGlass configureState:NO];

    }
    
    if (NO == isPresentation){
        [self.presentationLoaded configureState:NO];

    }
    
    if(NO == isLearning){
        [self.learningGlass configureState:NO];

    }
    // Do view setup here.
    /*
     i. If Lecture AND Learning Glass both = ‘False” 1. Then deactivate:
         a. Studio Lights
         b. Room Lights
         c. Learning Glass lights
     ii. If Presentation is False 1. Then deactivate:
         a. Presentation is loaded? 
     iii. If Learning Glass = ‘False’1. Then deactivate
        a. Learning Glass lights
     */

    [self validateContinueButton];

        // create and setup our popover
    toolTipPopover = [[NSPopover alloc] init];
    
        // the popover retains us and we retain the popover,
        // we drop the popover whenever it is closed to avoid a cycle
    
//    toolTipPopover.contentViewController = self.popoverViewController;
    toolTipPopover.appearance = (NSPopoverAppearance)[NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];

    toolTipPopover.animates = YES;
    
        // AppKit will close the popover when the user interacts with a user interface element outside the popover.
        // note that interacting with menus or panels that become key only when needed will not cause a transient popover to close.
    toolTipPopover.behavior = NSPopoverBehaviorTransient;
    
        // so we can be notified when the popover appears or closes
    toolTipPopover.delegate = self;

}

-(void)validateContinueButton{
    
    if ( [_studioLights canContinue] && [_roomLights canContinue] && [_lapelMicrophone canContinue] && [_presentationLoaded canContinue] && [_learningGlass canContinue]) {

        [_continueButton setAlphaValue:1.0];
        [_continueButton setEnabled:YES];
    }
    else{
        
        [_continueButton setAlphaValue:0.3];
        [_continueButton setEnabled:NO];

    }
}

-(IBAction)didSelectStudioLights:(NSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsStudioLights];
    [self validateContinueButton];
}

-(IBAction)didSelectRoomLights:(NSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsRoomLights];
    [self validateContinueButton];

}


-(IBAction)didSelectLapelMicrophone:(NSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsLapelMicrophone];
    [self validateContinueButton];

}


-(IBAction)didSelectPresentationLoaded:(NSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsPresentationLoaded];
    [self validateContinueButton];

}

-(IBAction)didSelectLearningGlass:(NSButton *)sender{
    
    [CSUtility saveValue:sender.state forKey:defaultsLearningGlass];
    [self validateContinueButton];

}

-(IBAction)didClickContinue:(id)sender{
    
    CSGetReadyController *readyController = [[CSGetReadyController alloc] initWithNibName:@"CSGetReadyController" bundle:nil];
    [self pushViewController:readyController];
    
}


-(IBAction)didClickBack:(id)sender{
    
    [self popViewController];
}

#pragma mark- ToolTips
-(void)showToolTipButton:(NSButton *)sender withTitle:(NSString *)title firstMsg:(NSString *)msg1 firstIcon:(NSString *)icon1 secondMsg:(NSString *)msg2 secondIcon:(NSString *)icon2
{
    CSToolTipController *toolTip = [[CSToolTipController alloc] initWithHeader:title firstIcon:icon1 firstTitle:msg1 secondIcon:icon2 secondMessage:msg2];
    toolTipPopover.contentViewController = toolTip;
    [toolTipPopover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMaxX];
}

-(IBAction)toolTipForStudioLights:(NSButton *)sender{
    
    [self showToolTipButton:sender withTitle:@"Studio Lights" firstMsg:@"The studio lights are must be switched on. These are each supported by a pole and they resemble inverted umbrellas.  The switches that control each lights is found midway on cord attached to the light. The third and shorter studio light at the back remains off." firstIcon:@"Tip 1" secondMsg:@"" secondIcon:nil];
}

-(IBAction)toolTipForRoomLights:(NSButton *)sender{
    
    [self showToolTipButton:sender withTitle:@"Room Lights" firstMsg:@"The room lights are those above. They can be turned off using the switch found near the door just outside of the room." firstIcon:@"Tip 2" secondMsg:@"" secondIcon:nil];

}


-(IBAction)toolTipForLapelMicrophone:(NSButton *)sender{
    
    [self showToolTipButton:sender withTitle:@"Microphone" firstMsg:@"The lapel mic is a small mic attached to a very long cord. It’s found on the table with this tablet.                                                                                  Using the clip, attach the microphone to your shirt.  It should be placed about 8 inches below your chin. Be aware of ties, collars, or anything that might rub against the mic." firstIcon:@"Tip 3 Part 1" secondMsg:@"\n\nMid-way on the cord of the mic, there is a small control box. Turn the Mic on using the switch found there." secondIcon:@"Tip 3 Part 2"];

}


-(IBAction)toolTipForPresentationLoaded:(NSButton *)sender{
    
    CSPresentationTip *toolTip = [[CSPresentationTip alloc] initWithNibName:@"CSPresentationTip" bundle:nil];
    toolTipPopover.contentViewController = toolTip;
    toolTipPopover.contentSize = toolTip.view.frame.size;
    [toolTipPopover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMaxX];

}

-(IBAction)toolTipForLearningGlass:(NSButton *)sender{
    
    [self showToolTipButton:sender withTitle:@"Learning Glass" firstMsg:@"The learning glass lights are found at the right side of the table. They should be turned on to 25% using the dial." firstIcon:@"Tip 5" secondMsg:@"" secondIcon:nil];

}


#pragma  mark- Popover delegates

#pragma mark - NSPopoverDelegate

    // -------------------------------------------------------------------------------
    // Invoked on the delegate when the NSPopoverWillShowNotification notification is sent.
    // This method will also be invoked on the popover.
    // -------------------------------------------------------------------------------
- (void)popoverWillShow:(NSNotification *)notification
{
    NSPopover *popover = notification.object;
    if (popover != nil)
        {
            //... operate on that popover
        }
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate when the NSPopoverDidShowNotification notification is sent.
    // This method will also be invoked on the popover.
    // -------------------------------------------------------------------------------
- (void)popoverDidShow:(NSNotification *)notification
{
        // add new code here after the popover has been shown
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate when the NSPopoverWillCloseNotification notification is sent.
    // This method will also be invoked on the popover.
    // -------------------------------------------------------------------------------
- (void)popoverWillClose:(NSNotification *)notification
{
    NSString *closeReason = [notification.userInfo valueForKey:NSPopoverCloseReasonKey];
    if (closeReason)
        {
            // closeReason can be:
            //      NSPopoverCloseReasonStandard
            //      NSPopoverCloseReasonDetachToWindow
            //
            // add new code here if you want to respond "before" the popover closes
            //
        }
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate when the NSPopoverDidCloseNotification notification is sent.
    // This method will also be invoked on the popover.
    // -------------------------------------------------------------------------------
- (void)popoverDidClose:(NSNotification *)notification
{
    NSString *closeReason = [notification.userInfo valueForKey:NSPopoverCloseReasonKey];
    if (closeReason)
        {
            // closeReason can be:
            //      NSPopoverCloseReasonStandard
            //      NSPopoverCloseReasonDetachToWindow
            //
            // add new code here if you want to respond "after" the popover closes
            //
        }
    
        // release our popover since it closed
//    toolTipPopover = nil;
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate to give permission to detach popover as a separate window.
    // -------------------------------------------------------------------------------
- (BOOL)popoverShouldDetach:(NSPopover *)popover
{
    return YES;
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate to when the popover was detached.
    // Note: Invoked only if AppKit provides the window for this popover.
    // -------------------------------------------------------------------------------
- (void)popoverDidDetach:(NSPopover *)popover
{
    NSLog(@"popoverDidDetach");
}

    // -------------------------------------------------------------------------------
    // Invoked on the delegate asked for the detachable window for the popover.
    // -------------------------------------------------------------------------------
//- (NSWindow *)detachableWindowForPopover:(NSPopover *)popover
//{
//    NSWindow *window = nil;

//    
//    if (self.useCustomDetachedWindow.state)
//        {
//        window = self.detachedWindow;
//        if ([popover.appearance.name isEqualToString:NSAppearanceNameVibrantDark])
//            {
//                // use the dark window (style HUD)
//            window = self.detachedHUDWindow;
//            }
//        }
//    
//    return window;
//}

@end
