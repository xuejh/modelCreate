//
//  NodeTopBaseView.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeTopBaseView.h"
#import "UIResponder+Router.h"

@interface NodeTopBaseView()

@property (nonatomic, strong) UIButton *propertyTypeButton;
@property (nonatomic, strong) UIButton *propertyButton;

@end

@implementation NodeTopBaseView



+ (NodeTopBaseView *)createSelf{
    
    NodeTopBaseView * view = [[NodeTopBaseView alloc]initWithFrame:CGRectMake(0, 0, Width, 44)];
    [view initSubViews];
    return view;
}


- (void)initSubViews {
    
    self.propertyTypeButton = [CommonFactory createPropertyTypeButton];
    self.propertyTypeButton.frame = CGRectMake(15, 0, 100, 44);
    [self addSubview:self.propertyTypeButton];
    [self.propertyTypeButton addTarget:self action:@selector(propertyTypeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.propertyButton = [CommonFactory createPropertyButton];
    self.propertyButton.frame = CGRectMake(Width - 165, 0, 150, 44);
    [self addSubview:self.propertyButton];
}

- (void)setPropertyType:(PropertyType)propertyType{
    
    _propertyType = propertyType;
    [self.propertyTypeButton setTitle:KPropertyTypeString(propertyType) forState:UIControlStateNormal];
}

- (void)setPropertyValue:(id)propertyValue{
    
    if (self.propertyType == kNSDictionary || self.propertyType == kNSArray) {
        
        return;
    }
    
    [self.propertyButton setTitle:propertyValue forState:UIControlStateNormal];
}

- (void)propertyTypeButtonClick{
    
    NSDictionary *userInfo = @{MessageIdKey:self.superview};
    [self routeEvent:propertyTypeButtonClickEvent userInfo:userInfo];
    
}
@end
