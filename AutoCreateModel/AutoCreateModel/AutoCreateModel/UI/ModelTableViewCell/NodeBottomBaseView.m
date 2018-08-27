//
//  NodeBottomBaseView.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeBottomBaseView.h"
#import "CommonFactory.h"
#import "AutoModelPCH.h"
#import "UIView+Context.h"
#import "UIResponder+Router.h"

@interface NodeBottomBaseView()

@property (nonatomic, strong) UIButton *modelButton;

@end

@implementation NodeBottomBaseView

+ (NodeBottomBaseView *)createSelf{
    
    NodeBottomBaseView * view = [[NodeBottomBaseView alloc]initWithFrame:CGRectMake(0, 44, Width, 44)];
    [view initSubViews];
    return view;
}

- (void)initSubViews {
    
    self.modelButton = [CommonFactory createPropertyTypeButton];
    self.modelButton.frame = CGRectMake(15, 0, 200, 44);
    [self addSubview:self.modelButton];
    [self.modelButton addTarget:self action:@selector(modelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)setModelName:(NSString *)modelName{
    
    [self.modelButton setTitle:modelName forState:UIControlStateNormal];
}

- (void)modelButtonClick{
    
    NSDictionary *userInfo = @{MessageIdKey:self.superview};
    [self routeEvent:modelButtonClickEvent userInfo:userInfo];
    
}
@end
