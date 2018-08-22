//
//  JsonManage.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "JsonManage.h"

@implementation JsonManage

+ (NSData*)jsonStringToData:(NSString *)jsonStr{
    
    NSParameterAssert(jsonStr);
    
    return [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSDictionary*)jsonStringToDic:(NSString *)jsonStr{
    
    NSData *jsonData = [JsonManage jsonStringToData:jsonStr];
    
    NSError *err = nil;
    
    return [NSJSONSerialization JSONObjectWithData:jsonData
                                           options:NSJSONReadingMutableContainers
                                             error:&err];
}
@end
