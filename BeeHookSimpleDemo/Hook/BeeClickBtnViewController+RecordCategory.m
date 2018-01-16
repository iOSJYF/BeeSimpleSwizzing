//
//  BeeClickBtnViewController+RecordCategory.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeClickBtnViewController+RecordCategory.h"
#import "BeeSwizzling.h"

@implementation BeeClickBtnViewController (RecordCategory)

+ (void)load
{
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        
        SEL sel_1 = NSSelectorFromString(@"yellowAction:");
        SEL sel_2 = NSSelectorFromString(@"redAction:");
        
        [BeeSwizzling swizzingWithTheClass:[self class] andSEL_Name:sel_1 andEx_SEL_Name:@selector(beeRecordYellowAction:)];
        
        [BeeSwizzling swizzingWithTheClass:[self class] andSEL_Name:sel_2 andEx_SEL_Name:@selector(beeRecordRedAction:)];


    });

}

- (void)beeRecordYellowAction:(UIButton *)sender
{
    [self beeRecordYellowAction:sender];
    int ifOn = [[USER_DEFAULT objectForKey:RECORD_SWITCH_ON] intValue];
    if (ifOn == 1) {
        int theNum = [[USER_DEFAULT objectForKey:YELLOW_BTN_COUNT] intValue];
        theNum ++;
        [USER_DEFAULT setObject:[NSNumber numberWithInt:theNum] forKey:YELLOW_BTN_COUNT];
        [sender setTitle:[NSString stringWithFormat:@"%d",theNum] forState:0];
    }
}

- (void)beeRecordRedAction:(UIButton *)sender
{
    [self beeRecordRedAction:sender];
    int ifOn = [[USER_DEFAULT objectForKey:RECORD_SWITCH_ON] intValue];
    if (ifOn == 1) {
        int theNum = [[USER_DEFAULT objectForKey:RED_BTN_COUNT] intValue];
        theNum ++;
        [USER_DEFAULT setObject:[NSNumber numberWithInt:theNum] forKey:RED_BTN_COUNT];
        [sender setTitle:[NSString stringWithFormat:@"%d",theNum] forState:0];
    }
}




@end
