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
        _didSelectCount = 1;
        _topScore = 30;
    }
    return self;
}
- (void)holdDie:(Dice *) dice withNumber:(NSNumber *) number {
    if([_heldDice objectForKey:number] == nil) {
        [_heldDice setObject:dice forKey: number];
        _didSelectCount++;
    } else {
        NSLog(@"Die #%@ was released.", number);
        [_heldDice removeObjectForKey:number];
        _didSelectCount--;
    }
}
-(void)calculateTopScore {
    int total = 0;
    for (NSNumber *key in _heldDice) {
        Dice *dice = [_heldDice objectForKey:key];
        total += dice.value == 3 ? 0 : dice.value;
    }
    _topScore = total < _topScore ? total : _topScore;
}
- (void)printBoardWithRoll:(BOOL) willRoll {
    NSArray *dieFaces = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    __block int score = 0;
    NSMutableString *diceBoard = [NSMutableString new];
    
    NSLog(@"________Current Dice________");
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
            score += selectedDie.value == 3 ? 0 : selectedDie.value;
        }
    }];
    
    NSLog(@"%@", diceBoard);
    NSLog(@" ");
    NSLog(@"----------------------------");
    NSLog(@"Score: %d - Leaderboard: %d", score, _topScore);
    NSLog(@"----------------------------");
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
    _rollsRemaining = 4;
    _didSelectCount = 1;
}
- (void)cheat {
    [_heldDice removeAllObjects];
    [_dice enumerateObjectsUsingBlock:^(Dice * _Nonnull die, NSUInteger idx, BOOL * _Nonnull stop) {
        die.value = 3;
        [self holdDie:die withNumber:[NSNumber numberWithUnsignedInteger:idx + 1]];
    }];
}

@end
