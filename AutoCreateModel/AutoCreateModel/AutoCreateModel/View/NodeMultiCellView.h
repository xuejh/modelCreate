//
//  NodeMultiCellView.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoModelPCH.h"
#import "NodeTopBaseView.h"

@interface NodeMultiCellView : UITableViewCell

@property(nonatomic, assign) PropertyType propertyType;
@property(nonatomic, weak) id propertyValue;

@end
