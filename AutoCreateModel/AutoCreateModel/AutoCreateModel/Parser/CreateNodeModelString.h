//
//  NodeModelStrings.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeModel.h"

@interface CreateNodeModelString : NSObject

/**
 *  节点对象
 */
@property (nonatomic, strong) NodeModel  *nodeModel;

/**
 *  用NodeModel进行初始化
 *
 *  @param nodeModel nodeModel对象
 *
 *  @return CreateNodeModelString对象
 */
+ (instancetype)nodeModelStringsWithNodeModel:(NodeModel *)nodeModel;

/**
 *  创建文件
 */
- (void)createFile;

@end
