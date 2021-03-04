//
//  JollyManager.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "JollyManager.h"
#import "DeliveryService.h"

@implementation JollyManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum pizzaSize)size andToppings:(NSArray *)toppings {
  return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
  NSLog(@"If you haven't done so, we have upgraded your pizza!");
  return YES;
}

- (NSString *)kitchenDidMakePizza:(Pizza *)pizza {
  //return message for Lab11:
  NSLog(@"Jolly Manager completed baking your pizza in the kitchen.");
  [self.deliveryService deliverPizza:pizza];
  return @"";
}

- (NSString *)description
{
  return @"Jolly Manager served";
}

@end
