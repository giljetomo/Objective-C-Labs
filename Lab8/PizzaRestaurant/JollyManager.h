//
//  JollyManager.h
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-04.
//  Copyright © 2021 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kitchen.h"
@class DeliveryService;

NS_ASSUME_NONNULL_BEGIN

@interface JollyManager : NSObject <KitchenDelegate>
@property (nonatomic, weak) DeliveryService *deliveryService;

@end

NS_ASSUME_NONNULL_END
