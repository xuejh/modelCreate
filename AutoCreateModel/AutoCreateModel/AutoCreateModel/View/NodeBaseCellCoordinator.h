//
//  NodeBaseCellCoordinator.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeBaseCellView;
@class NodeBaseCellViewModel;

@interface NodeBaseCellCoordinator : NSObject
- (instancetype)initWithCellView:(NodeBaseCellView *)cell;
- (void)bindData:(NodeBaseCellViewModel *)cellViewModel;
- (void)didSelectCellView;
@end
