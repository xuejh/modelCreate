//
//  NodeBaseCellViewModel.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoModelPCH.h"

@class PropertyInfomation;

@interface NodeBaseCellViewModel : NSObject

@property(nonatomic, assign) PropertyType propertyType;
@property(nonatomic, weak) id propertyValue;

- (instancetype)initWithPropertyInfomation:(PropertyInfomation *)propertyInfomation;

- (NSUInteger)cellHeight;
@end
