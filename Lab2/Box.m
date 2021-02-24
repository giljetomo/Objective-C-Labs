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
    return self;
}

- (float) calculateVolume
{
    return _length * _width * _height;
}

- (int) howManyBoxesFitsWith:(Box *) box
{
    float boxVolume1 = [self calculateVolume];
    float boxVolume2 = [box calculateVolume];
    
    Box *largeBox = boxVolume1 == MAX(boxVolume1, boxVolume2) ? self : box;
    Box *smallBox = boxVolume1 == MIN(boxVolume1, boxVolume2) ? self : box;
    
    float width = [largeBox width] / [smallBox width];
    float length = [largeBox length] / [smallBox length];
    float height = [largeBox height] / [smallBox height];
    
    return (int) width * length * height;
}

@end
