//
//  EEEChatCellCoordinator.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EEEChatCellView;
@class EEEChatCellViewModel;
@interface EEEChatCellCoordinator : NSObject
- (instancetype)initWithCellView:(EEEChatCellView *)cell;
- (void)bindData:(EEEChatCellViewModel *)cellViewModel;
- (void)didSelectCellView;
@end
