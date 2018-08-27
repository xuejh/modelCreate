//
//  PickViewCoordinator.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 * PickView协调器
 *
 */
@interface PickViewCoordinator : NSObject

/**
 * 协调器对应的pickView
 *
 */

@property (readonly, nonatomic,strong)UIPickerView *pickView;

/**
 * 通过上下文初始化协调器
 * @param viewController 上下文对象
 *
 */
- (instancetype)initWithContext:(UIViewController*)viewController;

@end
