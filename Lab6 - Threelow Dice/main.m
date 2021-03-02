//
//  main.m
//  Lab5 - Threelow Dice
//
//  Created by Gil Jetomo on 2021-02-27.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *d1 = [Dice new];
        Dice *d2 = [Dice new];
        Dice *d3 = [Dice new];
        Dice *d4 = [Dice new];
        Dice *d5 = [Dice new];
        NSMutableArray *dice = [NSMutableArray arrayWithObjects:d1, d2, d3, d4, d5, nil];
        
        GameController *gameController = [GameController new];
        [gameController.dice addObjectsFromArray: dice];
        
        BOOL gameOn = YES;
        
        while(gameOn) {
            NSString *input = [InputHandler prompt:@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats\n'new game' to reset leaderboard" andSize:255];
            
            if([input.lowercaseString isEqualToString: @"roll"]) {
                //guard
                if (gameController.heldDice.allValues.count == 5 && gameController.rollsRemaining != 0) {
                    NSLog(@"De-select a die to roll again or 'reset.'");
                    continue;
                }
                //guard
                if (gameController.heldDice.allValues.count == 5 && gameController.rollsRemaining == 0) {
                    NSLog(@"Select 'reset' from the menu for a new game.");
                    continue;
                }
                //guard
                if (gameController.didSelectCount <= 0) {
                    NSLog(@"Choose a die first before rolling again.");
                    continue;
                }
                [gameController setDidSelectCount: 0];
                [gameController setRollsRemaining: [gameController rollsRemaining] - 1];
                
                BOOL noRollsRemaining = gameController.rollsRemaining == 0 ? YES : NO;
                
                if (noRollsRemaining) {
                    [gameController selectRemainingDiceWithRoll: noRollsRemaining];
                }
                [gameController printBoardWithRoll: !noRollsRemaining];
            }
            else if ([input.lowercaseString isEqualToString: @"hold"] && gameController.rollsRemaining != 0) {
                //guard
                if (d1.value == 0) {
                    NSLog(@"You need to roll the dice first.");
                    continue;
                }
                NSString *input = [InputHandler prompt:@"\nEnter the number of the die:  " andSize:255];
                NSNumber *dieNumber = [[[NSNumberFormatter alloc] init] numberFromString: input];
                
                //guard - if (1)input is not a number (2)or is not between 1 and 5
                if (dieNumber == nil || !(dieNumber.integerValue > 0 && dieNumber.integerValue < 6)) {
                    NSLog(@"%@", @"Invalid number or selection.");
                    continue;
                }
                Dice *die = [dice objectAtIndex:dieNumber.unsignedIntegerValue - 1];
                [gameController holdDie:die withNumber:dieNumber];
                [gameController printBoardWithRoll:NO];
            }
            else if ([input.lowercaseString isEqualToString: @"reset"]) {
                [gameController resetDice];
                [gameController printBoardWithRoll:YES];
            }
            else if (([input.lowercaseString isEqualToString: @"display"])) {
                if (d1.value != 0) {
                    [gameController printBoardWithRoll:NO];
                    continue;
                }
                NSLog(@"You need to roll the dice first.");
            }
            else if (([input.lowercaseString isEqualToString: @"new game"])) {
                [gameController setTopScore:30];
                [gameController resetDice];
                [gameController printBoardWithRoll:YES];
            }
            else if (([input.lowercaseString isEqualToString: @"rofl"])) {
                [gameController cheat];
                [gameController printBoardWithRoll:NO];
            }
            else if (([input.lowercaseString isEqualToString: @"done"])) {
                if (gameController.heldDice.allValues.count < 5) {
                    [gameController selectRemainingDiceWithRoll:NO];
                }
                gameOn = NO;
            }
        }
        //control to not print the board when dice were not rolled
        if (d1.value != 0) {
            [gameController printBoardWithRoll:NO];
        }
        NSLog(@" ");
        NSLog(@">>>>>>>> GAME OVER <<<<<<<<<");
        NSLog(@" ");
    }
    return 0;
}
