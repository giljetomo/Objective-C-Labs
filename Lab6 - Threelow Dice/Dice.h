//
//  Dice.h
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject
@property (nonatomic, assign) int value;

- (void) roll;
@end

NS_ASSUME_NONNULL_END
