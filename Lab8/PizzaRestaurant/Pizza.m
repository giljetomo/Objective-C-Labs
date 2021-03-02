//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-01.
//

#import "Pizza.h"

@implementation Pizza
//name should be the same in .h file
static enum pizzaSize preferredSize;

- (instancetype)initWithSize:(enum pizzaSize) size toppings:(NSArray *) toppings
{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

+ (instancetype)largePepperoni {
    return [[self new]initWithSize:large toppings:[NSArray arrayWithObject:@"pepperoni"]];
}

+ (instancetype)meatLoverWithSize:(enum pizzaSize) size {
    return [[self new]initWithSize:size toppings:[NSArray arrayWithObjects:@"ham", @"cheese", nil]];
}
//getter method - name should be same as property name
+ (enum pizzaSize)preferredSize {
    return preferredSize;
}
//setter method - set+PropertyName
+ (void)setPreferredSize:(enum pizzaSize) size {
    preferredSize = size;
}

- (NSArray *)getToppings {
    return _toppings;
}

- (NSString *)description
{
    NSString *toppings = [_toppings componentsJoinedByString:@", "];
    NSString *size;
    
    switch(_size) {
        case small:
            size = @"small";
            break;
        case medium:
            size = @"medium";
            break;
        case large:
            size = @"large";
            break;
    }
    return [NSString stringWithFormat:@"Your pizza - size: %@, toppings: %@", size, toppings];
}
@end
