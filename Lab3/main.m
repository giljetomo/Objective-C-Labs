//
//  main.m
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
        int turns = 0;
        
        while (gameOn) {
            AdditionQuestion *question = [[AdditionQuestion alloc] init];
            NSString *str = [InputHandler prompt:question.question andSize:255];
            
            NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString: str];
            if (number != nil) {
                turns++;
                BOOL rightAnswer = [number unsignedIntegerValue] == question.answer;
                rightAnswer ? scoreKeeper.right++ : scoreKeeper.wrong++;
                NSLog(@"%@", rightAnswer ? @"Right!" : @"Wrong!");
                
                float percentage = ((float)scoreKeeper.right/turns) * 100 ;
                NSLog(@"%@ ---- %.2f%%", scoreKeeper.retrieveScore, percentage);
            } else {
                NSLog(@"%@", @"Input Cannot Be Converted to Integer.");
            }
            while (YES) {
                NSString *str = [InputHandler prompt:@"Continue? (yes/quit): " andSize:255];
                if ([str isEqualTo: @"quit"]) {
                    gameOn = NO;
                    break;
                } else if ([str isEqualTo: @"yes"]) {
                    break;
                }
            }
        }
        return 0;
    }
}
