//
//  NodeMultiCellViewModel.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoModelPCH.h"

@class PropertyInfomation;

@interface NodeMultiCellViewModel : NSObject

@property(nonatomic, assign) PropertyType propertyType;
@property(nonatomic, weak) id propertyValue;

- (instancetype)initWithPropertyInfomation:(PropertyInfomation *)propertyInfomation;

- (NSUInteger)cellHeight;

@end
