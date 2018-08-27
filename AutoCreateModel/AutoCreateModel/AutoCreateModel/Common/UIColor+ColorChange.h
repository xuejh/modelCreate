//
//  UIColor+ColorChange.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorChange)


/**
 *    颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
 *
 *    @param color 十六进制颜色
 *    @return 返回对应的color对象
 *
 */

+ (UIColor *) colorWithHexString: (NSString *)color;

@end
