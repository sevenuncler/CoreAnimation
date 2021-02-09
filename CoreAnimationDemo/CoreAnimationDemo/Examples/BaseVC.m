//
//  BaseVC.m
//  CoreAnimationDemo
//
//  Created by fanghe on 2021/2/9.
//

#import "BaseVC.h"
#import <Masonry/Masonry.h>

@interface BaseVC ()
@property (nonatomic, readwrite) UIStackView *stackView;
@property (nonatomic, readwrite) UIButton *button0;
@property (nonatomic, readwrite) UIButton *button1;
@property (nonatomic, readwrite) UIButton *button2;
@property (nonatomic, readwrite) UIButton *button3;
@property (nonatomic, readwrite) UIButton *button4;

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    [self.view addSubview:self.stackView];
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
    }];
    
    [self.stackView addArrangedSubview:self.button0];
    [self.stackView addArrangedSubview:self.button1];
    [self.stackView addArrangedSubview:self.button2];
    [self.stackView addArrangedSubview:self.button3];
    [self.stackView addArrangedSubview:self.button4];
}

#pragma mark - Action

- (void)onButton0Action:(id)sender
{
    
}

- (void)onButton1Action:(id)sender
{
    
}

- (void)onButton2Action:(id)sender
{
    
}

- (void)onButton3Action:(id)sender
{
    
}

- (void)onButton4Action:(id)sender
{
    
}

#pragma mark - Getter

- (UIButton *)button0
{
    if (!_button0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.backgroundColor = [self randomColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButton0Action:) forControlEvents:UIControlEventTouchUpInside];
        _button0 = button;
    }
    return _button0;
}

- (UIButton *)button1
{
    if (!_button1) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.backgroundColor = [self randomColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButton1Action:) forControlEvents:UIControlEventTouchUpInside];
        _button1 = button;
    }
    return _button1;
}

- (UIButton *)button2
{
    if (!_button2) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.backgroundColor = [self randomColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButton2Action:) forControlEvents:UIControlEventTouchUpInside];
        _button2 = button;
    }
    return _button2;
}

- (UIButton *)button3
{
    if (!_button3) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.backgroundColor = [self randomColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButton3Action:) forControlEvents:UIControlEventTouchUpInside];
        _button3 = button;
    }
    return _button3;
}

- (UIButton *)button4
{
    if (!_button4) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.backgroundColor = [self randomColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButton4Action:) forControlEvents:UIControlEventTouchUpInside];
        _button4 = button;
    }
    return _button4;
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random() % 255 / 255.f green:arc4random() % 255 / 255.f blue:arc4random() % 255 / 255.f alpha:1];
}


@end
