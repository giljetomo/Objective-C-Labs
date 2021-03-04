//
//  NSString+stringToPizzaSizeEnum.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-01.
//

#import "NSString+stringToPizzaSizeEnum.h"
#import "Pizza.h"

@implementation NSString (stringToPizzaSizeEnum)

- (BOOL)isValidSize {
    if([self.lowercaseString isEqualToString: @"small"]) {
        return YES;
    }
    if([self.lowercaseString isEqualToString: @"medium"]) {
        return YES;
    }
    if([self.lowercaseString isEqualToString: @"large"]) {
        return YES;
    }
    return NO;
}

- (enum pizzaSize)getSize {
    if([self.lowercaseString isEqualToString: @"medium"]) {
        return medium;
    }
    if([self.lowercaseString isEqualToString: @"large"]) {
        return large;
    }
    return small;
}

@end
