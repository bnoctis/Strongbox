//
//  WindowController.m
//  MacBox
//
//  Created by Mark on 07/08/2017.
//  Copyright © 2017 Mark McGuill. All rights reserved.
//

#import "WindowController.h"
#import "Settings.h"
#import "Document.h"

@interface WindowController ()

@end

@implementation WindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.shouldCascadeWindows = YES;
    
    
    
    self.windowFrameAutosaveName = @"strongbox-window-controller-autosave";
}

- (NSString*)windowTitleForDocumentDisplayName:(NSString *)displayName {
    NSString* freeTrialLiteSuffix = @"";

    if(![Settings sharedInstance].fullVersion) {
        if (![Settings sharedInstance].freeTrial) {
            NSString* loc = NSLocalizedString(@"mac_free_trial_window_title_suffix", @" - (Pro Upgrade Available)");
            freeTrialLiteSuffix = loc;
        }
        else {
            long daysLeft = (long)[Settings sharedInstance].freeTrialDaysRemaining;

            if(daysLeft < 1 || daysLeft > 88) {
                NSString* loc = NSLocalizedString(@"mac_free_trial_window_title_suffix", @" - (Pro Upgrade Available)");
                freeTrialLiteSuffix = loc;
            }
            else {
                NSString* loc = NSLocalizedString(@"mac_pro_days_left_window_title_suffix_fmt", @" - [%ld Pro Days Left]");
                freeTrialLiteSuffix = [NSString stringWithFormat:loc, daysLeft];
            }
        }
    }












    return [NSString stringWithFormat:@"%@%@", displayName, freeTrialLiteSuffix];
}

@end
