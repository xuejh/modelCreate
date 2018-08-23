//
//  NodeModelViewController.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeModelViewController.h"
#import <KVOController/FBKVOController.h>
#import "AutoModelPCH.h"
#import "NodeBaseCellView.h"
#import "NodeBaseCellViewModel.h"
#import "NodeBaseCellCoordinator.h"
#import <KVOController/FBKVOController.h>
#import "NodeContext.h"

@interface NodeModelViewController ()<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableDictionary *coordinatorDic; //用于保存cell协调器，用于和cell一一对应
@property(nonatomic, strong) FBKVOController *kvoController;

@end

@implementation NodeModelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.context = [[NodeContext alloc]initWithViewController:self];
    [self setup];
    
    [self addSubView];
    [self bindData];
    [self fetchData];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.viewModel.nodeModel.modelName;
    
    if (self.viewModel.nodeModel.level == 0) {
        UIButton *createButton       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [createButton setTitle:@"生成Model" forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_3 forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_6 forState:UIControlStateHighlighted];
        [createButton addTarget:self action:@selector(createModelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    }
    
}

- (void)addSubView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
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
