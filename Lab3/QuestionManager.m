//
//  QuestionManager.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [NSMutableArray new];
    }
    return self;
}
- (NSString*)timeOutput
{
    NSDate *startTotal = _questions.firstObject.startTime;
    NSDate *endTotal = _questions.lastObject.endTime;
    NSTimeInterval intervalTotal = [endTotal timeIntervalSinceDate:startTotal];
    
    NSString *total = [@"Total time: " stringByAppendingString: [NSString stringWithFormat:@"%.0fs, ", intervalTotal]];
    NSString *average = [@"Average time: " stringByAppendingString: [NSString stringWithFormat:@"%.0fs", intervalTotal/_questions.count]];
    
    return [total stringByAppendingString: average];
}
@end
