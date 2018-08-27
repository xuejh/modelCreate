//
//  NodeBaseCellView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoModelPCH.h"
#import "NodeTopBaseView.h"

@interface NodeCellView : UITableViewCell

/**
 *    model对应的类型，为kNSString，kNSNumber等
 */

@property(nonatomic, assign) PropertyType propertyType;

/**
 *    model对应的属性值
 */

@property(nonatomic, weak) id propertyValue;

@end
