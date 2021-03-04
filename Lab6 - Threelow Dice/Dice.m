//
//  Dice.m
//  Lab5 - Threelow Dice
//
//  Created by Gil Jetomo on 2021-02-27.
//

#import "Dice.h"

@implementation Dice

- (void) roll
{
    _value = arc4random_uniform(6) + 1;
}
@end
