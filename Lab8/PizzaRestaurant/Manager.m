//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Macbook Pro on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "SimpleManager.h"

@implementation SimpleManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(enum pizzaSize)size andToppings:(NSArray *)toppings {
  BOOL found = NO;
  for (NSString* str in toppings) {
     if ([str caseInsensitiveCompare:@"anchovies"] == NSOrderedSame) {
         found = YES;
         break;
     }
  }
  return found;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
  return NO;
}

@end
