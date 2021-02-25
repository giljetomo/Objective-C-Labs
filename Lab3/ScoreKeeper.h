//
//  ScoreKeeper.h
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreKeeper : NSObject
@property (assign, nonatomic) int right;
@property (assign, nonatomic) int wrong;

- (NSString *)retrieveScore;
@end

NS_ASSUME_NONNULL_END
