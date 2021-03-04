//
//  QuestionFactory.h
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import <Foundation/Foundation.h>
#import "Question.h"
NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject
@property (nonatomic) Question *question;
@property (nonatomic, strong) NSArray *questionSubclassNames;
- (Question *)generateRandomQuestion;
@end

NS_ASSUME_NONNULL_END
