//
//  NodeMultiCellCoordinator.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeMultiCellView;
@class NodeCellViewModel;

@interface NodeMultiCellCoordinator : NSObject

/**
 *    初始化cell协调器
 *
 *    @param cell 指定的cell变量
 *
 *
 */

- (instancetype)initWithCellView:(NodeMultiCellView *)cell;

/**
 *    实现Model与cell的数据绑定
 *
 *    @param cellViewModel 对应的model对象
 *
 *
 */

- (void)bindData:(NodeCellViewModel *)cellViewModel;

/**
 *    cellView选中回调
 *
 */

- (void)didSelectCellView;

@end
