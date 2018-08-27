//
//  NodeModelViewController.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "BaseViewController.h"
#import "NodeModel.h"
#import "NodeTableViewModel.h"
#import "CommonData.h"

@interface NodeModelViewController : BaseViewController

/**
 * tableViewModel所用的数据源nodeModel
 *
 */

@property (nonatomic,strong)NodeModel *nodeModel;

@end
