//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "SimpleManager.h"

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

- (NSString *)description
{
  return @"Simple Manager serves";
}

@end
