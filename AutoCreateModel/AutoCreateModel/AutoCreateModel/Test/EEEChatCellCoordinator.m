//
//  EEEChatCellCoordinator.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatCellCoordinator.h"
#import "EEEChatCellView.h"
#import "EEEChatCellViewModel.h"
#import "UIView+Context.h"
#import "EEEChatContext.h"
#import <KVOController/FBKVOController.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface EEEChatCellCoordinator ()
@property(nonatomic, weak) EEEChatCellView *cell;
@property(nonatomic, weak) EEEChatCellViewModel *cellViewModel;
@property(nonatomic, strong) FBKVOController *kvoController;
@end
@implementation EEEChatCellCoordinator
- (instancetype)initWithCellView:(EEEChatCellView *)cell {
    if (self = [super init]) {
        self.cell = cell;
    }
    return self;
}

- (void)bindData:(EEEChatCellViewModel *)cellViewModel {
    [_kvoController unobserveAll];
    self.cellViewModel = cellViewModel;
    self.cell.studying_require_course_count = cellViewModel.studying_require_course_count;
    self.cell.finish_count = cellViewModel.finish_count;
    self.cell.checking_count = cellViewModel.checking_count;
    self.cell.require_course_count = cellViewModel.require_course_count;
    self.cell.studying_count = cellViewModel.studying_count;
    self.cell.enrolling_count = cellViewModel.enrolling_count;
    
}

- (void)didSelectCellView {
    
}



- (FBKVOController *)kvoController {
    if (!_kvoController) {
        _kvoController = [[FBKVOController alloc] initWithObserver:self retainObserved:YES];
    }
    
    return _kvoController;
}
@end
