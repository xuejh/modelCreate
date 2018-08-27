//
//  NodeMultiCellView.m
//  AutoCreateModel
//
//  Created by jinhui  xue on 2018/8/25.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "NodeMultiCellView.h"
#import "NodeTopBaseView.h"
#import "NodeModel.h"
#import "NodeBottomBaseView.h"

@interface NodeMultiCellView()

@property (nonatomic,strong)NodeTopBaseView *topView;
@property (nonatomic,strong)NodeBottomBaseView *bottomView;

@end

@implementation NodeMultiCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


- (void)initSubViews {
    
    self.topView = [NodeTopBaseView createSelf];
    [self addSubview:self.topView];
    
    self.bottomView = [NodeBottomBaseView createSelf];
    [self addSubview:self.bottomView];
}


- (void)setPropertyType:(PropertyType)propertyType{
    
    self.topView.propertyType = propertyType;
    
}

- (void)setPropertyValue:(id)propertyValue{
    
    NodeModel *node  = propertyValue;
    self.topView.propertyValue = node.listType;
    self.bottomView.modelName = node.modelName;
}

@end
