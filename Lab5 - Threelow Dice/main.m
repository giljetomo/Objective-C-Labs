//
//  main.m
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *d1 = [[Dice alloc] init];
        Dice *d2 = [[Dice alloc] init];
        Dice *d3 = [[Dice alloc] init];
        Dice *d4 = [[Dice alloc] init];
        Dice *d5 = [[Dice alloc] init];
        
        BOOL gameOn = YES;
        
        while(gameOn) {
            NSString *input = [InputHandler prompt:@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats" andSize:255];
            if([input.lowercaseString isEqualToString: @"roll"]) {
                NSLog(@"%d", d1.randomize);
                NSLog(@"%d", d2.randomize);
                NSLog(@"%d", d3.randomize);
                NSLog(@"%d", d4.randomize);
                NSLog(@"%d", d5.randomize);
            }
        }
        

    }
    return 0;
}
