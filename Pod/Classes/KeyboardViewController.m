//
//  KeyboardViewController.m
//  KeyboardExtension
//
//  Created by Nick Esfahani on 9/12/17.
//  Copyright © 2017 Vixlet. All rights reserved.
//

#import "KeyboardViewController.h"
#import "MEKeyboardAPIManager.h"
#import "Analytics.h"

@interface KeyboardViewController ()

@end

@implementation KeyboardViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self vixletInitProcess];

    }
    return self;
}

-(void) initializeDataFromMainApp {
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.vixlet.ios"];
    NSString *brandCode = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"brandCode"];;
    NSString *brandColorCode = [NSString stringWithFormat:@"%@%@", brandCode, @"color"];

    NSString *mojiAPIKey = [NSString stringWithFormat:@"%@%@", brandCode, @"mojiAPIKey"];
    NSString *mojiShareLinkKey = [NSString stringWithFormat:@"%@%@", brandCode, @"mojiShareLink"];
    NSString *analyticsAPIKey = [NSString stringWithFormat:@"%@%@", brandCode, @"analyticsAPIKey"];
    NSString *userId = [NSString stringWithFormat:@"%@%@", brandCode, @"userId"];
    NSString *unlockedCode = [NSString stringWithFormat:@"%@%@", brandCode, @"unlockedCategories"];


    _analyiticsAPIKey = [shared valueForKey:analyticsAPIKey];
    if (_analyiticsAPIKey == nil) {
        _analyiticsAPIKey = @"";
    }

    _userId = [shared valueForKey:userId];


    _shareLink = [shared valueForKey:mojiShareLinkKey];
    if (_shareLink == nil) {
        _shareLink = @"";
    }

    _mojiAPIKey = [shared valueForKey:mojiAPIKey];
    if (_mojiAPIKey == nil) {
        _mojiAPIKey = @"178e4219d7a98a3d6ee15438adb61c690ea090af";
    }

    _mojiAPIKey = [shared valueForKey:mojiAPIKey];
    if (_mojiAPIKey == nil) {
        _mojiAPIKey = @"178e4219d7a98a3d6ee15438adb61c690ea090af";
    }

    self.unlockedCategories = [shared valueForKey:unlockedCode];


    NSData * brandColorData = [shared dataForKey:brandColorCode];

     if(brandColorData){
         self.brandColor = [NSKeyedUnarchiver unarchiveObjectWithData:brandColorData];
    }

}

-(void)initAnalytics {
    SEGAnalyticsConfiguration *configuration = [SEGAnalyticsConfiguration configurationWithWriteKey:_analyiticsAPIKey];
    [SEGAnalytics setupWithConfiguration:configuration];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ( !([_userId length] == 0) ) {
        [[SEGAnalytics sharedAnalytics] identify:_userId];
    }
    [[SEGAnalytics sharedAnalytics] track:@"EXTENSION:OPENED"
                               properties:@{ @"extension_type": @"ios_keyboard"}];
    [self initializeDataFromMainApp];
}

-(void)initEmojiSettings {
    [[MEKeyboardAPIManager client] setSdkKey:_mojiAPIKey];

    self.shareText = _shareLink;
}

-(void)vixletInitProcess {
    [self initializeDataFromMainApp];
    [self initAnalytics];
    [self initEmojiSettings];
}


@end
