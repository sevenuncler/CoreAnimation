//
//  KeyFrameAnimationVC.m
//  CoreAnimationDemo
//
//  Created by fanghe on 2021/2/9.
//

#import "KeyFrameAnimationVC.h"

@interface KeyFrameAnimationVC ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation KeyFrameAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textColor = [UIColor whiteColor];
    self.label.text = @"文本123abc";
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    
    [self.button0 setTitle:@"帧动画" forState:UIControlStateNormal];
    [self.button1 setTitle:@"帧动画2" forState:UIControlStateNormal];
    [self.button2 setTitle:@"帧分段动画" forState:UIControlStateNormal];

}

#pragma mark - Action

- (void)onButton0Action:(id)sender
{
    
    [UIView animateKeyframesWithDuration:3
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
            self.label.center = self.view.center;
        }
                              completion:^(BOOL finished) {
            
        }];
}

- (void)onButton1Action:(id)sender
{
    self.label.center = CGPointMake(0, 0);
    [UIView animateKeyframesWithDuration:3
                                   delay:1
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced
                              animations:^{
            self.label.center = self.view.center;
        }
                              completion:^(BOOL finished) {
            
        }];
}

- (void)onButton2Action:(id)sender
{
//    self.label.center = CGPointMake(0, 0);
//    [UIView animateKeyframesWithDuration:10
//                                   delay:1
//                                 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced
//                              animations:^{
//
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
//            self.label.center = CGPointMake(200, 500);
//        }];
//
//        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
//            CGAffineTransform transform = CGAffineTransformMakeScale(1.5, 1.5);
//
//            self.label.alpha = 0;
//        }];
//        }
//                              completion:^(BOOL finished) {
//
//        }];
    UIView *image = self.label;
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse animations:^{
            //添加关键帧
            //第一个关键帧为开始位置，无需添加
            
            //第二个关键帧:从0秒开始持续50%的时间，也就是5.0*0.5=2.5秒
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
                image.center = CGPointMake(150, 200);
            }];
            
            //第三个关键帧，从0.5*5.0秒开始，持续5.0*0.25=1.25秒
            [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
                image.center = CGPointMake(350, 200);
            }];
            
            //第四个关键帧：从0.75*5.0秒开始，持所需5.0*0.25=1.25秒
            [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
                            CGAffineTransform transform = CGAffineTransformMakeScale(1.5, 1.5);
                image.transform = transform;
            }];
        } completion:nil];
}

- (void)onButton3Action:(id)sender
{
    
}

- (void)onButton4Action:(id)sender
{
    
}

@end
