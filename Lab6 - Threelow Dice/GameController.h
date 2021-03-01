//
//  GameController.h
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject
@property (nonatomic, strong) NSMutableArray <Dice *> *dice;
@property (nonatomic, strong) NSMutableDictionary *heldDice;
@property (nonatomic, assign) int rollsRemaining;
@property (nonatomic, assign) int didSelectCount;
@property (nonatomic, assign) int topScore;

- (void)holdDie:(Dice *) dice withNumber:(NSNumber *) number;
- (void)printBoardWithRoll:(BOOL) willRoll;
- (void)selectRemainingDice;
- (void)resetDice;
- (void)calculateTopScore;
- (void)cheat;
@end

NS_ASSUME_NONNULL_END
