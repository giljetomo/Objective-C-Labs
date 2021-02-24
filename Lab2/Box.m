//
//  Box.m
//  Lab2
//
//  Created by Gil Jetomo on 2021-02-23.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithLength:(float) length width:(float) width height:(float) height
{
    self = [super init];
    if (self) {
        _length = length;
        _width = width;
        _height = height;
    }
    _volume = _length * _width * _height;
    return self;
}

- (float) divide:(float) num1 by:(float) num2
{
    return num1 / num2;
}

- (int) howManyBoxesFitsWith:(Box *) box
{
    Box *largeBox = [self volume] > [box volume] ? self : box;
    Box *smallBox = [self isEqualTo: largeBox] ? box : self;
    
    return (int) [self divide:[largeBox width] by:[smallBox width]] *
                 [self divide:[largeBox length] by:[smallBox length]] *
                 [self divide:[largeBox height] by:[smallBox height]];
}

@end
