//
//  JsonManage.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *    Json管理类
 */
@interface JsonManage : NSObject

/**
 *    jsonString转化为nsdata对象
 *
 *    @param jsonStr json字符串
 *    @return 返回对应的nsdata对象
 *
 */

+ (NSData*)jsonStringToData:(NSString *)jsonStr;

/**
 *    jsonString转化为字典对象
 *
 *    @param jsonStr json字符串
 *    @return 返回对应的字典对象
 *
 */

+ (NSDictionary*)jsonStringToDic:(NSString *)jsonStr;
@end
