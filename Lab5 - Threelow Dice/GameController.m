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

- (void)printBoard {
    NSArray *dieFaces = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    __block int score = 0;
    NSMutableString *diceBoard = [NSMutableString new];
    
    [_dice enumerateObjectsUsingBlock:^(Dice * _Nonnull die, NSUInteger idx, BOOL * _Nonnull stop) {
        if([_heldDice allKeysForObject:die].count == 0) {
            [die roll];
            [diceBoard appendString: [NSString stringWithFormat:@" %@ ", [dieFaces objectAtIndex:[_dice[idx] value] - 1]]];
        } else {
            Dice *selectedDie = [_heldDice objectForKey:[NSNumber numberWithUnsignedInteger:idx + 1]];
            [diceBoard appendString: [NSString stringWithFormat:@" [%@] ", [dieFaces objectAtIndex: selectedDie.value-1]]];
            score += selectedDie.value;
        }
    }];
    
    NSString *strScore = [NSString stringWithFormat:@" - Score: %d", score];
    NSLog(@"%@", [diceBoard stringByAppendingString:strScore]);
}

@end
