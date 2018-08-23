//
//  NodeBaseCellView.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeBaseCellView.h"
#import "AutoModelPCH.h"

@interface NodeBaseCellView()

@property (nonatomic, strong) UIButton *propertyTypeButton;
@property (nonatomic, strong) UIButton *propertyButton;

@end

@implementation NodeBaseCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)initSubViews {
    
    self.propertyTypeButton = [CommonFactory createPropertyTypeButton];
    
    self.propertyTypeButton.frame = CGRectMake(0, 0, 100, 44);
    [self addSubview:self.propertyTypeButton];
    
    self.propertyButton = [CommonFactory createPropertyButton];
    
    [self.propertyButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    self.propertyButton.frame = CGRectMake(Width - 170, 0, 150, 44);
    self.propertyButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.propertyButton];
}

- (void)setPropertyType:(PropertyType)propertyType{
    
    
    [self.propertyTypeButton setTitle:@"1" forState:UIControlStateNormal];
}

- (void)setPropertyValue:(id)propertyValue{
    
    if (self.propertyType == kNSDictionary || self.propertyType == kNSArray) {
        
        return;
    }
    
    [self.propertyButton setTitle:@"2" forState:UIControlStateNormal];
}
@end
