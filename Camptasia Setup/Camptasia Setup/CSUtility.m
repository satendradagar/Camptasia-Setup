//
//  CSUtility.m
//  Camptasia Setup
//
//  Created by Satendra Singh on 08/10/16.
//  Copyright © 2016 Satendra Singh. All rights reserved.
//

#import "CSUtility.h"
#import <Cocoa/Cocoa.h>

NSString const *defaultsLectureKey = @"Defaults_Lecture";
NSString const *defaultsPresentationKey = @"Defaults_Presentation";
NSString const *defaultsLearningKey = @"Defaults_Learning";

NSString const *defaultsStudioLights = @"Defaults_StudioLights";
NSString const *defaultsRoomLights = @"Defaults_RoomLights";
NSString const *defaultsLapelMicrophone = @"Defaults_LapelMicrophone";
NSString const *defaultsPresentationLoaded = @"Defaults_PresentationLoaded";
NSString const *defaultsLearningGlass = @"Defaults_LearningGlass";


@implementation CSUtility

+(void)saveValue:(BOOL)val forKey:(NSString const *)key{
    NSLog(@"%@:%d",key,val);
    [[NSUserDefaults standardUserDefaults] setBool:val forKey:(NSString *)key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)valueForKey:(NSString const *)key{
    
    BOOL ret = [[NSUserDefaults standardUserDefaults] boolForKey:(NSString *)key];
    NSLog(@"RET:::[%@]-%d",key,ret);
    return ret;

}
// -------------------------------------------------------------------------
//	addAutoresizingConstraintsToChild: child withParent:parent
//
//	Add autoresizing constraints to child view erespect of parent.
// -------------------------------------------------------------------------
+(void)addAutoresizingConstraintsToChild:(NSView *)childView withParent:(NSView *)parentView{
    
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    
}

// -------------------------------------------------------------------------
//	addAutoresizingConstraintsToChild: child withParent:parent withTopSpace:space
//
//	Add autoresizing constraints to child view erespect of parent with a fixed top.
// -------------------------------------------------------------------------
+(void)addAutoresizingConstraintsToChild:(NSView *)childView withParent:(NSView *)parentView withTopSpace:(CGFloat)top{
    
    childView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:childView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:top]];
}

@end
