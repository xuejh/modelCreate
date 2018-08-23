//
//  NodeBaseCellCoordinator.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeBaseCellCoordinator.h"
#import "NodeBaseCellView.h"
#import "NodeBaseCellViewModel.h"

@interface  NodeBaseCellCoordinator()<NodeBaseCellViewDelegate>

@property(nonatomic, weak) NodeBaseCellView *cell;
@property(nonatomic, weak) NodeBaseCellViewModel *cellViewModel;

@end

@implementation NodeBaseCellCoordinator

- (instancetype)initWithCellView:(NodeBaseCellView *)cell{
    
    if (self = [super init]) {
        self.cell = cell;
        cell.delegate = self;
    }
    return self;
    
}

- (void)bindData:(NodeBaseCellViewModel *)cellViewModel{
    
    self.cellViewModel = cellViewModel;
    self.cell.propertyType = cellViewModel.propertyType;
    self.cell.propertyValue = cellViewModel.propertyValue;
}

- (void)didSelectCellView{
    
}

@end
