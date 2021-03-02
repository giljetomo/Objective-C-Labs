//
//  Kitchen.h
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@interface Kitchen : NSObject

- (Pizza *)makePizzaWithSize:(enum pizzaSize)size toppings:(NSArray *)toppings;
- (Pizza *)makeLargePepperoni;
- (Pizza *)makeMeatLoversWithSize:(enum pizzaSize)size;
@end
