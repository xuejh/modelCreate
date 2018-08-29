//
//  EEEChatCellView.m
//  AppFramework
//
//  Created by xuejinhui 
//  Copyright © 2018年 nd. All rights reserved.
//

#import "EEEChatCellView.h"

@interface EEEChatCellView ()
@property (nonatomic, strong) UILabel *titleView;
@end
@implementation EEEChatCellView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    self.titleView = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, self.frame.size.width - 44 - 50, 20)];
    [self addSubview:self.titleView];
}




- (void)setStudying_require_course_count:(NSNumber *)studying_require_course_count {
    _studying_require_course_count = studying_require_course_count;
}

- (void)setFinish_count:(NSNumber *)finish_count {
    _finish_count = finish_count;
    self.titleView.text = [NSString stringWithFormat:@"%@",finish_count];
}

- (void)setChecking_count:(NSNumber *)checking_count {
    _checking_count = checking_count;
}

- (void)setRequire_course_count:(NSNumber *)require_course_count {
    _require_course_count = require_course_count;
}

- (void)setStudying_count:(NSNumber *)studying_count {
    _studying_count = studying_count;
}

- (void)setEnrolling_count:(NSNumber *)enrolling_count {
    _enrolling_count = enrolling_count;
}




@end
