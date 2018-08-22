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

@interface NodeModelViewController ()<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation NodeModelViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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

- (void)addSubView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"ChatPlainTextCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
- (void)createModelBtnClick:(UIButton *)button {
    
}
@end
