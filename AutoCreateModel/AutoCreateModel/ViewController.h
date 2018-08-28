//
//  ViewController.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/20.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ViewController : BaseViewController

/**
 *  json字符串对应的textView
 */

@property (nonatomic,strong)IBOutlet UITextView *textView;

/**
 *  第一层model名字对应的textField
 */

@property (nonatomic,strong)IBOutlet UITextField *rootModeltextField;

/**
 *  前缀对应的textField
 */

@property (nonatomic,strong)IBOutlet UITextField *preTextField;


@property (nonatomic,strong)IBOutlet UITextField *cellModelTextField;

@property (nonatomic,strong)IBOutlet UITextField *frameTextField;

@end

