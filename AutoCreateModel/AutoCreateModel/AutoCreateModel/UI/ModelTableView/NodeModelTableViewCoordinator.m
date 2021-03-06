//
//  NodeModelTableViewCoordinator.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeModelTableViewCoordinator.h"
#import <KVOController/FBKVOController.h>
#import "NodeCellView.h"
#import "NodeCellViewModel.h"
#import "NodeCellCoordinator.h"
#import <KVOController/FBKVOController.h>
#import "NodeContext.h"
#import "UIResponder+Router.h"
#import "NodeMultiCellCoordinator.h"
#import "CommonData.h"
#import "NodeMultiCellView.h"
#import "NodeMultiCellViewModel.h"
#import "UIView+Context.h"
#import "NodeContext.h"
#import "NodeModelViewController.h"

@interface NodeModelTableViewCoordinator ()<UITableViewDelegate,
UITableViewDataSource,UIResponderEventProtocol>

@property (nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) FBKVOController *kvoController;
@property (nonatomic, strong) NodeTableViewModel *viewModel;
@property(nonatomic, strong) NSMutableDictionary *coordinatorDic; //用于保存cell协调器，用于和cell一一对应
@property(nonatomic, strong) NSMutableDictionary *multiCoordinatorDic; //用于保存cell协调器，用于和cell一一对应

@end

@implementation NodeModelTableViewCoordinator

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self=[super init]) {
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
//        tableView.eventDelegate = self;
        
        [self bindData];
        [self fetchData];
        
    }
    
    return self;
}

- (void)bindData {
    [_kvoController unobserveAll];
    __weak typeof (self) wearkSelf = self;
    [self.kvoController observe:self.viewModel keyPath:@"cellViewModelList" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id observer, id object, NSDictionary *change) {
        
        [wearkSelf.tableView reloadData];
    }];
}

- (void)fetchData {
    [self.viewModel fetchData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.cellViewModelList count];;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NodeCellViewModel *cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    
    return [cellViewModel cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    if ([cellViewModel isKindOfClass:[NodeMultiCellViewModel class]]) {
        
        NSString *identifier = @"identifier";
        NodeMultiCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[NodeMultiCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        NodeMultiCellCoordinator *cellCoordinator = [self getMultiCoordinatorWithCell:cell];
        [cellCoordinator bindData:cellViewModel];
        return cell;
        
        
    }else{
        
        NSString *identifier = @"identifier1";
        NodeCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[NodeCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        NodeCellCoordinator *cellCoordinator = [self getCoordinatorWithCell:cell];
        [cellCoordinator bindData:cellViewModel];
        return cell;
        
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id tableViewCell = [tableView cellForRowAtIndexPath:indexPath];
    if ([tableViewCell isKindOfClass:[NodeMultiCellView class]]) {
        
        NodeCellViewModel *cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
        NodeModel * subNodeModel = cellViewModel.propertyValue;
        NodeContext * context = tableView.context;
        NodeModelViewController * controller = [[NodeModelViewController alloc]init];
        controller.nodeModel = subNodeModel;
        [context.controller.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark -



- (NodeCellCoordinator *)getCoordinatorWithCell:(NodeCellView *)cell {
    NSNumber *cellAddress = @((UInt64)cell);
    NodeCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    if (!cellCoordinator) {
        cellCoordinator = [[NodeCellCoordinator alloc] initWithCellView:cell];
        [self.coordinatorDic setObject:cellCoordinator forKey:cellAddress];
    }
    return cellCoordinator;
}

- (NodeMultiCellCoordinator *)getMultiCoordinatorWithCell:(NodeMultiCellView *)cell {
    NSNumber *cellAddress = @((UInt64)cell);
    NodeMultiCellCoordinator *cellCoordinator = [self.multiCoordinatorDic objectForKey:cellAddress];
    if (!cellCoordinator) {
        cellCoordinator = [[NodeMultiCellCoordinator alloc] initWithCellView:cell];
        [self.multiCoordinatorDic setObject:cellCoordinator forKey:cellAddress];
    }
    return cellCoordinator;
}


- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}

- (NSMutableDictionary *)coordinatorDic {
    if (!_coordinatorDic) {
        _coordinatorDic = [NSMutableDictionary dictionary];
    }
    return _coordinatorDic;
}

- (NSMutableDictionary *)multiCoordinatorDic{
    
    if (!_multiCoordinatorDic) {
        _multiCoordinatorDic = [NSMutableDictionary dictionary];
    }
    return _multiCoordinatorDic;
}

- (NodeTableViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[NodeTableViewModel alloc] init];
        NodeContext * context =self.tableView.context;
        _viewModel.nodeModel = context.nodeModel;
    }
    return _viewModel;
}

-  (void)reloadData{
    
    [self fetchData];
    [self.tableView reloadData];
}

@end
