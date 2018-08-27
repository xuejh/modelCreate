//
//  UIView+Context.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewContextProtocol <NSObject>

/**
 *    上下文对应的controller
 */

@property(nonatomic, weak, readonly) UIViewController *controller;

/**
 *    初始化函数
 *
 *    @param controller controller名称
 *
 */

- (instancetype)initWithViewController:(UIViewController *)controller;

@end

@interface UIView (Context)

/**
 *    view对应的上下文
 */
@property(nonatomic, strong) id<UIViewContextProtocol> context;

@end
