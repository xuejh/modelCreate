//
//  EEEChatTableViewCoordinator.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatTableViewCoordinator.h"
#import "EEEChatTableViewModel.h"
#import "EEEChatCellViewModel.h"
#import "EEEChatCellCoordinator.h"
#import "EEEChatCellView.h"
#import "UIView+Context.h"
#import "EEEChatContext.h"
#import <KVOController/FBKVOController.h>

@interface EEEChatTableViewCoordinator ()<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) FBKVOController *kvoController;
@property(nonatomic, strong) EEEChatTableViewModel *viewModel;
@property(nonatomic, strong) NSMutableDictionary *coordinatorDic; //用于保存cell协调器，用于和cell一一对应
@end
@implementation EEEChatTableViewCoordinator
- (instancetype)initWithTableView:(UITableView *)tableView {
    if (self=[super init]) {
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
        
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.cellViewModelList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    EEEChatCellViewModel *cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    return [cellViewModel cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellViewModel = self.viewModel.cellViewModelList[indexPath.row];
    NSString *identifier = @"EEEChatPlainTextCell";
    EEEChatCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[EEEChatCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    EEEChatCellCoordinator *cellCoordinator = [self getCoordinatorWithCell:cell];
    [cellCoordinator bindData:cellViewModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSNumber *cellAddress = @((UInt64)cell);
    EEEChatCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    [cellCoordinator didSelectCellView];
}

- (EEEChatCellCoordinator *)getCoordinatorWithCell:(EEEChatCellView *)cell {
    NSNumber *cellAddress = @((UInt64)cell);
    EEEChatCellCoordinator *cellCoordinator = [self.coordinatorDic objectForKey:cellAddress];
    if (!cellCoordinator) {
        cellCoordinator = [[EEEChatCellCoordinator alloc] initWithCellView:cell];
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

- (EEEChatTableViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[EEEChatTableViewModel alloc] init];
    }
    return _viewModel;
}
@end
