//
//  MEKeyboardEmojiCollectionViewCell.m
//  Makemoji
//
//  Created by steve on 12/27/15.
//  Copyright © 2015 Makemoji. All rights reserved.
//

#import "MEKeyboardEmojiCollectionViewCell.h"

@implementation MEKeyboardEmojiCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30*6/4, 30*6/4)];
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.imageView];

        self.lockView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30*6/4, 30*6/4)];
        self.lockView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        self.lockView.center = self.contentView.center;
       [self.lockView setImage:[UIImage imageNamed:@"categoryLockedLite"]];
//        [self.lockView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:self.lockView];

    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

-(void)prepareForReuse {
    self.imageView.image = nil;
}

- (void)setLocked:(BOOL)locked {
    self.lockView.hidden = !locked;
}

@end
