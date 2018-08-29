//
//  EEEChatViewController.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatViewController.h"
#import "EEEChatTableViewCoordinator.h"
#import "UIResponder+Router.h"
#import "UIView+Context.h"
#import "EEEChatContext.h"

@interface EEEChatViewController ()
@property (nonatomic, strong) EEEChatTableViewCoordinator *tableViewCD;
@end

@implementation EEEChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.context = [[EEEChatContext alloc] initWithViewController:self];
    
    // Do any additional setup after loading the view.
    [self installSubModule];
    
    
}

- (void)installSubModule {
    [self installTableViewModule];
}

- (void)installTableViewModule {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    self.tableViewCD = [[EEEChatTableViewCoordinator alloc] initWithTableView:tableView];
}



- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    //拦截事件
    
}
@end
