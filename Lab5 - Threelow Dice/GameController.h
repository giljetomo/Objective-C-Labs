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

- (void)holdDie:(Dice *) dice withNumber:(NSNumber *) number;
- (void)printBoard;
@end

NS_ASSUME_NONNULL_END
