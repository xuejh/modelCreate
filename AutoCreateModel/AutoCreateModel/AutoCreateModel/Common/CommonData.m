//
//  CommonData.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "CommonData.h"

@implementation CommonData

+ (CommonData *)shareInstance {
    static CommonData * s_instance_dj_singleton = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_instance_dj_singleton == nil) {
            s_instance_dj_singleton = [[CommonData alloc] init];
        }
    });
    return (CommonData *)s_instance_dj_singleton;
}

@end
