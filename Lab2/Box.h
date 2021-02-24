//
//  Box.h
//  Lab2
//
//  Created by Gil Jetomo on 2021-02-23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject
@property (assign) float height;
@property (assign) float width;
@property (assign) float length;

//public methods
- (instancetype)initWithLength:(float) length width:(float) width height:(float) height;
- (float) calculateVolume;
- (int) howManyBoxesFitsWith:(Box *) box;

@end

NS_ASSUME_NONNULL_END
