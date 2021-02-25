//
//  AdditionQuestion.h
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionQuestion : NSObject
@property (nonatomic, strong) NSString *question;
@property (assign, nonatomic) NSUInteger answer;

//public methods
- (instancetype)init;
@end

NS_ASSUME_NONNULL_END
