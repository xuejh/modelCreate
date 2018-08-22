//
//  NodeModelCell.h
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/21.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NodeModelCell;

@protocol NodeModelCellDelegate <NSObject>

- (void)nodeModelCell:(NodeModelCell *)cell data:(id)data;

@end

static NSString *nodeCellReusedString = @"NodeModelCell";

@interface NodeModelCell : UITableViewCell

@property (nonatomic, weak) id <NodeModelCellDelegate> delegate;
@property (nonatomic, weak) NSIndexPath               *indexPath;
@property (nonatomic, weak) UIViewController          *viewController;
@property (nonatomic, weak) id                         data;

/**
 *  加载数据
 */
- (void)loadData;

@end
