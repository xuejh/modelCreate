//
//  NodeCellViewModel.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumManage.h"

@class PropertyInfomation;

@interface NodeCellViewModel : NSObject

/**
 *    model对应的类型，为kNSString，kNSNumber等
 */

@property(nonatomic, assign) PropertyType propertyType;

/**
 *    model对应的属性值
 */

@property(nonatomic, weak) id propertyValue;

/**
 *    初始化cellViewModel
 *
 *    @param propertyInfomation 便利构造器
 *
 *
 */

- (instancetype)initWithPropertyInfomation:(PropertyInfomation *)propertyInfomation;

/**
 *    获得cell高
 *
 *
 *    @return cell高
 *
 */

- (NSUInteger)cellHeight;
@end
