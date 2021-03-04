//
//  DeliveryCar.m
//  PizzaRestaurant
//
//  Created by Macbook Pro on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "DeliveryCar.h"

@implementation DeliveryCar

- (void)deliverPizza:(Pizza *)pizza {
  NSLog(@"DELIVERED - %@", pizza);
}

//singleton instance
+ (instancetype)sharedCar
{
  static DeliveryCar *sharedCar = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedCar = [[DeliveryCar alloc] init];
  });
  return sharedCar;
}

@end
