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
        [Pizza setPreferredSize:small];
        return YES;
    }
    if([self.lowercaseString isEqualToString: @"medium"]) {
        [Pizza setPreferredSize:medium];
        return YES;
    }
    if([self.lowercaseString isEqualToString: @"large"]) {
        [Pizza setPreferredSize:large];
        return YES;
    }
    return NO;
}
@end
