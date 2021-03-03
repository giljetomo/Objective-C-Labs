//
//  main.m
//  Lab13
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import <Foundation/Foundation.h>
#import "NSString+stringByPigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello School Spray World Throw Sheep Quit Under Xcess Exempt Zebra Armor Btray Squat";
        NSLog(@"\n\nORIGINAL: %@\nPIG LATINIZED: %@\n_", string, [string stringByPigLatinization]);
    }
    return 0;
}
