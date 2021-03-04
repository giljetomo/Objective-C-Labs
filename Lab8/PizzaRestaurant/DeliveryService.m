//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Macbook Pro on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"
#import "DeliveryCar.h"

@implementation DeliveryService

- (instancetype)init
{
  self = [super init];
  if (self) {
    _pizzaList = [NSMutableArray <Pizza *> new];
  }
  return self;
}
- (void)deliverPizza:(Pizza *)pizza {
  [_pizzaList addObject:pizza];
  
  [[DeliveryCar sharedCar] deliverPizza:pizza];
}

- (NSArray <NSString *>*)deliveredPizzaList {
  NSMutableArray *list = [NSMutableArray new];
  
  for (Pizza *pizza in _pizzaList) {
    NSString *string = [pizza.description stringByReplacingOccurrencesOfString:@"your pizza - " withString:@""].capitalizedString;
    [list addObject: string];
  }
  return list;
}
@end
