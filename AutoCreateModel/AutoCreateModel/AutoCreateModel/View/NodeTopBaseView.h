//
//  NodeTopBaseView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoModelPCH.h"



@interface NodeTopBaseView : UIView

@property(nonatomic, assign) PropertyType propertyType;
@property(nonatomic, weak) id propertyValue;

+ (NodeTopBaseView *)createSelf;

@end
