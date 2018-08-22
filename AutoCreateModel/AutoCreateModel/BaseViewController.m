//
//  BaseViewController.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "BaseViewController.h"

#ifndef IOS7_OR_LATER_HYEL
#define IOS7_OR_LATER_HYEL        ([[UIDevice currentDevice] systemVersion].integerValue >= 7)
#endif

@interface BaseViewController ()

@end

@implementation BaseViewController


- (id)init
{
    self = [super init];
    if (self) {
        
        if (IOS7_OR_LATER_HYEL)
        {
            self.extendedLayoutIncludesOpaqueBars = NO;
        }
        self.hidesBottomBarWhenPushed = YES;
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (IOS7_OR_LATER_HYEL)
    {
        self.edgesForExtendedLayout = UIRectEdgeBottom;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
