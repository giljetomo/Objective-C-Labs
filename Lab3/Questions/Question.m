//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import "Question.h"

@implementation Question

- (instancetype)init
{
    self = [super init];
    if (self) {
        //generate random numbers between 10 and 100
        _rightValue = arc4random_uniform(91) + 10;
        _leftValue = arc4random_uniform(91) + 10;
        _startTime = [NSDate date];
    }
    return self;
}
- (NSTimeInterval)timeToAnswer
{
    return [_endTime timeIntervalSinceDate:_startTime];
}
// overriding getter
- (NSUInteger)answer {
    _endTime = [NSDate date];
    return _answer;
}
- (void)generateQuestion {}

@end
