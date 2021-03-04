//
//  Kitchen.m
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import "Kitchen.h"
#import "Pizza.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(enum pizzaSize)size toppings:(NSArray *)toppings
{
  if (self.delegate != nil) {
    if([self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]) {
      if([self.delegate kitchenShouldUpgradeOrder:self]) {
        size = large;
      }
      if([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        NSLog(@"%@", [self.delegate kitchenDidMakePizza:nil]);
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
