//
//  BeeHomeViewController.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeHomeViewController.h"
#import "BeeHomeTableViewCell.h"

#import "BeeClickBtnViewController.h"
#import "BeeSlicingViewController.h"
#import "MessageRecordViewController.h"

@interface BeeHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)UISwitch *theSwitch;
@property (nonatomic,strong)UILabel *theLabel;

@end

@implementation BeeHomeViewController

- (UILabel *)theLabel
{
    if (!_theLabel) {
        _theLabel = [[UILabel alloc]init];
        _theLabel.text = @"统计开关:";
    }
    return _theLabel;
}

- (UISwitch *)theSwitch
{
    if (!_theSwitch) {
        _theSwitch = [[UISwitch alloc]init];
        [_theSwitch setOn:YES];
        [_theSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _theSwitch;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = NO;
        [_tableView registerClass:[BeeHomeTableViewCell class] forCellReuseIdentifier:@"BeeHomeTableViewCell"];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"Hook_SimpleDemo";
    self.view.backgroundColor = [UIColor whiteColor];

    self.titleArr = @[@"点击按钮统计",@"CollectionView 拼图统计",@"统计记录"];
    
    // 默认开启统计
    [USER_DEFAULT setObject:@"1" forKey:RECORD_SWITCH_ON];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.theLabel];
    [self.theLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-100);
        make.centerX.mas_equalTo(-40);
    }];
    
    [self.view addSubview:self.theSwitch];
    [self.theSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.theLabel);
        make.centerX.mas_equalTo(40);
    }];
    
    
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BeeHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BeeHomeTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.label.text = self.titleArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            {
                BeeClickBtnViewController *vc = [[BeeClickBtnViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
            case 1:
            {
                BeeSlicingViewController *beeVC = [[BeeSlicingViewController alloc]init];
                beeVC.colums = beeVC.rows = 3;
                [self.navigationController pushViewController:beeVC animated:YES];
            }
            break;
            
            case 2:
            {
                MessageRecordViewController *vc = [[MessageRecordViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            break;
    }
}


#pragma mark - switch
- (void)switchAction:(id)sender
{
    BOOL isOn = [self.theSwitch isOn];
    if (isOn) {
        [USER_DEFAULT setObject:@"1" forKey:RECORD_SWITCH_ON];
    }else{
        [USER_DEFAULT setObject:@"0" forKey:RECORD_SWITCH_ON];
    }
    
}





@end
