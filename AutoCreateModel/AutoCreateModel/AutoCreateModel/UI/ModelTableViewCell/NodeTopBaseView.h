//
//  NodeTopBaseView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoModelPCH.h"

/**
 *    NodeCellView里的view，NodeMultiCellView的上半部分
 *
 */

@interface NodeTopBaseView : UIView

/**
 *    model对应的类型，为kNSString，kNSNumber等
 */

@property(nonatomic, assign) PropertyType propertyType;

/**
 *    model对应的属性值
 */

@property(nonatomic, weak) id propertyValue;

/**
 *    返回已封装好的自身view
 */

+ (NodeTopBaseView *)createSelf;

@end
