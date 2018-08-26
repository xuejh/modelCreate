//
//  EnumManage.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger{
    
    kNSString,
    kNSNumber,
    kNull,
    kNSDictionary,
    kNSArray,
    
} PropertyType;


const static NSArray *___PropertyType;
#define cPropertyTypeGet (___PropertyType == nil ? ___PropertyType = [[NSArray alloc] initWithObjects:\
@"NSString",\
@"NSNumber",\
@"Null",\
@"NSDictionary",\
@"NSArray", nil] : ___PropertyType)
// 枚举 to 字串
#define KPropertyTypeString(type) ([cPropertyTypeGet objectAtIndex:type])
// 字串 to 枚举
#define KPropertyTypeEnum(string) ([cPropertyTypeGet indexOfObject:string])


@interface EnumManage : NSObject



@end
