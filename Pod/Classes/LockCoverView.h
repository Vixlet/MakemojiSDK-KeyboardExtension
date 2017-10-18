//
//  LockCoverView.h
//  KeyboardExtension
//
//  Created by Garrett Fritz on 9/15/17.
//  Copyright © 2017 Vixlet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LockCoverView : UIControl
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *title;
@property (weak, nonatomic) IBOutlet UIButton *learnMoreButton;
@property (weak, nonatomic) IBOutlet UIControl *background;

@end
