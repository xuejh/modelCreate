//
//  NodeBaseCellCoordinator.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeCellCoordinator.h"
#import "NodeCellView.h"
#import "NodeCellViewModel.h"

@interface  NodeCellCoordinator()

@property(nonatomic, weak) NodeCellView *cell;
@property(nonatomic, weak) NodeCellViewModel *cellViewModel;

@end

@implementation NodeCellCoordinator

- (instancetype)initWithCellView:(NodeCellView *)cell{
    
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
