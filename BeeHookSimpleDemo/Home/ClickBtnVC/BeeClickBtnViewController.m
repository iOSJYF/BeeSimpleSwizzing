//
//  BeeClickBtnViewController.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeClickBtnViewController.h"
#import "BeeSwizzling.h"
@interface BeeClickBtnViewController ()

@property (nonatomic,strong)UIButton *yellowBtn;
@property (nonatomic,strong)UIButton *redBtn;

@end

@implementation BeeClickBtnViewController

- (UIButton *)yellowBtn
{
    if (!_yellowBtn) {
        _yellowBtn = [[UIButton alloc]init];
        _yellowBtn.backgroundColor = [UIColor yellowColor];
        _yellowBtn.titleLabel.textAlignment = 1;
        [_yellowBtn setTitleColor:[UIColor blackColor] forState:0];
        [_yellowBtn addTarget:self action:@selector(yellowAction:) forControlEvents:UIControlEventTouchUpInside];
        int yellow = [[USER_DEFAULT objectForKey:YELLOW_BTN_COUNT] intValue];
        if (!yellow) {
            yellow = 0;
        }
        [_yellowBtn setTitle:[NSString stringWithFormat:@"%d",yellow] forState:0];
    }
    return _yellowBtn;
}

- (UIButton *)redBtn
{
    if (!_redBtn) {
        _redBtn = [[UIButton alloc]init];
        _redBtn.backgroundColor = [UIColor redColor];
        _redBtn.titleLabel.textAlignment = 1;
        [_redBtn setTitleColor:[UIColor blackColor] forState:0];
        [_redBtn addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventTouchUpInside];
        int red = [[USER_DEFAULT objectForKey:RED_BTN_COUNT] intValue];
        if (!red) {
            red = 0;
        }
        [_redBtn setTitle:[NSString stringWithFormat:@"%d",red] forState:0];
    }
    return _redBtn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.yellowBtn];
    [self.yellowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(-70);
        make.height.width.mas_equalTo(100);
    }];
    
    [self.view addSubview:self.redBtn];
    [self.redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(70);
        make.height.width.mas_equalTo(100);
    }];
    
}

- (void)yellowAction:(UIButton *)sender
{
    NSLog(@"点击了黄色按钮");
}

- (void)redAction:(UIButton *)sender
{
    NSLog(@"点击了红色按钮");
}

@end
