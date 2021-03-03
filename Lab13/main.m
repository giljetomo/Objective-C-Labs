//
//  main.m
//  Lab13
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import <Foundation/Foundation.h>
#import "NSString+stringByPigLatinization.h"
#import "NSMutableString+stringByPigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *string = [@"Hello School Spray World Throw Sheep Quit Under Xcess Exempt Zebra Armor Btray Squat" mutableCopy];
        NSLog(@"ORIGINAL: %@", string);
        NSLog(@"PIG LATINIZED: %@", [string stringByPigLatinization]);
    }
    return 0;
}
