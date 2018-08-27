//
//  NodeBottomBaseView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *    NodeMultiCellView的下半部分
 *
 */

@interface NodeBottomBaseView : UIView

/**
 *    NSArray，dictionary展示的model名字
 *
 */

@property (nonatomic, strong) NSString *modelName;

/**
 *    返回已封装好的自身view
 */

+ (NodeBottomBaseView *)createSelf;

@end
