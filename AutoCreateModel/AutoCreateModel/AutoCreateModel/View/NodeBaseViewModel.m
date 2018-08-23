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

@interface NodeBaseViewModel ()
@property (nonatomic, strong) NSArray *cellViewModelList;
@end

@implementation NodeBaseViewModel

- (void)fetchData {
    
    NSArray<PropertyInfomation *> *array =  self.nodeModel.properties;
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

@end
