//
//  UIResponder+Router.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIResponderEventProtocol <NSObject>

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

@interface UIResponder (Router)

@property(nonatomic, weak) id<UIResponderEventProtocol> eventDelegate;

- (void)routeEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
