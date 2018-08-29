//
//  EEEItemModel.h
//
//  https://github.com/xuejh/modelCreate
//
//  Copyright (c) Xuejinhui All rights reserved.
//


#import <Foundation/Foundation.h>

@interface EEEItemModel : NSObject

@property (nonatomic, strong) NSNumber *studying_require_course_count;
@property (nonatomic, strong) NSNumber *finish_count;
@property (nonatomic, strong) NSNumber *checking_count;
@property (nonatomic, strong) NSNumber *require_course_count;
@property (nonatomic, strong) NSNumber *studying_count;
@property (nonatomic, strong) NSNumber *enrolling_count;

/**
 *  Init the model with dictionary
 *
 *  @param dictionary dictionary
 *
 *  @return model
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

