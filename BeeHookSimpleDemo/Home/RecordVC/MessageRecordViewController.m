//
//  MessageRecordViewController.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/16.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "MessageRecordViewController.h"
#import "BeeHomeTableViewCell.h"

@interface MessageRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArr;

@end

@implementation MessageRecordViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    
    int yellowCount = [[USER_DEFAULT objectForKey:YELLOW_BTN_COUNT] intValue];
    if (!yellowCount) {
        yellowCount = 0;
    }
    NSString *string1 = [NSString stringWithFormat:@"黄色按钮点击次数: %d",yellowCount];
    
    int redCount = [[USER_DEFAULT objectForKey:RED_BTN_COUNT] intValue];
    if (!redCount) {
        redCount = 0;
    }
    NSString *string2 = [NSString stringWithFormat:@"红色按钮点击次数: %d",redCount];
    
    int puzzleCount = [[USER_DEFAULT objectForKey:PUZZLE_COUNT] intValue];
    if (!puzzleCount) {
        puzzleCount = 0;
    }
    NSString *string3 = [NSString stringWithFormat:@"拼图步数: %d",puzzleCount];
    
    int messageShowCount = [[USER_DEFAULT objectForKey:MESSAGE_RECORD_COUNT] intValue];
    if (!messageShowCount) {
        messageShowCount = 0;
    }
    
    NSString *string4 = [NSString stringWithFormat:@"查看信息次数: %d",messageShowCount];
    
    self.titleArr = @[string1,string2,string3,string4];
    
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
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


@end
