//
//  GameController.m
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init {
    self = [super init];
    if (self) {
        _dice = [NSMutableArray new];
        _heldDice = [NSMutableDictionary new];
        _rollsRemaining = 5;
    }
    return self;
}
- (void)holdDie:(Dice *) dice withNumber:(NSNumber *) number {
    if([_heldDice objectForKey:number] == nil) {
        [_heldDice setObject:dice forKey: number];
    } else {
        NSLog(@"Die #%@ was released.", number);
        [_heldDice removeObjectForKey:number];
    }
}

- (void)printBoardWithRoll:(BOOL) willRoll {
    NSArray *dieFaces = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    __block int score = 0;
    NSMutableString *diceBoard = [NSMutableString new];
    
    NSLog(@"_______Current Dice______");
    NSLog(@" ");
    
    [_dice enumerateObjectsUsingBlock:^(Dice * _Nonnull die, NSUInteger idx, BOOL * _Nonnull stop) {
        if([_heldDice allKeysForObject:die].count == 0) {
            if (willRoll) {
                [die roll];
            }
            [diceBoard appendString: [NSString stringWithFormat:@" %@ ", [dieFaces objectAtIndex:[_dice[idx] value] - 1]]];
        } else {
            Dice *selectedDie = [_heldDice objectForKey:[NSNumber numberWithUnsignedInteger:idx + 1]];
            [diceBoard appendString: [NSString stringWithFormat:@" [%@] ", [dieFaces objectAtIndex: selectedDie.value-1]]];
            score += selectedDie.value;
        }
    }];
    
    NSLog(@"%@", diceBoard);
    NSLog(@" ");
    NSLog(@"-------------------------");
    NSLog(@"      Total Score: %d", score);
    NSLog(@"-------------------------");
    NSLog(@"    Rolls Remaining: %d", _rollsRemaining);
}
- (void)selectRemainingDice {
    [_dice enumerateObjectsUsingBlock:^(Dice * _Nonnull die, NSUInteger idx, BOOL * _Nonnull stop) {
        if([_heldDice allKeysForObject:die].count == 0) {
            [self holdDie:die withNumber:[NSNumber numberWithUnsignedInteger:idx + 1]];
        }
    }];
}

- (void)resetDice {
    [_heldDice removeAllObjects];
}

@end
