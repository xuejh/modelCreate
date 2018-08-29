//
//  EEEChatTableViewModel.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatTableViewModel.h"
#import "EEEItemModel.h"
#import "EEEChatCellViewModel.h"

@interface EEEChatTableViewModel ()
@property (nonatomic, strong) NSArray<EEEChatCellViewModel *> *cellViewModelList;  //Model
@end
@implementation EEEChatTableViewModel
- (void)fetchData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //从数据源(dataSource类)获取数据
        NSArray<EEEItemModel *> *array =  [self fetchDataList];
        self.cellViewModelList = [self convertToCellViewModels:array];
    });
}

- (NSArray *)convertToCellViewModels:(NSArray<EEEItemModel *> *)array {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<[array count]; i++) {
        EEEItemModel *model = array[i];
        EEEChatCellViewModel *cellViewModel = [EEEChatTableViewModel createCellViewModel:model];
        
        [cellVMArray addObject:cellViewModel];
    }
    return cellVMArray;
}

- (NSArray<EEEItemModel *> *)fetchDataList {
    
    NSMutableArray *cellVMArray = [NSMutableArray array];
    for (int i=0; i<100; i++) {
        EEEItemModel *conv = [[EEEItemModel alloc] init];
        conv.finish_count = [NSNumber numberWithInt:i];
        [cellVMArray addObject:conv];
    }
    
    return cellVMArray;
}

+ (EEEChatCellViewModel *)createCellViewModel:(EEEItemModel *)model {
    EEEChatCellViewModel *cellViewModel = [[EEEChatCellViewModel alloc] initWithModel:model];
    
    return cellViewModel;
}
@end
