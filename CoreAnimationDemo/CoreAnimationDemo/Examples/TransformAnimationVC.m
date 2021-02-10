//
//  TransformAnimationVC.m
//  CoreAnimationDemo
//
//  Created by fanghe on 2021/2/9.
//

#import "TransformAnimationVC.h"
#import <Masonry/Masonry.h>

@interface TransformAnimationVC ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation TransformAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.label.text = @"文字123abc";
    self.label.textColor = [UIColor whiteColor];
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    CGAffineTransform translate = CGAffineTransformMakeTranslation(-100, 100);
    self.label.transform = translate;
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.label2.text = @"文字123abc2";
    self.label2.textColor = [UIColor whiteColor];
    [self.label2 sizeToFit];
    [self.view addSubview:self.label2];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom);
        make.leading.equalTo(self.label);
    }];
    
    [self.button0 setTitle:@"创建" forState:UIControlStateNormal];
    [self.button1 setTitle:@"修改" forState:UIControlStateNormal];
    [self.button2 setTitle:@"apply" forState:UIControlStateNormal];
    [self.button3 setTitle:@"others" forState:UIControlStateNormal];
    [self.button4 setTitle:@"组合" forState:UIControlStateNormal];
    
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
    CGAffineTransform transform = CGAffineTransformMakeScale(1.2, 1.2);
    BOOL isIdeneity0 = CGAffineTransformIsIdentity(self.label.transform);
    self.label.transform = transform;
    BOOL isIdeneity1 = CGAffineTransformIsIdentity(transform);
    BOOL isIdeneity2 = CGAffineTransformIsIdentity(self.label.transform);
    NSLog(@"");
}

- (void)onButton4Action:(id)sender
{
    CGAffineTransform scale = CGAffineTransformMakeScale(1, 1);
    CGAffineTransform translate = CGAffineTransformMakeTranslation(-100, 100);
    CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI_2 * .5 * -1);
    CGAffineTransform transform = CGAffineTransformConcat(scale, translate);
    transform = CGAffineTransformConcat(transform, rotate);
    NSLog(@"%@", NSStringFromCGRect(self.label.frame));
    [UIView animateWithDuration:.25 animations:^{
        self.label.transform = transform;

    } completion:^(BOOL finished) {
        NSLog(@"%@", NSStringFromCGRect(self.label.frame));
        [self.label2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom);
            make.leading.equalTo(self.label);
        }];
        [self.label2 setNeedsLayout];
        [self.label2 layoutIfNeeded];
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}

@end
