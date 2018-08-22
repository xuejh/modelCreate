//
//  NodeBaseCellView.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/22.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NodeBaseCellViewDelegate <NSObject>
@optional
- (void)propertyTypeButtonClick;
- (void)propertyButtonClick;
@end

@interface NodeBaseCellView : UITableViewCell

@property(nonatomic, strong) NSString *propertyType;
@property(nonatomic, strong) NSString *property;
@property(nonatomic, weak) id<NodeBaseCellViewDelegate> delegate;

@end
