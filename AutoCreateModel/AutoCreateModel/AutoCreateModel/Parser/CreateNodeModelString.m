//
//  NodeModelStrings.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "CreateNodeModelString.h"
#import "AutoModelPCH.h"
#import "PropertyInfomation.h"

@interface CreateNodeModelString ()

@property (nonatomic, strong) NSDictionary *nodeModelStringsPlist;

@property (nonatomic, strong) NSString     *modelHeaderFileString;
@property (nonatomic, strong) NSString     *modelMFileString;


@end

@implementation CreateNodeModelString

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.nodeModelStringsPlist = [self accessModelPlist];
        self.modelHeaderFileString = self.nodeModelStringsPlist[@"modelHeaderFileString"];
        self.modelMFileString      = self.nodeModelStringsPlist[@"modelMFileString"];
        
    }
    
    return self;
}

+ (instancetype)nodeModelStringsWithNodeModel:(NodeModel *)nodeModel {
    
    CreateNodeModelString *nodeModelStrings = [[self alloc] init];
    nodeModelStrings.nodeModel         = nodeModel;
    
    return nodeModelStrings;
}

/**
 *  获取plist文件
 *
 *  @return 字典
 */
- (NSDictionary *)accessModelPlist {
    
    NSString     *path = [[NSBundle mainBundle] pathForResource:@"NodeModelStrings.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return data;
}

- (void)createFile {
    
    [self createOBjectiveCFile];
}



- (void)createOBjectiveCFile {
    
    // 替换文件名字
    NSString *fileName         = self.nodeModel.modelName;
    self.modelHeaderFileString = [self.modelHeaderFileString stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                       withString:fileName];
    self.modelMFileString      = [self.modelMFileString stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                  withString:fileName];
    
    // 导入头文件字符串
    NSString *inputHeaderString = @"";
    for (PropertyInfomation *property in self.nodeModel.properties) {
        
        if (property.propertyType == kNSDictionary || property.propertyType == kNSArray) {
            
            NodeModel *node        = property.propertyValue;
            NSString *importString = [NSString stringWithFormat:@"#import \"%@.h\"\n", node.modelName];
            inputHeaderString      = [inputHeaderString stringByAppendingString:importString];
        }
    }
    self.modelHeaderFileString = [self.modelHeaderFileString stringByReplacingOccurrencesOfString:@"[FileHeaders-WaitForReplaced]"
                                                                                       withString:inputHeaderString];
    
    
    // 替换头文件属性
    NSString *propetiesString = @"";
    for (PropertyInfomation *property in self.nodeModel.properties) {
        
        switch (property.propertyType) {
                
            case kNSString: {
                
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;\n", property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSNumber: {
                
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) NSNumber *%@;\n", property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNull: {
                
                NSString *tmpSting = [NSString stringWithFormat:@"// @property (nonatomic, strong) Null *%@;\n", property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSDictionary: {
                
                NodeModel *nodeModel = property.propertyValue;
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;\n", nodeModel.modelName, nodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSArray:{
                
                NodeModel *nodeModel = property.propertyValue;
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) NSMutableArray <%@ *> *%@;\n", nodeModel.modelName, nodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            default:
                break;
        }
    }
    self.modelHeaderFileString = [self.modelHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                       withString:propetiesString];
    
    
    // 替换实现文件
    NSMutableString *mPropertyString = [NSMutableString string];
    for (PropertyInfomation *property in self.nodeModel.properties) {
        
        if (property.propertyType == kNSArray) {
            
            NodeModel *nodeModel      = property.propertyValue;
            NSString *listTypeString  = [NSString stringWithFormat:@"%@\n", self.nodeModelStringsPlist[@"arrayTypeString"]];
            listTypeString = [listTypeString stringByReplacingOccurrencesOfString:@"[PropertyName]" withString:nodeModel.listType];
            listTypeString = [listTypeString stringByReplacingOccurrencesOfString:@"[PropertyClass]" withString:nodeModel.modelName];
            
            [mPropertyString appendString:listTypeString];
        }
        
        if (property.propertyType == kNSDictionary) {
            
            NodeModel *nodeModel      = property.propertyValue;
            NSString *listTypeString  = [NSString stringWithFormat:@"%@\n", self.nodeModelStringsPlist[@"dictionaryTypeString"]];
            listTypeString = [listTypeString stringByReplacingOccurrencesOfString:@"[PropertyName]" withString:nodeModel.listType];
            listTypeString = [listTypeString stringByReplacingOccurrencesOfString:@"[PropertyClass]" withString:nodeModel.modelName];
            
            [mPropertyString appendString:listTypeString];
        }
    }
    self.modelMFileString = [self.modelMFileString stringByReplacingOccurrencesOfString:@"[ListProperties-WaitForReplaced]"
                                                                             withString:mPropertyString];
    NSError * error = nil;
    [self.modelHeaderFileString writeToFile:[self filePathWithFileName:[self.nodeModel.modelName stringByAppendingString:@".h"]]
                                 atomically:YES
                                   encoding:NSUTF8StringEncoding
                                      error:&error];
    
    [self.modelMFileString writeToFile:[self filePathWithFileName:[self.nodeModel.modelName stringByAppendingString:@".m"]]
                            atomically:YES
                              encoding:NSUTF8StringEncoding
                                 error:nil];
    
}

- (void)string:(NSString *)string replaceString:(NSString *)replaceString withString:(NSString *)newString {
    
    [string stringByReplacingOccurrencesOfString:replaceString
                                      withString:newString];
}

- (NSString *)filePathWithFileName:(NSString *)name {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@", name]];
}

@end
