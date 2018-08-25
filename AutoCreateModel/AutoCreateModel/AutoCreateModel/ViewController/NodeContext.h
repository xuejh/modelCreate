//
//  NodeContext.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Context.h"
#import "NodeModel.h"

@interface NodeContext : NSObject <UIViewContextProtocol>

@property (nonatomic,strong)NodeModel *nodeModel;
@end
