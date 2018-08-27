//
//  NodeMultiCellCoordinator.m
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeMultiCellCoordinator.h"
#import "NodeMultiCellView.h"
#import "NodeCellViewModel.h"

@interface  NodeMultiCellCoordinator()

@property(nonatomic, weak) NodeMultiCellView *cell;
@property(nonatomic, weak) NodeCellViewModel *cellViewModel;

@end

@implementation NodeMultiCellCoordinator


- (instancetype)initWithCellView:(NodeMultiCellView *)cell{
    
    if (self = [super init]) {
        self.cell = cell;
    }
    return self;
    
}

- (void)bindData:(NodeCellViewModel *)cellViewModel{
    
    self.cellViewModel = cellViewModel;
    self.cell.propertyType = cellViewModel.propertyType;
    self.cell.propertyValue = cellViewModel.propertyValue;
}

- (void)didSelectCellView{
    
}
@end
