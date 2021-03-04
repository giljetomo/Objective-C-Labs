//
//  main.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-24.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "QuestionManager.h"
#import "AdditionQuestion.h"
#import "SubtractionQuestion.h"
#import "QuestionFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL gameOn = YES;
        int turns = 0;
        ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
        QuestionManager *qManager = [[QuestionManager alloc] init];
        QuestionFactory *qFactory = [[QuestionFactory alloc] init];
        
        while (gameOn) {
            Question *question = qFactory.generateRandomQuestion;
            [qManager.questions addObject:question];
            NSString *str = [InputHandler prompt:question.question andSize:255];
            
            NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString: str];
            if (number != nil) {
                turns++;
                BOOL rightAnswer = [number unsignedIntegerValue] == question.answer;
                rightAnswer ? scoreKeeper.right++ : scoreKeeper.wrong++;
                NSLog(@"%@", rightAnswer ? @"Right!" : @"Wrong!");
                NSLog(@"%@", [qManager timeOutput]);
                
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
