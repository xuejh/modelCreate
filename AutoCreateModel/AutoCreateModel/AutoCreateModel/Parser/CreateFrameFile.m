//
//  CreateFile.m
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import "CreateFrameFile.h"
#import "CommonData.h"
#import "PropertyInfomation.h"

@interface CreateFrameFile()

@property (nonatomic,strong)NSDictionary * plistDic;




@end


@implementation CreateFrameFile


- (instancetype)init {
    
    if (self = [super init]) {
        
        self.plistDic = [self convertPlist];
        
        
    }
    
    return self;
}


/**
 *  获取plist文件
 *
 *  @return 字典
 */
- (NSDictionary *)convertPlist {
    
    NSString     *path = [[NSBundle mainBundle] pathForResource:@"mainFile.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return data;
}


- (void)createFile {
    
    [self createOBjectiveCFile];
    [self createContextFile];
    [self createTableViewModelFile];
    [self createCellViewFile];
    [self createCellViewModelFile];
    [self createTableViewCoordinatorFile];
    [self createCellCoordinatorFile];
}



- (void)createOBjectiveCFile {
    
    [self createViewControllerFile];
//    [self logPath];
    
}

//- (void)logPath{
//     NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
//}

- (void)writeHeadFile:(NSString*)fileStr headfileName:(NSString*)headerName{
    
   NSString*  mfileStr = [fileStr stringByReplacingOccurrencesOfString:@"[FileName-WaitForReplaced]"
                                                                                               withString:self.frameName];
    NSError * error = nil;
    [mfileStr writeToFile:[self filePathWithFileName:[headerName stringByAppendingString:@".h"]]
                                     atomically:YES
                                       encoding:NSUTF8StringEncoding
                                          error:&error];
    
    
}

- (void)writeMFile:(NSString*)fileStr MfileName:(NSString*)headerName{
    
    NSString*  mfileStr = [fileStr stringByReplacingOccurrencesOfString:@"[FileName-WaitForReplaced]"
                                                             withString:self.frameName];
    NSError * error = nil;
    [mfileStr writeToFile:[self filePathWithFileName:[headerName stringByAppendingString:@".m"]]
               atomically:YES
                 encoding:NSUTF8StringEncoding
                    error:&error];
    
    
}



- (void)createViewControllerFile{
    
    NSString *viewControllerHeaderFileString = self.plistDic[@"viewControllerHeaderFileString"];
    NSString * viewControllerFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"ViewController"];
    [self writeHeadFile:viewControllerHeaderFileString headfileName:viewControllerFileName];
    
    NSString *viewControllerMFileString = self.plistDic[@"viewControllerMFileString"];
    [self writeMFile:viewControllerMFileString MfileName:viewControllerFileName];
    
}

- (void)createContextFile{
    
    NSString *contextHeaderFileString = self.plistDic[@"contextHeaderFileString"];
    NSString * contextFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"Context"];
    [self writeHeadFile:contextHeaderFileString headfileName:contextFileName];
    
    NSString *contextMFileString = self.plistDic[@"contextMFileString"];
    [self writeMFile:contextMFileString MfileName:contextFileName];
   
    
}

- (void)createTableViewModelFile{
    
    NSString *tableViewModelHeaderFileString = self.plistDic[@"tableViewModelHeaderFileString"];
    NSString * tableViewModelFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"TableViewModel"];
    [self writeHeadFile:tableViewModelHeaderFileString headfileName:tableViewModelFileName];
    
    NSString *tableViewModelMFileString = self.plistDic[@"tableViewModelMFileString"];
    
    tableViewModelMFileString  = [tableViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                         withString:self.modelInCellName];
   [self writeMFile:tableViewModelMFileString MfileName:tableViewModelFileName];
}

- (NSString *)convertModelInCellHeadPropertyFile{
    NodeModel *nodeModel = [self getModelInCell];
    NSString *propetiesString = @"";
    
    for (PropertyInfomation *property in nodeModel.properties) {
        
        switch (property.propertyType) {
                
            case kNSString: {
                
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;\n", property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSNumber: {
                
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) NSNumber *%@;\n", property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSDictionary: {
                
                NodeModel *nodeModel = property.propertyValue;
                NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;\n", nodeModel.modelName, nodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            default:
                break;
        }
    }
    return propetiesString;
}

- (NSString *)convertModelInCellHeadFile{
    
    NodeModel *nodeModel = [self getModelInCell];
    NSString *inputHeaderString = @"";
    for (PropertyInfomation *property in nodeModel.properties) {
        
        if (property.propertyType == kNSDictionary || property.propertyType == kNSArray) {
            
            NodeModel *node        = property.propertyValue;
            NSString *importString = [NSString stringWithFormat:@"#import \"%@.h\"\n", node.modelName];
            inputHeaderString      = [inputHeaderString stringByAppendingString:importString];
        }
    }
    return inputHeaderString;
}

- (NSString *)convertModelInCellMPropertyFile{
    NodeModel *nodeModel = [self getModelInCell];
    NSString *propetiesString = @"";
    
    for (PropertyInfomation *property in nodeModel.properties) {
        
        switch (property.propertyType) {
                
            case kNSString: {
                NSString *bValue = [NSString stringWithFormat:@"%@%@",[[property.propertyValue substringToIndex:1]uppercaseString],[property.propertyValue substringFromIndex:1]];
                NSString *tmpSting = [NSString stringWithFormat:@"- (void)set%@:(NSString *)%@ {\n    _%@ = %@;\n}\n\n",bValue,property.propertyValue,property.propertyValue,property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSNumber: {
                NSString *bValue = [NSString stringWithFormat:@"%@%@",[[property.propertyValue substringToIndex:1]uppercaseString],[property.propertyValue substringFromIndex:1]];
                NSString *tmpSting = [NSString stringWithFormat:@"- (void)set%@:(NSNumber *)%@ {\n    _%@ = %@;\n}\n\n",bValue,property.propertyValue,property.propertyValue,property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSDictionary: {
                
                NodeModel *nodeModel = property.propertyValue;
                NSString *bValue = [NSString stringWithFormat:@"%@%@",[[nodeModel.listType substringToIndex:1]uppercaseString],[nodeModel.listType substringFromIndex:1]];
                
                NSString *tmpSting = [NSString stringWithFormat:@"- (void)set%@:(%@ *)%@ {\n    _%@ = %@;\n}\n\n",bValue,nodeModel.modelName,nodeModel.listType,nodeModel.listType,nodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            default:
                break;
        }
    }
    return propetiesString;
}


- (NSString *)convertModelBindMFile{
    NodeModel *nodeModel = [self getModelInCell];
    NSString *propetiesString = @"";
    
    for (PropertyInfomation *property in nodeModel.properties) {
        
        switch (property.propertyType) {
                
            case kNSString:
            case kNSNumber:
            {
                NSString *tmpSting = [NSString stringWithFormat:@"self.%@ = model.%@;\n        ",property.propertyValue,property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
          
            case kNSDictionary: {
                
                NodeModel *subNodeModel = property.propertyValue;
                NSString *tmpSting = [NSString stringWithFormat:@"self.%@ = model.%@;\n        ",subNodeModel.listType,subNodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            default:
                break;
        }
    }
    return propetiesString;
}



- (void)createCellViewFile{

    NSString *cellViewHeaderFileString = self.plistDic[@"cellViewHeaderFileString"];
    NSString * cellViewFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellView"];


    
    
    NSString * propetiesString = [self convertModelInCellHeadPropertyFile];
    cellViewHeaderFileString = [cellViewHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                       withString:propetiesString];
    
    NSString *inputHeaderString = [self convertModelInCellHeadFile];
    
    cellViewHeaderFileString = [cellViewHeaderFileString stringByReplacingOccurrencesOfString:@"[FileHeaders-WaitForReplaced]"
                                                                                       withString:inputHeaderString];
    

    [self writeHeadFile:cellViewHeaderFileString headfileName:cellViewFileName];


    NSString *cellViewMFileString = self.plistDic[@"cellViewMFileString"];
    
    propetiesString = [self convertModelInCellMPropertyFile];
    

    cellViewMFileString = [cellViewMFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                   withString:propetiesString];

    [self writeMFile:cellViewMFileString MfileName:cellViewFileName];


}

- (void)createCellViewModelFile{

    NSString *cellViewModelHeaderFileString = self.plistDic[@"cellViewModelHeaderFileString"];
    NSString * cellViewModelFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellViewModel"];
    
    NSString * propetiesString = [self convertModelInCellHeadPropertyFile];
    cellViewModelHeaderFileString = [cellViewModelHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                   withString:propetiesString];
    NSString *inputHeaderString = [self convertModelInCellHeadFile];
    cellViewModelHeaderFileString = [cellViewModelHeaderFileString stringByReplacingOccurrencesOfString:@"[FileHeaders-WaitForReplaced]"
                                                                                   withString:inputHeaderString];
    
    
    cellViewModelHeaderFileString  = [cellViewModelHeaderFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                               withString:self.modelInCellName];
    
    
    [self writeHeadFile:cellViewModelHeaderFileString headfileName:cellViewModelFileName];


    NSString *cellViewModelMFileString = self.plistDic[@"cellViewModelMFileString"];
    cellViewModelMFileString  = [cellViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                               withString:self.modelInCellName];
    NSString * convertBindString = [self convertModelBindMFile];
    cellViewModelMFileString  = [cellViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelBind-WaitForReplaced]"
                                                                                     withString:convertBindString];
    [self writeMFile:cellViewModelMFileString MfileName:cellViewModelFileName];
}


- (NodeModel*)getModelInCell{
    
    NodeModel *nodeModel = nil;
    self.modelInCellName = [NSString stringWithFormat:@"%@%@",[CommonData shareInstance].preText,[CommonData shareInstance].modelInCellName];
    
    if ([self.modelInCellName isEqualToString:[CommonData shareInstance].nodeModel.modelName]) {
        nodeModel = [CommonData shareInstance].nodeModel;
        return nodeModel;
    }else{
        
        for (PropertyInfomation *property in [CommonData shareInstance].nodeModel.properties) {
            
            switch (property.propertyType) {
                case kNSDictionary:
                case kNSArray:
                {
                    
                    NodeModel *subNodeModel = property.propertyValue;
                    if ([self.modelInCellName isEqualToString:subNodeModel.modelName]) {
                        nodeModel = subNodeModel;
                        return nodeModel;
                    }
                    
                } break;
                default:
                    break;
            }
        }
    }
    return nil;
}

- (void)createTableViewCoordinatorFile{
    
    NSString *tableViewCoordinaterHeaderFileString = self.plistDic[@"tableViewCoordinaterHeaderFileString"];
    NSString * tableViewCoordinatorFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"TableViewCoordinator"];
    [self writeHeadFile:tableViewCoordinaterHeaderFileString headfileName:tableViewCoordinatorFileName];
    
    NSString *tableViewCoordinaterMFileString = self.plistDic[@"tableViewCoordinaterMFileString"];
    
    tableViewCoordinaterMFileString  = [tableViewCoordinaterMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                       withString:self.modelInCellName];
    [self writeMFile:tableViewCoordinaterMFileString MfileName:tableViewCoordinatorFileName];
}

- (NSString *)convertCellCoordinateBindMFile{
    NodeModel *nodeModel = [self getModelInCell];
    NSString *propetiesString = @"";
    
    for (PropertyInfomation *property in nodeModel.properties) {
        
        switch (property.propertyType) {
                
            case kNSString:
            case kNSNumber:
            {
                NSString *tmpSting = [NSString stringWithFormat:@"self.cell.%@ = cellViewModel.%@;\n    ",property.propertyValue,property.propertyValue];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            case kNSDictionary: {
                
                NodeModel *subNodeModel = property.propertyValue;
                NSString *tmpSting = [NSString stringWithFormat:@"self.cell.%@ = cellViewModel.%@;\n    ",subNodeModel.listType,subNodeModel.listType];
                propetiesString = [propetiesString stringByAppendingString:tmpSting];
                
            } break;
                
            default:
                break;
        }
    }
    return propetiesString;
}

- (void)createCellCoordinatorFile{
    
    NSString *cellCoordinaterHeaderFileString = self.plistDic[@"cellCoordinaterHeaderFileString"];
    NSString *cellCoordinaterFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellCoordinator"];
    [self writeHeadFile:cellCoordinaterHeaderFileString headfileName:cellCoordinaterFileName];
    
    NSString *cellCoordinaterMFileString = self.plistDic[@"cellCoordinaterMFileString"];
    
    cellCoordinaterMFileString  = [cellCoordinaterMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                                   withString:self.modelInCellName];
    NSString * convertCellCoordinateBindString = [self convertCellCoordinateBindMFile];
    cellCoordinaterMFileString  = [cellCoordinaterMFileString  stringByReplacingOccurrencesOfString:@"[ModelBind-WaitForReplaced]"
                                                                                     withString:convertCellCoordinateBindString];
    
    [self writeMFile:cellCoordinaterMFileString MfileName:cellCoordinaterFileName];
    
    
    
}

- (NSString *)filePathWithFileName:(NSString *)name {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@", name]];
}




@end
