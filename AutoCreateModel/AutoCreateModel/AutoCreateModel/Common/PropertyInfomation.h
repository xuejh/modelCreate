//
//  PropertyInfomation.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EnumManage.h"


@interface PropertyInfomation : NSObject

/**
 *  属性类型
 */
@property (nonatomic) PropertyType  propertyType;

/**
 *  属性代表值
 */
@property (nonatomic, weak) id      propertyValue;

/**
 *  便利构造器
 *
 *  @param type          属性类型
 *  @param propertyValue 属性代表值
 *
 *  @return 实例对象
 */
+ (instancetype)propertyInfomationWithPropertyType:(PropertyType)type propertyValue:(id)propertyValue;

@end
