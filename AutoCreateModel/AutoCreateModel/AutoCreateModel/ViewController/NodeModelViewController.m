//
//  NodeModelViewController.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeModelViewController.h"
#import "AutoModelPCH.h"
#import "NodeModelTableViewCoordinator.h"
#import "NodeContext.h"
#import "NodeTopBaseView.h"
#import "PickViewCoordinator.h"
#import "NodeBaseCellView.h"

@interface NodeModelViewController ()

@property (nonatomic, strong) NodeModelTableViewCoordinator *tableViewCD;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PickViewCoordinator *pickViewCD;
@property (nonatomic, weak)  UIPickerView * pickView;
@property (nonatomic, strong) NSIndexPath * selectIndexPath;

@end

@implementation NodeModelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.context = [[NodeContext alloc]initWithViewController:self];
    [self setup];
    
    [self addSubView];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [CommonData shareInstance].nodeModel.modelName;
    
    if ([CommonData shareInstance].nodeModel.level == 0) {
        UIButton *createButton       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [createButton setTitle:@"生成Model" forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_3 forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_6 forState:UIControlStateHighlighted];
        [createButton addTarget:self action:@selector(createModelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    }
    
}


- (void)createModelBtnClick:(UIButton *)button {
    
}

- (void)addSubView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
    
    self.tableViewCD = [[NodeModelTableViewCoordinator alloc] initWithTableView:tableView];
    self.tableView = tableView;
    
    self.pickViewCD = [[PickViewCoordinator alloc]initWithContext:self];
    self.pickView = self.pickViewCD.pickView;
    
}


- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    //拦截事件
    if ([eventName isEqualToString:propertyTypeButtonClickEvent]) {
        
        id tableViewCell = [userInfo objectForKey:MessageIdKey];
        
        if ([tableViewCell isKindOfClass:[NodeBaseCellView class]]) {
            
            self.selectIndexPath = [self.tableView indexPathForCell:tableViewCell];
            [self.view addSubview:self.pickView];
        }
        
        
    }else if ([eventName isEqualToString:pickViewCoordinatorClickEvent]) {
        
        NSNumber* rowNum = [userInfo objectForKey:MessageIdKey];
        PropertyInfomation* info = [CommonData shareInstance].nodeModel.properties[self.selectIndexPath.row];
        info.propertyType = [rowNum integerValue];
        [self.tableViewCD reloadData];
    }
}

@end
