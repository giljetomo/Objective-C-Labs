//
//  ScoreKeeper.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (NSString *)retrieveScore
{
    return [NSString stringWithFormat:@"Score: %d right, %d wrong", _right, _wrong];
}

@end
