//
//  EditView.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *    编辑model名字对应的view
 */

@interface EditView : UIView

/**
 *    初始化EditView，这里把UIViewController当做一个上下文
 *
 *    @param context 指定的上下文
 *    @return 返回值为EditView对象
 *
 */

+ (EditView *)createWithContext:(UIViewController *)context;

/**
 *    显示editView
 */
- (void)show;

/**
 *    显示editView
 *
 *    @param text 指定的model名称对应的文本
 *
 *
 */

- (void)showWithText:(NSString*)text;

/**
 *    隐藏editView
 */

- (void)hidden;

@end
