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

@interface CSSetupViewController ()

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


@end
