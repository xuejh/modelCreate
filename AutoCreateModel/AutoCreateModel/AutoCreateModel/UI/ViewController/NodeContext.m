//
//  NodeContext.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeContext.h"

@interface NodeContext ()
@property(nonatomic, weak) UIViewController *controller;
@end
@implementation NodeContext
- (instancetype)initWithViewController:(UIViewController *)controller {
    if (self=[super init]) {
        self.controller = controller;
    }
    
    return self;
}
@end
