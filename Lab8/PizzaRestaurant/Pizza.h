//
//  Pizza.h
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
enum pizzaSize {small, medium, large};

@interface Pizza : NSObject
@property (nonatomic) enum pizzaSize size;
@property (nonatomic, strong) NSArray *toppings;

- (instancetype)initWithSize:(enum pizzaSize) size toppings:(NSArray *) toppings;
+ (instancetype)largePepperoni;
+ (instancetype)meatLoverWithSize:(enum pizzaSize) size;
- (NSMutableArray *)getToppings;
- (enum pizzaSize)getSize;

@end

NS_ASSUME_NONNULL_END
