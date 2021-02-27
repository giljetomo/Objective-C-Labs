//
//  MultiplicationQuestion.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-26.
//

#import "MultiplicationQuestion.h"

@implementation MultiplicationQuestion
-(instancetype) init {
    if(self = [super init]) {
        [self generateQuestion];
    }
    return self;
}
- (void)generateQuestion {
    super.answer = super.rightValue * super.leftValue;
    super.question = [NSString stringWithFormat:@"%lu * %lu ?", super.rightValue, super.leftValue];
}
@end
