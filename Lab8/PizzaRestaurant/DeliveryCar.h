//
//  DeliveryCar.h
//  PizzaRestaurant
//
//  Created by Macbook Pro on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pizza;

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryCar : NSObject
-(void)deliverPizza:(Pizza *)pizza;
+ (instancetype)sharedCar;

@end

NS_ASSUME_NONNULL_END
