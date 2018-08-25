//
//  NodeMultiCellViewModel.m
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeMultiCellViewModel.h"

@interface NodeMultiCellViewModel()

@property (nonatomic, strong) PropertyInfomation *propertyInfomation;

@end

@implementation NodeMultiCellViewModel

- (instancetype)initWithPropertyInfomation:(PropertyInfomation *)propertyInfomation{
    
    if (self=[super init]) {
        self.propertyType = propertyInfomation.propertyType;
        self.propertyValue = propertyInfomation.propertyValue;
    }
    return self;
}

- (NSUInteger)cellHeight{
    
    return 44.0;
}

@end
