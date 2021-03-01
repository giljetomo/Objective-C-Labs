//
//  main.m
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *d1 = [[Dice alloc] init];
        Dice *d2 = [[Dice alloc] init];
        Dice *d3 = [[Dice alloc] init];
        Dice *d4 = [[Dice alloc] init];
        Dice *d5 = [[Dice alloc] init];
        NSMutableArray *dice = [NSMutableArray arrayWithObjects:d1, d2, d3, d4, d5, nil];
        
        GameController *gameController = [[GameController alloc] init];
        [gameController.dice addObjectsFromArray: dice];
        
        BOOL gameOn = YES;
        
        while(gameOn) {
            NSString *input = [InputHandler prompt:@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats\n'new game' to reset leaderboard" andSize:255];
            
            if([input.lowercaseString isEqualToString: @"roll"]) {
                if (gameController.rollsRemaining != 0 && gameController.heldDice.allValues.count != 5) {
                    if (gameController.didSelectCount <= 0) {
                        NSLog(@"Choose a die first before rolling again.");
                    } else {
                        [gameController setDidSelectCount: 0];
                        [gameController setRollsRemaining: [gameController rollsRemaining] - 1];
                        
                        if (gameController.rollsRemaining == 0) {
                            [gameController selectRemainingDice];
                            [gameController calculateTopScore];
                            [gameController printBoardWithRoll:NO];
                        } else {
                            [gameController printBoardWithRoll:YES];
                        }
                    }
                } else {
                    if (gameController.heldDice.allValues.count == 5 && gameController.rollsRemaining !=0) {
                        NSLog(@"De-select a die to roll again or 'reset.'");
                    } else {
                        NSLog(@"Select 'reset' from the menu for a new game.");
                    }
                }
            }
            else if ([input.lowercaseString isEqualToString: @"hold"] && gameController.rollsRemaining != 0) {
                NSString *input = [InputHandler prompt:@"\nEnter the number of the die:  " andSize:255];
                NSNumber *dieNumber = [[[NSNumberFormatter alloc] init] numberFromString: input];
                
                //if (1)input is a number (2)is between 1 and 6 (3)dice have been rolled
                if (dieNumber != nil && (dieNumber.integerValue > 0 && dieNumber.integerValue < 6) && d1.value != 0) {
                    
                    Dice *die = [dice objectAtIndex:dieNumber.unsignedIntegerValue - 1];
                    [gameController holdDie:die withNumber:dieNumber];
                    if (gameController.heldDice.allValues.count == 5) {
                        [gameController calculateTopScore];
                    }
                    [gameController printBoardWithRoll:NO];
                } else {
                    NSLog(@"%@", @"Invalid selection.");
                }
            }
            else if ([input.lowercaseString isEqualToString: @"reset"]) {
                [gameController resetDice];
                [gameController printBoardWithRoll:YES];
            }
            else if (([input.lowercaseString isEqualToString: @"display"])) {
                [gameController printBoardWithRoll:NO];
            }
            else if (([input.lowercaseString isEqualToString: @"new game"])) {
                [gameController setTopScore:30];
                [gameController resetDice];
                [gameController printBoardWithRoll:YES];
            }
        }
        NSLog(@" ");
        NSLog(@">>>>>>> GAME OVER <<<<<<<");
        NSLog(@" ");
    }
    return 0;
}
