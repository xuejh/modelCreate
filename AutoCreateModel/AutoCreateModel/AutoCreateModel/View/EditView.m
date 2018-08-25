//
//  EditView.m
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "EditView.h"
#import "AutoModelPCH.h"
#import "UIResponder+Router.h"


@interface EditView()

@property (nonatomic, strong) NSArray <NSString *>  *editViewFrames;
@property (nonatomic, strong) UIButton     *blackView;
@property (nonatomic, strong) UIView       *editView;
@property (nonatomic, strong) UITextField  *editField;
@property (nonatomic, weak) UIViewController *context;

@end

@implementation EditView

+ (EditView *)createWithContext:(UIViewController *)context{
    
    EditView *view = [[EditView alloc]initWithFrame:CGRectMake(0, 0, context.view.frame.size.width, context.view.frame.size.height)];
    view.context = context;
    [view initSubViews];
    view.alpha = 0.f;
    return view;
}

- (void)initSubViews{
    
    self.blackView                 = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, Width, self.context.view.frame.size.height - 64)];
    self.blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    [self.blackView addTarget:self action:@selector(blackBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.blackView];
    
    if ([[UIApplication sharedApplication] isStatusBarHidden] == YES) {
        
        self.editViewFrames = @[NSStringFromCGRect(CGRectMake(0, 64 - 20, Width, 30)),
                                NSStringFromCGRect(CGRectMake(0, 64 - 30 - 20, Width, 30))];
        
    } else {
        
        self.editViewFrames = @[NSStringFromCGRect(CGRectMake(0, 64, Width, 30)),
                                NSStringFromCGRect(CGRectMake(0, 64 - 30, Width, 30))];
    }
    
    self.editView                 = [[UIView alloc] initWithFrame:CGRectFromString(self.editViewFrames[1])];
    self.editView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.editView];
    
    self.editField      = [[UITextField alloc] initWithFrame:CGRectMake(10, 4, Width - 125, 22)];
    self.editField.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:14.f];
    [self.editView addSubview:self.editField];
    
    UIButton *cancelButton       = [[UIButton alloc] initWithFrame:CGRectMake(Width - 115, 7, 70, 16)];
    cancelButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:14.f];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.editView addSubview:cancelButton];
    
    UIButton *okButton       = [[UIButton alloc] initWithFrame:CGRectMake(Width - 55, 7, 50, 16)];
    okButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:14.f];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [okButton setTitle:@"Done" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.editView addSubview:okButton];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 26, Width - 125, 1)];
    line.backgroundColor = [UIColor blackColor];
    [self.editView addSubview:line];
    
}


#pragma mark -

- (void)cancelBtnClick{
    
    [self hidden];
}

- (void)blackBtnClick{
    
    [self hidden];
}

- (void)okBtnClick{
    NSDictionary *userInfo = @{MessageIdKey:self.editField.text};
    [self routeEvent:doneButtonClickEvent userInfo:userInfo];
    [self hidden];
}

- (void)show{
    
    self.blackView.userInteractionEnabled = YES;
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.alpha = 1.f;
        self.editView.frame  = CGRectFromString(self.editViewFrames[0]);
    }];
}

- (void)showWithText:(NSString*)text{
   
    self.editField.text = text;
    [self show];
}

- (void)hidden{
    
    self.blackView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.alpha = 0.f;
        self.editView.frame  = CGRectFromString(self.editViewFrames[1]);
        
    } completion:^(BOOL finished) {
        
        
    }];
    
}



@end
