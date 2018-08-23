//
//  CommonFactory.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "CommonFactory.h"
#import "AutoModelPCH.h"

@implementation CommonFactory

+ (UIButton*)createCommonButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [CommonFont getFont5];
    [button setTitleColor:COLOR_1 forState:UIControlStateNormal];
    return button;
    
}
+ (UIButton*)createPropertyTypeButton{
    
    return  [CommonFactory createCommonButton];
    
}
+ (UIButton*)createPropertyButton{
    
    UIButton * button =  [CommonFactory createCommonButton];
    [button setTitleColor:COLOR_4 forState:UIControlStateNormal];
    return button;
}

@end
