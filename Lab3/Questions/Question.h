//
//  AdditionQuestion.h
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject
@property (nonatomic, copy) NSString *question;
@property (nonatomic) NSUInteger leftValue;
@property (nonatomic) NSUInteger rightValue;
@property (nonatomic) NSUInteger answer;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

//public methods
- (NSTimeInterval)timeToAnswer;
- (void)generateQuestion;
@end

NS_ASSUME_NONNULL_END
