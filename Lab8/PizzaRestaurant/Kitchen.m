//
//  Kitchen.m
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import "Kitchen.h"
#import "Pizza.h"
@class DeliveryService;

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(enum pizzaSize)size toppings:(NSArray *)toppings deliveryService:(DeliveryService *)deliveryService
{
  if (self.delegate != nil) {
    if([self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]) {
      if([self.delegate kitchenShouldUpgradeOrder:self]) {
        size = large;
      }
      if([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        Pizza *pizza = [[Pizza new]initWithSize:size toppings:toppings];
        NSLog(@"%@", [self.delegate kitchenDidMakePizza:pizza]);
      }
    } else {
      return nil;
    }
  }
  return [[Pizza new] initWithSize:size toppings:toppings];
}

- (Pizza *)makeLargePepperoni
{
  return Pizza.largePepperoni;
}

- (Pizza *)makeMeatLoversWithSize:(enum pizzaSize)size
{
  return [Pizza meatLoverWithSize:size];
}

@end
