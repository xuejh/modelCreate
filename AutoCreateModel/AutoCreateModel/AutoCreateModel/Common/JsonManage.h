//
//  JsonManage.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonManage : NSObject

+ (NSData*)jsonStringToData:(NSString *)jsonStr;

+ (NSDictionary*)jsonStringToDic:(NSString *)jsonStr;
@end
