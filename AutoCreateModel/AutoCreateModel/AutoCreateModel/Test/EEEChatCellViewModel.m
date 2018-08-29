//
//  EEEChatCellViewModel.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatCellViewModel.h"
#import "EEEItemModel.h"

@interface EEEChatCellViewModel ()
@property (nonatomic, strong) EEEItemModel *model;
@end
@implementation EEEChatCellViewModel
- (instancetype)initWithModel:(EEEItemModel *)model {
    if (self=[super init]) {
        
        self.model = model;
        self.studying_require_course_count = model.studying_require_course_count;
        self.finish_count = model.finish_count;
        self.checking_count = model.checking_count;
        self.require_course_count = model.require_course_count;
        self.studying_count = model.studying_count;
        self.enrolling_count = model.enrolling_count;
        
    }
    return self;
}



- (NSUInteger)cellHeight {
    
    return 44;
    
}
@end
