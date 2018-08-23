//
//  CommonFactory.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/23.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonFactory : NSObject

+ (UIButton*)createCommonButton;
+ (UIButton*)createPropertyTypeButton;
+ (UIButton*)createPropertyButton;
@end
