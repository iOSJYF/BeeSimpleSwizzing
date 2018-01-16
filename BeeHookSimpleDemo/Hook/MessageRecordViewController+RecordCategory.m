//
//  MessageRecordViewController+RecordCategory.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/16.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "MessageRecordViewController+RecordCategory.h"
#import "BeeSwizzling.h"

@implementation MessageRecordViewController (RecordCategory)

+ (void)load
{
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
       
        SEL sel_1 = @selector(viewDidLoad);
        [BeeSwizzling swizzingWithTheClass:[self class] andSEL_Name:sel_1 andEx_SEL_Name:@selector(beeRecordViewdidLoad)];

    });
}


- (void)beeRecordViewdidLoad
{
    int ifOn = [[USER_DEFAULT objectForKey:RECORD_SWITCH_ON] intValue];
    if (ifOn == 1) {
        int i = [[USER_DEFAULT objectForKey:MESSAGE_RECORD_COUNT] intValue];
        if (!i) {
            i = 0;
        }
        i ++;
        [USER_DEFAULT setObject:[NSNumber numberWithInt:i] forKey:MESSAGE_RECORD_COUNT];
    }
    
    [self beeRecordViewdidLoad];
    
}

@end
