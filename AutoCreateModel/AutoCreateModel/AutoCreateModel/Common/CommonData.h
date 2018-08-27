//
//  CommonData.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeCellViewModel.h"
#import "NodeModel.h"

/**
 *    通用数据操作类
 */

@interface CommonData : NSObject

/**
 *    类名前缀
 */
@property (nonatomic,strong)NSString *preText;

/**
 *    单例类
 *
 *
 *    @return 返回单例
 *
 */

+ (CommonData *)shareInstance;

/**
 *    是否是NSArray或者字典类型的视图
 *
 *    @param viewModel viewModel对象
 *    @return 返回是或否
 *
 */

- (BOOL)isMultiCell:(NodeCellViewModel*)viewModel;

/**
 *    在类名前面增加统一前缀
 *
 *    @param nodeModel 全局model对象
 *    @param preText 前缀名字
 *
 */
- (void)convertNodeModel:(NodeModel*)nodeModel preText:(NSString*)preText;
@end
