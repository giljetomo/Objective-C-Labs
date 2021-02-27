//
//  Dice.m
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import "Dice.h"

@implementation Dice

- (int) randomize
{
    _value = arc4random_uniform(6) + 1;
    return _value;
}
@end
