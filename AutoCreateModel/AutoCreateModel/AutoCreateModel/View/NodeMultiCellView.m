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

@interface NodeMultiCellView()

@property (nonatomic,strong)NodeTopBaseView *view;

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
    
    self.view = [NodeTopBaseView createSelf];
    [self addSubview:self.view];
}


- (void)setPropertyType:(PropertyType)propertyType{
    
    self.view.propertyType = propertyType;
    
}

- (void)setPropertyValue:(id)propertyValue{
    
    
    
    NodeModel *node  = propertyValue;
    
    self.view.propertyValue = node.listType;
}

@end
