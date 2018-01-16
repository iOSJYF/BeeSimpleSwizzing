//
//  BeeSlicingViewController+RecordCategory.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeSlicingViewController+RecordCategory.h"
#import "BeeSwizzling.h"

@implementation BeeSlicingViewController (RecordCategory)

+ (void)load
{
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        
        SEL sel_1 = NSSelectorFromString(@"finishChange");
        [BeeSwizzling swizzingWithTheClass:[self class] andSEL_Name:sel_1 andEx_SEL_Name:@selector(beeRecordFinishChange)];

        
    });
}

- (void)beeRecordFinishChange
{
    [self beeRecordFinishChange];
    int ifOn = [[USER_DEFAULT objectForKey:RECORD_SWITCH_ON] intValue];
    if (ifOn == 1) {
        int count = [[USER_DEFAULT objectForKey:PUZZLE_COUNT] intValue];
        if (!count) {
            count = 0;
        }
        count ++;
        NSLog(@"count = %d",count);
        [USER_DEFAULT setObject:[NSNumber numberWithInt:count] forKey:PUZZLE_COUNT];
    }
}



@end
