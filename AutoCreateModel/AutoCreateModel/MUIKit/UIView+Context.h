//
//  UIView+Context.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewContextProtocol <NSObject>

@property(nonatomic, weak, readonly) UIViewController *controller;

- (instancetype)initWithViewController:(UIViewController *)controller;

@end

@interface UIView (Context)

@property(nonatomic, strong) id<UIViewContextProtocol> context;

@end
