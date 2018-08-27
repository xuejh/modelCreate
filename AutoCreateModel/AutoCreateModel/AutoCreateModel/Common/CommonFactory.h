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

/**
 *    产生本项目使用的通用button
 *
 *
 *    @return 返回对应的UIButton对象
 *
 */

+ (UIButton*)createCommonButton;

/**
 *    产生属性类型使用的通用button
 *
 *
 *    @return 返回对应的UIButton对象
 *
 */

+ (UIButton*)createPropertyTypeButton;

/**
 *    产生属性值使用的通用button
 *
 *
 *    @return 返回对应的UIButton对象
 *
 */

+ (UIButton*)createPropertyButton;
@end
