//
//  NodeBaseViewModel.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeViewModel.h"
#import "NodeBaseCellViewModel.h"
#import "PropertyInfomation.h"
#import "CommonData.h"
#import <KVOController/FBKVOController.h>
#import "NodeMultiCellViewModel.h"
#import "NodeContext.h"

@interface NodeViewModel ()

@property (nonatomic, strong) NSArray *cellViewModelList;
@property(nonatomic, strong) FBKVOController *kvoController;

@end

@implementation NodeViewModel

- (void)fetchData {
    
    
    
    NSArray<PropertyInfomation *> *array =  self.nodeModel.properties;
    self.cellViewModelList = [self convertToCellViewModels:array];
}

- (NSArray *)convertToCellViewModels:(NSArray<PropertyInfomation *> *)array {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<[array count]; i++) {
        PropertyInfomation *model = array[i];
        NodeBaseCellViewModel *cellViewModel = [NodeViewModel createCellViewModel:model];
        [cellVMArray addObject:cellViewModel];
    }
    return cellVMArray;
}





+ (NodeBaseCellViewModel *)createCellViewModel:(PropertyInfomation *)info {
    
    if (info.propertyType == kNSDictionary || info.propertyType == kNSArray) {
        NodeBaseCellViewModel *cellViewModel = [[NodeMultiCellViewModel alloc] initWithPropertyInfomation:info];
        return cellViewModel;
    }
    
    NodeBaseCellViewModel *cellViewModel = [[NodeBaseCellViewModel alloc] initWithPropertyInfomation:info];
    return cellViewModel;
}


- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}

@end
