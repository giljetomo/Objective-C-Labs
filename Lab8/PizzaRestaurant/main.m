//
//  main.m
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import <Foundation/Foundation.h>
#import "NSString+stringToPizzaSizeEnum.h"
#import "Pizza.h"
#import "Kitchen.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray <NSString *> *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *size = commandWords[0];
            NSMutableArray <NSString *> *toppings = [NSMutableArray new];
            
            //filter the toppings and sanitize invalid strings
            [commandWords enumerateObjectsUsingBlock:^(NSString * _Nonnull topping, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([topping.lowercaseString isEqualToString: @"pineapple"] || [topping.lowercaseString isEqualToString: @"ham"] || [topping.lowercaseString isEqualToString: @"cheese"]) {
                    [toppings addObject:topping];
                }
            }];
            //make meatlovers pizza
            if (commandWords.count > 1) {
                NSString *toppingCombination = commandWords[1];
                if(size.isValidSize && [toppingCombination.lowercaseString isEqualToString:@"meatlovers"]) {
                    enum pizzaSize pizzaSize = size.getSize;
                    Pizza *pizza = [restaurantKitchen makeMeatLoversWithSize:pizzaSize];
                    NSLog(@"%@", pizza);
                    continue;
                }
            }
            //make pepperoni pizza
            if([size.lowercaseString isEqualToString: @"pepperoni"]) {
                Pizza *pizza = [restaurantKitchen makeLargePepperoni];
                NSLog(@"%@", pizza);
                continue;
            }
            //guard
            if(!size.isValidSize) {
                NSLog(@"Invalid size: %@", size);
                continue;
            }
            //guard
            if(toppings.count == 0) {
                NSLog(@"Invalid toppings");
                continue;
            }
            //make custom pizza
            enum pizzaSize pizzaSize = size.getSize;
            Pizza *pizza = [restaurantKitchen makePizzaWithSize:pizzaSize toppings:toppings];
            NSLog(@"%@", pizza);
        }
    }
    return 0;
}

