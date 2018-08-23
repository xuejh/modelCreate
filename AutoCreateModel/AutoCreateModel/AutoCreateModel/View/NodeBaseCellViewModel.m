//
//  NodeBaseCellViewModel.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeBaseCellViewModel.h"
#import "PropertyInfomation.h"

@interface NodeBaseCellViewModel()

@property (nonatomic, strong) PropertyInfomation *propertyInfomation;

@end

@implementation NodeBaseCellViewModel

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
