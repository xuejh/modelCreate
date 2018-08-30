//
//  CreateFile.h
//  AutoAppFrame
//
//  Created by jinhui  xue on 2018/8/26.
//  Copyright © 2018年 jinhui  xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateFrameFile : NSObject

/**
 *    框架的统一命名
 */

@property (nonatomic,strong)NSString *frameName;

/**
 *    Cell对应的Model名字
 */

@property (nonatomic,strong)NSString *modelInCellName;

/**
 *    创建框架文件
 */
- (void)createFile;

@end
