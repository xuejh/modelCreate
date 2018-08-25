//
//  NodeBaseViewModel.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NodeModel;
@class NodeBaseCellViewModel;

@interface NodeViewModel : NSObject

@property (nonatomic,strong)NodeModel *nodeModel;
@property (nonatomic, strong, readonly) NSArray<NodeBaseCellViewModel *> *cellViewModelList;  //Model
- (void)fetchData;


@end
