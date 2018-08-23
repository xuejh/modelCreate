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

@property (nonatomic,strong)NodeTopBaseView *view;

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
    
    self.view = [NodeTopBaseView createSelf];
    [self addSubview:self.view];
}


- (void)setPropertyType:(PropertyType)propertyType{
    
    self.view.propertyType = propertyType;
    
}

- (void)setPropertyValue:(id)propertyValue{
    
    self.view.propertyValue = propertyValue;
}



@end
