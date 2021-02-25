//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init
{
    self = [super init];
    if (self) {
        //generate random numbers between 10 and 100
        NSUInteger num1 = arc4random_uniform(91) + 10;
        NSUInteger num2 = arc4random_uniform(91) + 10;
        _question = [NSString stringWithFormat:@"%lu + %lu ?", num1, num2];
        _answer = num1 + num2;
    }
    return self;
}

@end
