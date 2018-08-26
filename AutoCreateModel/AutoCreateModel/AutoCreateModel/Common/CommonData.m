//
//  CommonData.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "CommonData.h"
#import "AutoModelPCH.h"


@implementation CommonData

+ (CommonData *)shareInstance {
    static CommonData * s_instance_dj_singleton = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_instance_dj_singleton == nil) {
            s_instance_dj_singleton = [[CommonData alloc] init];
        }
    });
    return (CommonData *)s_instance_dj_singleton;
}

- (BOOL)isMultiCell:(NodeBaseCellViewModel*)viewModel{
    
    if (viewModel.propertyType == kNSDictionary || viewModel.propertyType == kNSArray) {
        return YES;
    }
    return NO;
}

- (void)convertNodeModel:(NodeModel*)nodeModel preText:(NSString*)preText{
    
    nodeModel.modelName = [NSString stringWithFormat:@"%@%@",preText,nodeModel.modelName];
    for (NodeModel *node in nodeModel.allSubNodes){
        
        for (PropertyInfomation *property in node.properties) {
            
            switch (property.propertyType) {
                    
                case kNSDictionary:
                case kNSArray:{
                    
                    NodeModel *subNode = property.propertyValue;
                    subNode.modelName = [NSString stringWithFormat:@"%@%@",preText,subNode.modelName];
                    
                }
                 break;
                    
                default:
                    break;
            }
        }
        
    }
    
}
@end
