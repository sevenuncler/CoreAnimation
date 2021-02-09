//
//  TransitionVC.m
//  CoreAnimationDemo
//
//  Created by fanghe on 2021/2/9.
//

#import "TransitionAnimationVC.h"
#import <Masonry/Masonry.h>

@interface TransitionAnimationVC ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation TransitionAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 100, 50)];
    self.label.backgroundColor = [UIColor blackColor];
    self.label.textColor = [UIColor whiteColor];
    self.label.text = @"转场动画";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.center = self.view.center;
    [self.view addSubview:self.label];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 400 + 200, 100, 50)];
    self.label2.backgroundColor = [UIColor blackColor];
    self.label2.textColor = [UIColor redColor];
    self.label2.text = @"转场动画2";
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.center = self.view.center;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.button0 setTitle:@"转场动画效果1" forState:UIControlStateNormal];
    [self.button1 setTitle:@"转场动画效果2" forState:UIControlStateNormal];

}

#pragma mark - Action

- (void)onButton0Action:(id)sender
{
    [UIView transitionWithView:self.view
                      duration:3.f
                       options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
            self.label.transform = CGAffineTransformMakeScale(4.5f, 4.5f);
        }
                    completion:^(BOOL finished) {
        }];
}

- (void)onButton1Action:(id)sender
{
    [UIView transitionFromView:self.label toView:self.label2 duration:1.5f
                       options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionAllowAnimatedContent
                    completion:^(BOOL finished) {
        
    }];
}


@end
