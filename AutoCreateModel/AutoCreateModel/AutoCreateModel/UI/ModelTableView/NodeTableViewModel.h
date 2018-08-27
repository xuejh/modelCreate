//
//  NodeBaseViewModel.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeModel;
@class NodeCellViewModel;

@interface NodeTableViewModel : NSObject

/**
 * tableViewModel所用的数据源nodeModel
 *
 */

@property (nonatomic,strong)NodeModel *nodeModel;

/**
 * cellViewModel数组
 *
 */

@property (nonatomic, strong, readonly) NSArray<NodeCellViewModel *> *cellViewModelList;

/**
 * 获取数据
 *
 */
- (void)fetchData;


@end
