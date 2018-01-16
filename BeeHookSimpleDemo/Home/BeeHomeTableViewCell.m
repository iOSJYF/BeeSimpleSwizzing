//
//  BeeHomeTableViewCell.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeHomeTableViewCell.h"

@implementation BeeHomeTableViewCell

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]init];
    }
    return _label;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        
    }
    return self;
}

@end
