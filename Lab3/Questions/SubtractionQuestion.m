//
//  SubtractionQuestion.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-26.
//

#import "SubtractionQuestion.h"

@implementation SubtractionQuestion
-(instancetype) init {
    if(self = [super init]) {
        [self generateQuestion];
    }
    return self;
}
- (void)generateQuestion {
    NSUInteger bigger = self.rightValue > self.leftValue ? self.rightValue : self.leftValue;
    NSUInteger smaller = bigger == self.rightValue ? self.leftValue : self.rightValue;
    self.answer = bigger - smaller;
    self.question = [NSString stringWithFormat:@"%lu - %lu ?", bigger, smaller];
}
@end
