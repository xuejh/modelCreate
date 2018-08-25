//
//  PickViewCoordinator.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface PickViewCoordinator : NSObject

@property (readonly, nonatomic,strong)UIPickerView *pickView;

- (instancetype)initWithContext:(UIViewController*)viewController;

@end
