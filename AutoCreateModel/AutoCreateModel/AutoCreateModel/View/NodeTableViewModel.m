//
//  NodeBaseViewModel.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeTableViewModel.h"
#import "NodeCellViewModel.h"
#import "PropertyInfomation.h"
#import "CommonData.h"
#import <KVOController/FBKVOController.h>
#import "NodeMultiCellViewModel.h"
#import "NodeContext.h"

@interface NodeTableViewModel ()

@property (nonatomic, strong) NSArray *cellViewModelList;
@property(nonatomic, strong) FBKVOController *kvoController;

@end

@implementation NodeTableViewModel

- (void)fetchData {
    
    NSArray<PropertyInfomation *> *array =  self.nodeModel.properties;
    self.cellViewModelList = [self convertToCellViewModels:array];
}

- (NSArray *)convertToCellViewModels:(NSArray<PropertyInfomation *> *)array {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<[array count]; i++) {
        PropertyInfomation *model = array[i];
        NodeCellViewModel *cellViewModel = [NodeTableViewModel createCellViewModel:model];
        [cellVMArray addObject:cellViewModel];
    }
    return cellVMArray;
}





+ (NodeCellViewModel *)createCellViewModel:(PropertyInfomation *)info {
    
    if (info.propertyType == kNSDictionary || info.propertyType == kNSArray) {
        NodeCellViewModel *cellViewModel = [[NodeMultiCellViewModel alloc] initWithPropertyInfomation:info];
        return cellViewModel;
    }
    
    NodeCellViewModel *cellViewModel = [[NodeCellViewModel alloc] initWithPropertyInfomation:info];
    return cellViewModel;
}


- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}

@end
