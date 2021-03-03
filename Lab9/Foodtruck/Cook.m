//
//  Cook.m
//  Foodtruck
//
//  Created by Gil Jetomo on 2021-03-02.
//

#import "Cook.h"

@implementation Cook

- (double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
    float foodTruckRate = 0;
    float foodPrice = 0;
    if([truck.name.lowercaseString isEqualToString:@"take a bao"]){
        foodTruckRate = 1.25;
    }
    if([truck.name.lowercaseString isEqualToString:@"tim shortons"]){
        foodTruckRate = 1.5;
    }
    if([food.lowercaseString isEqualToString:@"bao"]) {
        foodPrice = 2.0;
    }
    if([food.lowercaseString isEqualToString:@"shortbread"]) {
        foodPrice = 1.5;
    }
    return foodTruckRate * foodPrice;
}

@end
