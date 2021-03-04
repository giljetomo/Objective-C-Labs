//
//  DivisionQuestion.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion
-(instancetype) init {
    if(self = [super init]) {
        [self generateQuestion];
    }
    return self;
}
- (void)generateQuestion {
    NSUInteger bigger = super.rightValue > super.leftValue ? super.rightValue : super.leftValue;
    NSUInteger smaller = bigger == super.rightValue ? super.leftValue : super.rightValue;
    super.answer = bigger / smaller;
    super.question = [NSString stringWithFormat:@"%lu / %lu ?", bigger, smaller];
}
@end
