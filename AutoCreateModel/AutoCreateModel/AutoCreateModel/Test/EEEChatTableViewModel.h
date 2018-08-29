//
//  EEEChatTableViewModel.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EEEChatCellViewModel;
@interface EEEChatTableViewModel : NSObject
@property (nonatomic, strong, readonly) NSArray<EEEChatCellViewModel *> *cellViewModelList;  //Model
- (void)fetchData;
@end
