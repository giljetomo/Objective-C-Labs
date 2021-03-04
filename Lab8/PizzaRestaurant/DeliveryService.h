//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Macbook Pro on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryService : NSObject
@property (nonatomic, strong) NSMutableArray <Pizza *> *pizzaList;

-(void)deliverPizza:(Pizza *)pizza;
- (NSArray <NSString *>*)deliveredPizzaList;

@end

NS_ASSUME_NONNULL_END
