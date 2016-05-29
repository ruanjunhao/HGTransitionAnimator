//
//  HGPresentationController.m
//  HGTransitionAnimator
//
//  Created by 查昊 on 16/5/23.
//  Copyright © 2016年 haocha. All rights reserved.
//

#import "HGPresentationController.h"
#import "UIViewController+HGAnimator.h"

@interface  HGPresentationController()
@property (nonatomic, assign) CGRect showFrame;
@end

@implementation HGPresentationController

-(CGRect)showFrame
{
    return self.presentFrame;
}

- (UIView*)coverView
{
    if (!_coverView) {
        self.coverView = [[UIView alloc]init];
        self.coverView.backgroundColor=[UIColor clearColor];
        [self.coverView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)]];
    }
    return _coverView;
}

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self.response=YES;
    return [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}

- (void)containerViewWillLayoutSubviews
{
    self.coverView.frame=[UIScreen mainScreen].bounds;
    [self.containerView insertSubview:self.coverView atIndex:0];
    if (CGRectEqualToRect(_presentFrame, CGRectZero)) {
        self.presentedView.frame=self.showFrame;
    }else{
        self.presentedView.frame=_presentFrame;
    }
}

- (void)close{
    if (self.canResponse) [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
@end