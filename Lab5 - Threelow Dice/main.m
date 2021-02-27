//
//  main.m
//  Lab5 - Threelow Dice
//
//  Created by Macbook Pro on 2021-02-27.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *d1 = [[Dice alloc] init];
        Dice *d2 = [[Dice alloc] init];
        Dice *d3 = [[Dice alloc] init];
        
        NSLog(@"%d", d1.randomize);
        NSLog(@"%d", d2.randomize);
        NSLog(@"%d", d3.randomize);
    }
    return 0;
}
