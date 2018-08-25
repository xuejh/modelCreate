//
//  NodeBaseCellView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoModelPCH.h"
#import "NodeTopBaseView.h"



@interface NodeBaseCellView : UITableViewCell

@property(nonatomic, assign) PropertyType propertyType;
@property(nonatomic, weak) id propertyValue;

@end
