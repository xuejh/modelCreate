//
//  UIResponder+Router.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol UIResponderEventProtocol <NSObject>

/**
 *    事件路由传递
 *
 *    @param eventName 事件名称
 *    @param userInfo 事件需要传递的信息
 *
 */
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

@interface UIResponder (Router)

/**
 *    事件代理
 */
@property(nonatomic, weak) id<UIResponderEventProtocol> eventDelegate;

/**
 *    事件路由传递
 *
 *    @param eventName 事件名称
 *    @param userInfo 事件需要传递的信息
 *
 */
- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
