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
#import "NodeMultiCellView.h"
#import "EditView.h"
#import "NodeModelStrings.h"

@interface NodeModelViewController ()

@property (nonatomic, strong) NodeModelTableViewCoordinator *tableViewCD;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PickViewCoordinator *pickViewCD;
@property (nonatomic, weak)  UIPickerView * pickView;
@property (nonatomic, strong) NSIndexPath * selectIndexPath;
@property (nonatomic, strong) EditView * editView;

@end

@implementation NodeModelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.context = [[NodeContext alloc]initWithViewController:self];
    NodeContext * context =self.view.context;
    context.nodeModel = self.nodeModel;
    
    [self setup];
    
    [self addSubView];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.nodeModel.modelName;
    
    
    if (self.nodeModel.level == 0) {
        UIButton *createButton       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [createButton setTitle:@"生成Model" forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_3 forState:UIControlStateNormal];
        [createButton setTitleColor:COLOR_6 forState:UIControlStateHighlighted];
        [createButton addTarget:self action:@selector(createModelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createButton];
    }
    
}



- (void)createModelBtnClick:(UIButton *)button {
    
    for (NodeModel *node in self.nodeModel.allSubNodes) {
        
        NodeModelStrings *nodeModelString = [NodeModelStrings nodeModelStringsWithNodeModel:node];
        [nodeModelString createFile];
    }
    
    NSLog(@"生成的文件在以下地址: \n%@", [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]);
    
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
    
    self.editView = [EditView createWithContext:self];
    [self.view addSubview:self.editView];
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
        PropertyInfomation* info = self.nodeModel.properties[self.selectIndexPath.row];
        info.propertyType = [rowNum integerValue];
        [self.tableViewCD reloadData];
    }else if ([eventName isEqualToString:modelButtonClickEvent]) {
        
        id tableViewCell = [userInfo objectForKey:MessageIdKey];
        
        if ([tableViewCell isKindOfClass:[NodeMultiCellView class]]) {
            
            self.selectIndexPath = [self.tableView indexPathForCell:tableViewCell];
            PropertyInfomation* info = self.nodeModel.properties[self.selectIndexPath.row];
            NodeModel *node             = info.propertyValue;
            [self.editView showWithText:node.modelName];
        }
    }else if ([eventName isEqualToString:doneButtonClickEvent]) {
        
        NSString* editText = [userInfo objectForKey:MessageIdKey];
        PropertyInfomation* info = self.nodeModel.properties[self.selectIndexPath.row];
        NodeModel *node             = info.propertyValue;
        node.modelName = editText;
        [self.tableViewCD reloadData];
    }
    
    
}

@end
