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

/**
 *    NSArray，dictionary对应的view
 *
 */

@interface NodeMultiCellView : UITableViewCell

/**
 *    model对应的类型，为kNSArray，kNSDictionary
 */

@property(nonatomic, assign) PropertyType propertyType;

/**
 *    model对应的属性值
 */

@property(nonatomic, weak) id propertyValue;

@end
