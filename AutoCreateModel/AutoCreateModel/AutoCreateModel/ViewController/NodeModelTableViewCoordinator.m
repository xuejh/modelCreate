//
//  NodeModelTableViewCoordinator.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeModelTableViewCoordinator.h"
#import <KVOController/FBKVOController.h>
#import "NodeBaseCellView.h"
#import "NodeBaseCellViewModel.h"
#import "NodeBaseCellCoordinator.h"
#import <KVOController/FBKVOController.h>
#import "NodeContext.h"
#import "UIResponder+Router.h"

@interface NodeModelTableViewCoordinator ()<UITableViewDelegate,
UITableViewDataSource,UIResponderEventProtocol>

@property (nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) FBKVOController *kvoController;
@property (nonatomic, strong) NodeBaseViewModel *viewModel;
@property(nonatomic, strong) NSMutableDictionary *coordinatorDic; //用于保存cell协调器，用于和cell一一对应
@end

@implementation NodeModelTableViewCoordinator

- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self=[super init]) {
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.eventDelegate = self;
        
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
    
    NodeBaseCellViewModel *cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    return [cellViewModel cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    NSString *identifier = @"identifier";
    NodeBaseCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NodeBaseCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NodeBaseCellCoordinator *cellCoordinator = [self getCoordinatorWithCell:cell];
    [cellCoordinator bindData:cellViewModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
- (void)createModelBtnClick:(UIButton *)button {
    
}


- (NodeBaseCellCoordinator *)getCoordinatorWithCell:(NodeBaseCellView *)cell {
    NSNumber *cellAddress = @((UInt64)cell);
    NodeBaseCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    if (!cellCoordinator) {
        cellCoordinator = [[NodeBaseCellCoordinator alloc] initWithCellView:cell];
        [self.coordinatorDic setObject:cellCoordinator forKey:cellAddress];
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

- (NodeBaseViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[NodeBaseViewModel alloc] init];
    }
    return _viewModel;
}

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    //拦截事件
    if ([eventName isEqualToString:propertyTypeButtonClickEvent]) {
        
        id tableViewCell = [userInfo objectForKey:MessageIdKey];
        NSIndexPath * indexPath = [self.tableView indexPathForCell:tableViewCell];
        NSLog(@"indexPath:%ld,%ld",indexPath.section,indexPath.row);
    }
}

@end