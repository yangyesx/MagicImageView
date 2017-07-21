//
//  MagicImageView.m
//  BigImageDemo
//
//  Created by yangyunen on 2017/7/20.
//  Copyright © 2017年 yangyunen. All rights reserved.
//

#import "MagicImageView.h"

@interface MagicImageView ()

@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UIImageView *actionImageView;

@end

@implementation MagicImageView

- (instancetype)initWithImage:(UIImage *)image{
    self = [super initWithImage:image];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTapAction:)]];
    
    return self;
}

- (void)picTapAction:(UIGestureRecognizer *)gr{
    self.hidden = YES;
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _backView.backgroundColor = [UIColor blackColor];
    [_backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTapAction)]];
    [[UIApplication sharedApplication].delegate.window addSubview:_backView];
    
    _actionImageView = [[UIImageView alloc] initWithImage:self.image];
    _actionImageView.frame = self.frame;
    [[UIApplication sharedApplication].delegate.window addSubview:_actionImageView];
    [UIView animateWithDuration:.3 animations:^{
        CGFloat fixelW = CGImageGetWidth(_actionImageView.image.CGImage);
        CGFloat fixelH = CGImageGetHeight(_actionImageView.image.CGImage);
        _actionImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, fixelH * [UIScreen mainScreen].bounds.size.width / fixelW);
        _actionImageView.center = _backView.center;
    }];
}

- (void)backTapAction{
    [UIView animateWithDuration:.2 animations:^{
        _actionImageView.frame = self.frame;
        _backView.alpha = .3;
    } completion:^(BOOL finished) {
        [_backView removeFromSuperview];
        [_actionImageView removeFromSuperview];
        self.hidden = NO;
    }];
}

@end
