//
//  QuestionManager.h
//  Lab3
//
//  Created by Macbook Pro on 2021-02-26.
//

#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionManager : NSObject
@property (nonatomic, strong) NSMutableArray <Question *> *questions;

//public methods
- (NSString*)timeOutput;
@end

NS_ASSUME_NONNULL_END
