//
//  QuestionFactory.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import "QuestionFactory.h"

@implementation QuestionFactory

- (instancetype)init {
    if (self = [super init]) {
        _questionSubclassNames = @[@"AdditionQuestion",
                                   @"SubtractionQuestion",
                                   @"MultiplicationQuestion",
                                   @"DivisionQuestion"];
    }
    return self;
}

-(Question *)generateRandomQuestion {
    NSUInteger random = arc4random_uniform((uint32_t) _questionSubclassNames.count);
    NSString *className = [_questionSubclassNames objectAtIndex:random];
    return [[NSClassFromString(className) alloc]init];
}
@end
