//
//  main.m
//  Classes
//
//  Created by Derrick Park on 2021-02-23.
//

// C-family
// : preprocessing -> compile -> object file (compiled file) -> link -> executable -> run!

#import <Foundation/Foundation.h>
#import "DateCalculator.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    DateCalculator *dc = [[DateCalculator alloc] initWithName:@"Adriano" AndAge:30];
    // getter
    // [dc name];
    // dc.name;
    
    if ([dc canDateAPersonWithAge:23]) {
      NSLog(@"Yes, you can!");
    } else {
      NSLog(@"No, you can't!");
    }
    NSLog(@"%@", dc);
    // setter
    [dc setName:@"Gil"];
    NSLog(@"%@", [dc description]);
  }
  return 0;
}
