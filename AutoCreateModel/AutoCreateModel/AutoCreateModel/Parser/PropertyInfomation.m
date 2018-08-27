//
//  PropertyInfomation.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "PropertyInfomation.h"
#import "AutoModelPCH.h"

@implementation PropertyInfomation

+ (instancetype)propertyInfomationWithPropertyType:(PropertyType)type propertyValue:(id)propertyValue {
    
    PropertyInfomation *infomation = [[[self class] alloc] init];
    
    infomation.propertyType  = type;
    infomation.propertyValue = propertyValue;
    
    return infomation;
}

@end
