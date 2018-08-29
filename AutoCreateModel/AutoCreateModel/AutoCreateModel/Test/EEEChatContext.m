//
//  EEEChatContext.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatContext.h"

@interface EEEChatContext ()
@property(nonatomic, weak) UIViewController *controller;
@end
@implementation EEEChatContext
- (instancetype)initWithViewController:(UIViewController *)controller {
    if (self=[super init]) {
        self.controller = controller;
    }
    
    return self;
}
@end