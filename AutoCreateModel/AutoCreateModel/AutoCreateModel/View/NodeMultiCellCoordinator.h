//
//  NodeMultiCellCoordinator.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeMultiCellView;
@class NodeBaseCellViewModel;

@interface NodeMultiCellCoordinator : NSObject

- (instancetype)initWithCellView:(NodeMultiCellView *)cell;
- (void)bindData:(NodeBaseCellViewModel *)cellViewModel;
- (void)didSelectCellView;

@end
