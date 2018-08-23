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
#import "NodeModelViewController1.h"
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



//const NSArray *___PropertyType;
//#define cPropertyTypeGet (___PropertyType == nil ? ___PropertyType = [[NSArray alloc] initWithObjects:\
//@"NSString",\
//@"NSNumber",\
//@"Null",\
//@"NSArray",\
//@"NSDictionary", nil] : ___PropertyType)
//// 枚举 to 字串
//#define KPropertyTypeString(type) ([cPropertyTypeGet objectAtIndex:type])
//// 字串 to 枚举
//#define KPropertyTypeEnum(string) ([cPropertyTypeGet indexOfObject:string])

