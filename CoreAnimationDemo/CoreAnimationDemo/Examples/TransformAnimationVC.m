//
//  TransformAnimationVC.m
//  CoreAnimationDemo
//
//  Created by fanghe on 2021/2/9.
//

#import "TransformAnimationVC.h"

@interface TransformAnimationVC ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation TransformAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.label.text = @"文字123abc";
    self.label.textColor = [UIColor whiteColor];
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    
    [self.button0 setTitle:@"创建" forState:UIControlStateNormal];
    [self.button1 setTitle:@"修改" forState:UIControlStateNormal];
    [self.button1 setTitle:@"apply" forState:UIControlStateNormal];
}

#pragma mark - Action

- (void)onButton0Action:(id)sender
{
    CGAffineTransform transfrom = CGAffineTransformMakeRotation(M_PI_2);
    
    [UIView animateWithDuration:.25 animations:^{
        self.label.transform = transfrom;
    }];
}

- (void)onButton1Action:(id)sender
{
    CGAffineTransform transfrom = CGAffineTransformMakeRotation(M_PI_2);
    transfrom = CGAffineTransformScale(transfrom, 1.2, 1.2);
    transfrom = CGAffineTransformTranslate(transfrom, 100, 50);
//    transfrom = CGAffineTransformInvert(transfrom); // 逆向
    [UIView animateWithDuration:.25 animations:^{
        self.label.transform = transfrom;
    }];
}

- (void)onButton2Action:(id)sender
{
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, -100);
    CGPoint newPoint = CGPointApplyAffineTransform(self.label.center, transform);
    [UIView animateWithDuration:.25 animations:^{
        self.label.center = newPoint;
    }];
}

- (void)onButton3Action:(id)sender
{
    
}

- (void)onButton4Action:(id)sender
{
    
}

@end
