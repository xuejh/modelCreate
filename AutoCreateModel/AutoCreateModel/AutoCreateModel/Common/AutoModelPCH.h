//
//  AutoModelPCH.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonManage.h"
#import "NodeModel.h"
#import "NodeModelViewController.h"
#import "UIColor+ColorChange.h"
#import "CommonFont.h"
#import "CommonFactory.h"
#import "PropertyInfomation.h"

#define  Width   [UIScreen mainScreen].bounds.size.width
#define  Height  [UIScreen mainScreen].bounds.size.height


#define COLOR_1  [UIColor colorWithHexString:@"0x333333"]
#define COLOR_3  [UIColor colorWithHexString:@"0x0090ff"]
#define COLOR_4  [UIColor colorWithHexString:@"0x999999"]
#define COLOR_6  [UIColor colorWithHexString:@"0xff6e00"]


const static NSString *propertyTypeButtonClickEvent = @"propertyTypeButtonClickEvent";
const static NSString *propertyValueButtonClickEvent = @"propertyValueButtonClickEvent";
const static NSString *MessageIdKey = @"MessageId";

const static NSString *pickViewCoordinatorClickEvent = @"pickViewCoordinatorClickEvent";
const static NSString *modelButtonClickEvent = @"modelButtonClickEvent";
const static NSString *doneButtonClickEvent = @"doneButtonClickEvent";

