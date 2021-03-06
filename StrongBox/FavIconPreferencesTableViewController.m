//
//  FavIconPreferencesTableViewController.m
//  Strongbox-iOS
//
//  Created by Mark on 05/12/2019.
//  Copyright © 2014-2021 Mark McGuill. All rights reserved.
//

#import "FavIconPreferencesTableViewController.h"
//#import "Settings.h"
#import "Alerts.h"
#import "AppPreferences.h"

@interface FavIconPreferencesTableViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *commonFiles;
@property (weak, nonatomic) IBOutlet UISwitch *duckDuckGo;
@property (weak, nonatomic) IBOutlet UISwitch *domainOnly;
@property (weak, nonatomic) IBOutlet UISwitch *google;
@property (weak, nonatomic) IBOutlet UISwitch *scanHtml;
@property (weak, nonatomic) IBOutlet UISwitch *ignoreSslErrors;

@end

@implementation FavIconPreferencesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self bindUi];
}

- (void)bindUi {
    FavIconDownloadOptions* options = AppPreferences.sharedInstance.favIconDownloadOptions;
    
    self.commonFiles.on = options.checkCommonFavIconFiles;
    self.duckDuckGo.on = options.duckDuckGo;
    self.scanHtml.on = options.scanHtml;
    self.domainOnly.on = options.domainOnly;
    self.google.on = options.google;
    self.ignoreSslErrors.on = options.ignoreInvalidSSLCerts;
}

- (IBAction)onSettingChanged:(id)sender {
    FavIconDownloadOptions* options = AppPreferences.sharedInstance.favIconDownloadOptions;
    
    options.checkCommonFavIconFiles = self.commonFiles.on;
    options.duckDuckGo = self.duckDuckGo.on;
    options.domainOnly = self.domainOnly.on;
    options.scanHtml = self.scanHtml.on;
    options.google = self.google.on;
    options.ignoreInvalidSSLCerts = self.ignoreSslErrors.on;
    
    if(options.isValid) {
        AppPreferences.sharedInstance.favIconDownloadOptions = options;
    }
    else {
        [Alerts warn:self
               title:NSLocalizedString(@"favicon_invalid_preferences_alert_title", @"Invalid FavIcon Preferences")
             message:NSLocalizedString(@"favicon_invalid_preferences_alert_message", @"This set of preferences will not produce valid FavIcon results.")];
    }
    
    [self bindUi];
}


@end
