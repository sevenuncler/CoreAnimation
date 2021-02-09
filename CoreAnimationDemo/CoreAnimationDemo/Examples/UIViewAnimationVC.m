//
//  UIViewAnimationVC.m
//  CoreAnimation
//
//  Created by fanghe on 2021/2/9.
//

#import "UIViewAnimationVC.h"
#import <Masonry/Masonry.h>

@interface UIViewAnimationVC ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *frameButton;
@property (nonatomic, strong) UIButton *constraintsButton;
@property (nonatomic, strong) UIButton *springButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, assign) CGPoint centerPoint;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UISlider *velocitySlider;
@property (nonatomic, strong) UIStackView *sliderStackView;

@end

@implementation UIViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textColor = [UIColor blackColor];
    self.label.text = @"UIView Animation";
    self.label.frame = CGRectMake(0, 0, 200, 40);
    self.label.center = self.view.center;
    [self.view addSubview:self.label];
    
    self.stackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    [self.view addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(200);
    }];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectZero];
    self.slider.maximumValue = 1;
    self.slider.minimumValue = 0;
    self.slider.value = 1.f;
    [self.view addSubview:self.slider];
    [self.slider addTarget:self action:@selector(onDampChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.velocitySlider = [[UISlider alloc] initWithFrame:CGRectZero];
    self.velocitySlider.maximumValue = 100;
    self.velocitySlider.minimumValue = 0;
    self.velocitySlider.value = 0.f;
    [self.view addSubview:self.velocitySlider];
    [self.velocitySlider addTarget:self action:@selector(onVelocityChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.sliderStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    self.sliderStackView.axis = UILayoutConstraintAxisVertical;
    self.sliderStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.sliderStackView.alignment = UIStackViewAlignmentCenter;
    [self.view addSubview:self.sliderStackView];
    [self.sliderStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.stackView.mas_bottom).offset(10);
    }];
    
    [self.sliderStackView addArrangedSubview:self.slider];
    [self.sliderStackView addArrangedSubview:self.velocitySlider];
    
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.sliderStackView);
    }];
    
    [self.velocitySlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.sliderStackView);
    }];
    
    self.frameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.frameButton setTitle:@"frame 动画" forState:UIControlStateNormal];
    [self.frameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.frameButton addTarget:self
                         action:@selector(frameAction)
               forControlEvents:UIControlEventTouchUpInside];
    [self.stackView addArrangedSubview:self.frameButton];
    
    self.constraintsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.constraintsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.constraintsButton setTitle:@"约束动画" forState:UIControlStateNormal];
    [self.constraintsButton addTarget:self action:@selector(constrainsAction) forControlEvents:UIControlEventTouchUpInside];
    [self.stackView addArrangedSubview:self.constraintsButton];
    
    self.springButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.springButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.springButton setTitle:@"弹簧动画" forState:UIControlStateNormal];
    [self.springButton addTarget:self action:@selector(springAction) forControlEvents:UIControlEventTouchUpInside];
    [self.stackView addArrangedSubview:self.springButton];
    
    self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.resetButton setTitle:@"重置" forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetAction) forControlEvents:UIControlEventTouchUpInside];
    [self.stackView addArrangedSubview:self.resetButton];
    
    self.centerPoint = self.view.center;
}

#pragma mark - Action

- (void)resetAction
{
    self.label.center = self.centerPoint;
}

- (void)frameAction
{
    [UIView animateWithDuration:0.25f
                     animations:^{
            self.label.center = CGPointMake(self.centerPoint.x, self.centerPoint.y + 300);
        }
                     completion:^(BOOL finished) {
            self.label.center = self.centerPoint;
        }];
}

- (void)constrainsAction
{
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).offset(300);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    [UIView animateWithDuration:.25f
                      animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        }
                      completion:^(BOOL finished) {
            [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.view);
                make.centerX.equalTo(self.view);
                make.width.equalTo(@200);
                make.height.equalTo(@40);
            }];
            [self.view setNeedsLayout];
            [self.view layoutIfNeeded];
        }] ;
}

- (void)springAction
{
    [UIView animateWithDuration:.25f
                           delay:0.f
          usingSpringWithDamping:self.slider.value
           initialSpringVelocity:self.velocitySlider.value
                         options:UIViewAnimationOptionCurveLinear
                      animations:^{
            self.label.center = CGPointMake(self.centerPoint.x, self.centerPoint.y + 300);
        } completion:^(BOOL finished) {
    }];
}

- (void)onDampChanged:(UISlider *)slider
{

}

- (void)onVelocityChanged:(UISlider *)slider
{
    
}

@end
