//
//  NodeModelCell.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeModelCell.h"

#import "PropertyInfomation.h"
#import "NodeModel.h"
#import "NodeModelViewController1.h"
#import "NodePressAnimationView.h"

#define  Width   [UIScreen mainScreen].bounds.size.width
#define  Height  [UIScreen mainScreen].bounds.size.height

@interface NodeModelCell () <NodePressAnimationViewDelegate>

/**
 *  背景按钮
 */
@property (nonatomic, strong) UIButton *backgroundButton;

/**
 *  属性类型label
 */
@property (nonatomic, strong) UILabel  *propertyTypeLabel;

/**
 *  属性名字label
 */
@property (nonatomic, strong) UILabel  *propertyNameLabel;

/**
 *  可编辑的modelNameLabel
 */
@property (nonatomic, strong) UILabel  *modelNameLabel;

/**
 *  编辑按钮
 */
@property (nonatomic, strong) NodePressAnimationView  *pressButton;

/**
 *  箭头view
 */
@property (nonatomic, strong) UIImageView *indicatorView;

@end

@implementation NodeModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setup {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildSubview {
    
    // 创建按钮
    self.backgroundButton     = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Width, 49)];
    [self addSubview:self.backgroundButton];
    [self.backgroundButton addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    // 分割线条
    UIView *lineView         = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, Width, 0.5)];
    lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15];
    [self addSubview:lineView];
    
    // 属性label
    self.propertyTypeLabel       = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 220, 20.f)];
    self.propertyTypeLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.propertyTypeLabel];
    
    // 属性名字label
    self.propertyNameLabel       = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, 200, 30)];
    [self addSubview:self.propertyNameLabel];
    
    // 编辑按钮
    self.pressButton = [[NodePressAnimationView alloc] initWithFrame:CGRectMake(Width - 150 - 40, 25, 150, 16)];
    self.pressButton.backgroundColor    = [UIColor blackColor];
    self.pressButton.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.pressButton.normalTextColor    = [UIColor whiteColor];
    self.pressButton.highlightTextColor = [UIColor blackColor];
    self.pressButton.layer.borderWidth  = 0.5f;
    self.pressButton.animationColor     = [UIColor whiteColor];
    self.pressButton.animationWidth     = 60;
    self.pressButton.toNormalDuration   = 0.25f;
    self.pressButton.toEndDuration      = 0.25f;
    self.pressButton.text               = @"Edit Model Name";
    self.pressButton.delegate           = self;
    [self addSubview:self.pressButton];
    
    // Model的名字(可以编辑)
    self.modelNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width - 190, 5, 150, 20)];
    self.modelNameLabel.adjustsFontSizeToFitWidth = YES;
    self.modelNameLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.modelNameLabel];
    
    // 指示图片
    self.indicatorView       = [[UIImageView alloc] initWithFrame:CGRectMake(Width - 27 / 2.f - 10, 17, 27 / 3.f, 51 / 3.f)];
    self.indicatorView.image = [UIImage imageNamed:@"NodeModelViewControllerBack_next"];
    [self addSubview:self.indicatorView];
}

- (void)loadData {
    
    PropertyInfomation *property = self.data;
    
    [self propertyTypeLabelState:property.propertyType];
    
    if (property.propertyType == kNSString) {
        
        self.propertyTypeLabel.text = @"NSString";
        self.propertyNameLabel.text = property.propertyValue;
        
    } else if (property.propertyType == kNSNumber) {
        
        self.propertyTypeLabel.text = @"NSNumber";
        self.propertyNameLabel.text = property.propertyValue;
        
    } else if (property.propertyType == kNull) {
        
        self.propertyTypeLabel.text = @"Null";
        self.propertyNameLabel.text = property.propertyValue;
        
    } else if (property.propertyType == kNSArray) {
        
        NodeModel *node             = property.propertyValue;
        self.propertyTypeLabel.text = [NSString stringWithFormat:@"NSArray -> [ %@ ]", node.modelName];
        self.modelNameLabel.text    = node.modelName;
        self.propertyNameLabel.text = node.listType;
        
    } else if (property.propertyType == kNSDictionary) {
        
        NodeModel *node             = property.propertyValue;
        self.propertyTypeLabel.text = @"NSDictionary";
        self.modelNameLabel.text    = node.modelName;
        self.propertyNameLabel.text = node.listType;
    }
}

- (void)propertyTypeLabelState:(PropertyType)type {
    
    if (type == kNSString || type == kNSNumber) {
        
        self.propertyTypeLabel.textColor      = [UIColor grayColor];
        self.modelNameLabel.hidden            = YES;
        self.indicatorView.hidden             = YES;
        self.pressButton.hidden               = YES;
        
    } else if (type == kNull) {
        
        self.propertyTypeLabel.textColor      = [UIColor blueColor];
        self.modelNameLabel.hidden            = YES;
        self.indicatorView.hidden             = YES;
        self.pressButton.hidden               = YES;
        
    } else if (type == kNSArray) {
        
        self.propertyTypeLabel.textColor      = [UIColor redColor];
        self.modelNameLabel.hidden            = NO;
        self.indicatorView.hidden             = NO;
        self.pressButton.hidden               = NO;
        
    } else if (type == kNSDictionary) {
        
        self.propertyTypeLabel.textColor      = [UIColor redColor];
        self.modelNameLabel.hidden            = NO;
        self.indicatorView.hidden             = NO;
        self.pressButton.hidden               = NO;
    }
}

#pragma mark -
- (void)buttonsEvent:(UIButton *)button {
    
    PropertyInfomation *property = self.data;
    
    if (property.propertyType == kNSArray || property.propertyType == kNSDictionary) {
        
        NodeModelViewController1 *nodeViewController = [[NodeModelViewController1 alloc] init];
        nodeViewController.nodeModel                = property.propertyValue;
        [self.viewController.navigationController pushViewController:nodeViewController
                                                            animated:YES];
    }
}

- (void)nodePressAnimationViewCompleteEventWithView:(NodePressAnimationView *)animationView {
    
    if (_delegate && [_delegate respondsToSelector:@selector(nodeModelCell:data:)]) {
        
        PropertyInfomation *property = self.data;
        
        [_delegate nodeModelCell:self data:property.propertyValue];
    }
}

@end
