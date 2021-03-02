//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Gil Jetomo on 2021-03-01.
//

#import "Pizza.h"

@implementation Pizza

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

- (enum pizzaSize)getSize {
    return _size;
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
