//
//  main.m
//  Lab2
//
//  Created by Gil Jetomo on 2021-02-22.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      Box *box1 = [[Box alloc] initWithLength:10 width:10 height:10];
      Box *box2 = [[Box alloc] initWithLength:20 width:30 height:40];
      
      NSLog(@"Box 1's volume: %.2f", [box1 calculateVolume]);
      NSLog(@"%d box(es)", [box1 howManyBoxesFitsWith: box2]);
  }
  return 0;
}
