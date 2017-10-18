//
//  KeyboardViewController.h
//  KeyboardExtension
//
//  Created by Nick Esfahani on 9/12/17.
//  Copyright © 2017 Vixlet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEKeyboardViewController.h"

@interface KeyboardViewController : MEKeyboardViewController
@property (nonatomic, strong) NSString * mojiAPIKey;

@property (nonatomic, strong) NSString * shareLink;

@property (nonatomic, strong) NSString * analyiticsAPIKey;
@property (nonatomic, strong) NSString * userId;

@end
