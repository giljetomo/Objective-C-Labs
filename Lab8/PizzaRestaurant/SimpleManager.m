//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "SimpleManager.h"
#import "DeliveryService.h"

@implementation SimpleManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum pizzaSize)size andToppings:(NSArray *)toppings {
  BOOL found = YES;
  for (NSString* str in toppings) {
     if ([str caseInsensitiveCompare:@"anchovies"] == NSOrderedSame) {
         found = NO;
         break;
     }
  }
  return found;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
  return NO;
}

- (NSString *)kitchenDidMakePizza:(Pizza *)pizza {
  //return message for Lab11:
  NSLog(@"Simple Manager completed baking your pizza in the kitchen.");
  [self.deliveryService deliverPizza:pizza];
  return @"";
}

- (NSString *)description
{
  return @"Simple Manager served";
}

@end
