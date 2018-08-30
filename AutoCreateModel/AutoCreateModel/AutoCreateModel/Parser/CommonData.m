//
//  CommonData.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "CommonData.h"
#import "AutoModelPCH.h"
#import "CreateNodeModelString.h"
#import "CreateFrameFile.h"

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

- (BOOL)isMultiCell:(NodeCellViewModel*)viewModel{
    
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

- (void)createFrameFile{
    
    CreateFrameFile *file = [[CreateFrameFile alloc]init];
    file.modelInCellName = [NSString stringWithFormat:@"%@%@",self.preText,self.modelInCellName];
    file.frameName = [NSString stringWithFormat:@"%@%@",self.preText,self.frameName];
    [file createFile];
    
    NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
}

- (void)createModelFile{
    
    for (NodeModel *node in self.nodeModel.allSubNodes) {
        
        CreateNodeModelString *nodeModelString = [CreateNodeModelString nodeModelStringsWithNodeModel:node];
        [nodeModelString createFile];
    }
    
    NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
    
}
@end
