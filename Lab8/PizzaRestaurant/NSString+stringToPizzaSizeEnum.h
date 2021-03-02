//
//  NSString+stringToPizzaSizeEnum.h
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-01.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (stringToPizzaSizeEnum)
- (BOOL)isValidSize;
- (enum pizzaSize)getSize;

@end

NS_ASSUME_NONNULL_END
