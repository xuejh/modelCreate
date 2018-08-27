//
//  PickViewCoordinator.m
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "PickViewCoordinator.h"
#import "AutoModelPCH.h"
#import "UIResponder+Router.h"
#import "UIView+Context.h"

@interface PickViewCoordinator()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)UIPickerView *pickView;
@property (nonatomic,weak)UIViewController *context;
@property (nonatomic,strong)NSArray * dataArray;

@end

@implementation PickViewCoordinator

- (instancetype)initWithContext:(UIViewController*)viewController{
    if (self=[super init]) {
        
        self.context = viewController;
        
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.context.view.frame.size.height-216, Width, 216)];
        // 显示选中框
        pickerView.showsSelectionIndicator=YES;
        pickerView.dataSource = self;
        pickerView.delegate = self;

        self.dataArray =  [cPropertyTypeGet subarrayWithRange:NSMakeRange(0, 3)];
        
        self.pickView = pickerView;
    }
    
    return self;
}


#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    
    return [self.dataArray count];
}

#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDictionary *userInfo = @{MessageIdKey:[NSNumber numberWithInteger:row]};
    [self.pickView routeEvent:pickViewCoordinatorClickEvent userInfo:userInfo];
    
    [self.pickView removeFromSuperview];
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dataArray objectAtIndex:row];
}

@end
