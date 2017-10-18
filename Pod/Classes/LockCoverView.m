//
//  LockCoverView.m
//  KeyboardExtension
//
//  Created by Garrett Fritz on 9/15/17.
//  Copyright © 2017 Vixlet. All rights reserved.
//

#import "KeyboardViewController.h"
#import "LockCoverView.h"

#import <UIKit/UIKit.h>
@interface LockCoverView()

@end

@implementation LockCoverView

-(instancetype)initWithCode:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self customInit];
    }
    return self;
}

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self customInit];
    }
    return self;
}

-(void)customInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LockCoverView" owner:self options:nil];
    [self addSubview:self.contentView];
     self.title.titleLabel.textAlignment = UITextAlignmentCenter;

    self.learnMoreButton.layer.cornerRadius = 5;


    self.learnMoreButton.clipsToBounds = YES;
    self.contentView.frame = self.bounds;



}


@end

