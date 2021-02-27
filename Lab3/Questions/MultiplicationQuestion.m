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
    self.answer = self.rightValue * self.leftValue;
    self.question = [NSString stringWithFormat:@"%lu * %lu ?", self.rightValue, self.leftValue];
}
@end
