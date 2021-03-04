//
//  main.m
//  PizzaRestaurant
//  Created by Gil Jetomo on 2021-03-01.
//

#import <Foundation/Foundation.h>
#import "NSString+stringToPizzaSizeEnum.h"
#import "Pizza.h"
#import "Kitchen.h"
#import "SimpleManager.h"
#import "JollyManager.h"
#import "InputHandler.h"

static void makePizza(Kitchen *restaurantKitchen, NSString *size, NSMutableArray<NSString *> *toppings) {
  enum pizzaSize pizzaSize = size.getSize;
  Pizza *pizza = [restaurantKitchen makePizzaWithSize:pizzaSize toppings:toppings];
  
  if (pizza == nil) {
    NSLog(@"%@ no pizza right now.", restaurantKitchen.delegate);
    return;
  }
  if(restaurantKitchen.delegate == nil){
    NSLog(@"%@", pizza.description.capitalizedString);
  } else {
    NSLog(@"%@ %@", restaurantKitchen.delegate, pizza);
    restaurantKitchen.delegate = nil;
  }
}

int main(int argc, const char * argv[])
{
  
  @autoreleasepool {
    
    Kitchen *restaurantKitchen = [Kitchen new];
    SimpleManager *simpleManager = [SimpleManager new];
    JollyManager *jollyManager = [JollyManager new];
    
    while (TRUE) {
      // Loop forever
      
      NSString *selectedManager = [InputHandler prompt:@"\nEnter the manager of your choosing:\n"
                                   "1 - Simple Manager\n"
                                   "2 - Jolly Manager\n"
                                   "3 - none" andSize:255];
      switch ([selectedManager integerValue]) {
        case 1: {
          restaurantKitchen.delegate = simpleManager;
          break;
        }
        case 2: {
          restaurantKitchen.delegate = jollyManager;
          break;
        }
        default:
          NSLog(@"No manager was selected.");
          break;
      }
      NSLog(@"Please pick your pizza size and toppings:");
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
        if ([topping.lowercaseString isEqualToString: @"pineapple"] || [topping.lowercaseString isEqualToString: @"ham"] || [topping.lowercaseString isEqualToString: @"cheese"] || [topping.lowercaseString isEqualToString: @"anchovies"]) {
          [toppings addObject:topping];
        }
      }];
      //make pepperoni pizza
      if([size.lowercaseString isEqualToString: @"pepperoni"]) {
        Pizza *pizza = [restaurantKitchen makeLargePepperoni];
        NSLog(@"%@", pizza.description.capitalizedString);
        continue;
      }
      //guard
      if(!size.isValidSize) {
        NSLog(@"Invalid size: %@", size);
        continue;
      }
      //make meatlovers pizza
      if (commandWords.count == 2) {
        NSString *toppingCombination = commandWords[1];
        if(size.isValidSize && [toppingCombination.lowercaseString isEqualToString:@"meatlovers"]) {
          //pizza's size will be upgraded if Jolly Manager was selected
          makePizza(restaurantKitchen, size, [NSMutableArray arrayWithObjects:@"ham",@"cheese", nil]);
          continue;
//          Lab8 code:
//          Pizza *pizza = [restaurantKitchen makeMeatLoversWithSize:[Pizza preferredSize]];
//          NSLog(@"%@", pizza);
        }
      }
      //guard
      if(toppings.count == 0) {
        NSLog(@"Invalid toppings");
        continue;
      }
      //make custom pizza with/without delegate
      makePizza(restaurantKitchen, size, toppings);
    }
  }
  return 0;
}

