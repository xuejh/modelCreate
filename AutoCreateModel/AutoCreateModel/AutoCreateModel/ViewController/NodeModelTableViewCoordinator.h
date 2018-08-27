//
//  NodeModelTableViewCoordinator.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NodeModelTableViewCoordinator : NSObject

/**
 *    初始化tableview协调器
 *
 *    @param tableView tableView对象
 *
 *
 */

- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 *    tableview reload，这里增加了一些特殊操作
 *
 */

-  (void)reloadData;
@end
