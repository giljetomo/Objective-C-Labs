//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

-(instancetype) init {
    if(self = [super init]) {
        [self generateQuestion];
    }
    return self;
}
- (void)generateQuestion {
    super.answer = super.rightValue + super.leftValue;
    super.question = [NSString stringWithFormat:@"%lu + %lu ?", super.rightValue, super.leftValue];
}
@end
