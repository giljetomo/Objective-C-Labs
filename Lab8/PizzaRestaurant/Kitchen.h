//
//  Kitchen.h
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
@class Kitchen;

@protocol KitchenDelegate <NSObject>

@required
- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum pizzaSize)size andToppings:(NSArray *)toppings;
- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional
- (NSString *)kitchenDidMakePizza:(Pizza *)pizza;

@end

@interface Kitchen : NSObject
@property (nonatomic, weak) id<KitchenDelegate> delegate;

- (Pizza *)makePizzaWithSize:(enum pizzaSize)size toppings:(NSArray *)toppings;
- (Pizza *)makeLargePepperoni;
- (Pizza *)makeMeatLoversWithSize:(enum pizzaSize)size;
@end
