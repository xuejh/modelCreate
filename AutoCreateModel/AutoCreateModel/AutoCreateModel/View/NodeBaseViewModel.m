//
//  NodeBaseViewModel.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeBaseViewModel.h"
#import "NodeBaseCellViewModel.h"
#import "PropertyInfomation.h"
#import "CommonData.h"
#import <KVOController/FBKVOController.h>

@interface NodeBaseViewModel ()

@property (nonatomic, strong) NSArray *cellViewModelList;
@property(nonatomic, strong) FBKVOController *kvoController;

@end

@implementation NodeBaseViewModel

- (void)fetchData {
    
    NSArray<PropertyInfomation *> *array =  [CommonData shareInstance].nodeModel.properties;
    self.cellViewModelList = [self convertToCellViewModels:array];
}

- (NSArray *)convertToCellViewModels:(NSArray<PropertyInfomation *> *)array {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<[array count]; i++) {
        PropertyInfomation *model = array[i];
        NodeBaseCellViewModel *cellViewModel = [NodeBaseViewModel createCellViewModel:model];
        [cellVMArray addObject:cellViewModel];
    }
    return cellVMArray;
}





+ (NodeBaseCellViewModel *)createCellViewModel:(PropertyInfomation *)info {
    
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
