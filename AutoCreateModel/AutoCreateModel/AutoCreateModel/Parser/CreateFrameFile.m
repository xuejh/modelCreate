//
//  CreateFile.m
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import "CreateFrameFile.h"

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

- (void)createCellViewFile{
    
    NSString *cellViewHeaderFileString = self.plistDic[@"cellViewHeaderFileString"];
    NSString * cellViewFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellView"];
    
    NSDictionary * data = [self getCellModelPlist];
    
    
    NSString *propetiesString = [self convertHeadProperty:data];
    
    cellViewHeaderFileString = [cellViewHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                       withString:propetiesString];

    [self writeHeadFile:cellViewHeaderFileString headfileName:cellViewFileName];
    
    
    NSString *cellViewMFileString = self.plistDic[@"cellViewMFileString"];
    NSArray * keys = [data allKeys];
    propetiesString = @"";
    for (int i=0; i<keys.count; i++) {
        
        NSString *value = [keys objectAtIndex:i];
        NSString *type = [data objectForKey:value];
        NSString * bValue = [NSString stringWithFormat:@"%@%@",[[value substringToIndex:1]uppercaseString],[value substringFromIndex:1]];
        
        NSString *tmpSting = [NSString stringWithFormat:@"- (void)set%@:(%@ *)%@ {\n    _%@ = %@;\n}\n\n",bValue, type,value,value,value];
        propetiesString = [propetiesString stringByAppendingString:tmpSting];
        
    }
    
    cellViewMFileString = [cellViewMFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
                                                                                   withString:propetiesString];
    
    [self writeMFile:cellViewMFileString MfileName:cellViewFileName];
    
    
}

- (void)createCellViewModelFile{
    
    NSString *cellViewModelHeaderFileString = self.plistDic[@"cellViewModelHeaderFileString"];
    NSString * cellViewModelFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellViewModel"];
    
    cellViewModelHeaderFileString  = [cellViewModelHeaderFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                       withString:self.modelInCellName];
    NSString *lowerStr = [NSString stringWithFormat:@"%@%@",[[self.modelInCellName substringToIndex:1]lowercaseString],[self.modelInCellName substringFromIndex:1]];
    cellViewModelHeaderFileString  = [cellViewModelHeaderFileString  stringByReplacingOccurrencesOfString:@"[ModelLowName-WaitForReplaced]"
                                                                                               withString:lowerStr];
    NSDictionary * data = [self getCellModelPlist];
    NSString *propetiesString = [self convertHeadProperty:data];
    
    cellViewModelHeaderFileString = [cellViewModelHeaderFileString stringByReplacingOccurrencesOfString:@"[PropertiesList-WaitForReplaced]"
    
                                                                                             withString:propetiesString];
    
    [self writeHeadFile:cellViewModelHeaderFileString headfileName:cellViewModelFileName];
    
    
    NSString *cellViewModelMFileString = self.plistDic[@"cellViewModelMFileString"];
    cellViewModelMFileString  = [cellViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                               withString:self.modelInCellName];
    cellViewModelMFileString  = [cellViewModelMFileString  stringByReplacingOccurrencesOfString:@"[ModelLowName-WaitForReplaced]"
                                                                                               withString:lowerStr];
    [self writeMFile:cellViewModelMFileString MfileName:cellViewModelFileName];
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


- (void)createCellCoordinatorFile{
    
    NSString *cellCoordinaterHeaderFileString = self.plistDic[@"cellCoordinaterHeaderFileString"];
    NSString *cellCoordinaterFileName = [NSString stringWithFormat:@"%@%@",self.frameName,@"CellCoordinator"];
    [self writeHeadFile:cellCoordinaterHeaderFileString headfileName:cellCoordinaterFileName];
    
    NSString *cellCoordinaterMFileString = self.plistDic[@"cellCoordinaterMFileString"];
    
    cellCoordinaterMFileString  = [cellCoordinaterMFileString  stringByReplacingOccurrencesOfString:@"[ModelName-WaitForReplaced]"
                                                                                                   withString:self.modelInCellName];
    [self writeMFile:cellCoordinaterMFileString MfileName:cellCoordinaterFileName];
    
    
    
}

- (NSString *)filePathWithFileName:(NSString *)name {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@", name]];
}

- (NSDictionary*)getCellModelPlist{
    NSString     *path = [[NSBundle mainBundle] pathForResource:@"cellModel.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    return data;
}

- (NSString*)convertHeadProperty:(NSDictionary*)data{
    
    // 替换头文件属性
    NSString *propetiesString = @"";
    
    NSArray * keys = [data allKeys];
    for (int i=0; i<keys.count; i++) {
        
        NSString *value = [keys objectAtIndex:i];
        NSString *type = [data objectForKey:value];
        
        NSString *tmpSting = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;\n", type,value];
        propetiesString = [propetiesString stringByAppendingString:tmpSting];
        
    }
    return propetiesString;
}
@end
