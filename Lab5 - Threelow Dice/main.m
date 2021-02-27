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
        [gameController.dice addObjectsFromArray:dice];
        
        BOOL gameOn = YES;
        
        while(gameOn) {
        
            NSString *input = [InputHandler prompt:@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats" andSize:255];
            if([input.lowercaseString isEqualToString: @"roll"]) {
    
                [gameController printBoard];
                
            } else if ([input.lowercaseString isEqualToString: @"hold"]) {
                NSString *input = [InputHandler prompt:@"\nEnter the number of the die:  " andSize:255];
                NSNumber *dieNumber = [[[NSNumberFormatter alloc] init] numberFromString: input];
                
                //if (1)input is a number (2)is between 1 and 6 (3)dice have been rolled
                if (dieNumber != nil && (dieNumber.integerValue > 0 && dieNumber.integerValue < 6) && d1.value != 0) {
                    
                    Dice *die = [dice objectAtIndex:dieNumber.unsignedIntegerValue-1];
                    [gameController holdDie:die withNumber:dieNumber];
                    
                    for (NSNumber *key in [gameController.heldDice allKeys]) {
                        NSLog(@"%d", [(Dice *)[gameController.heldDice objectForKey:key] value]);
                    }
                } else {
                    NSLog(@"%@", @"Invalid selection.");
                }
            } else if ([input.lowercaseString isEqualToString: @"reset"]) {
                [gameController resetDice];
                [gameController printBoard];
            }
        }
    }
    return 0;
}
