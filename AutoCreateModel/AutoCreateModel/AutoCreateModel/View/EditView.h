//
//  EditView.h
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditView : UIView

+ (EditView *)createWithContext:(UIViewController *)context;
- (void)show;
- (void)showWithText:(NSString*)text;
- (void)hidden;

@end
