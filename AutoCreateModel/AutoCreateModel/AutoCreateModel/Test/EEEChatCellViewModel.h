//
//  EEEChatCellViewModel.h
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import <Foundation/Foundation.h>


@class EEEItemModel;
@interface EEEChatCellViewModel : NSObject

@property (nonatomic, strong) NSNumber *studying_require_course_count;
@property (nonatomic, strong) NSNumber *finish_count;
@property (nonatomic, strong) NSNumber *checking_count;
@property (nonatomic, strong) NSNumber *require_course_count;
@property (nonatomic, strong) NSNumber *studying_count;
@property (nonatomic, strong) NSNumber *enrolling_count;


- (instancetype)initWithModel:(EEEItemModel *)model;
- (NSUInteger)cellHeight;
@end
