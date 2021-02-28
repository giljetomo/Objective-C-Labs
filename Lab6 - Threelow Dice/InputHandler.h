//
//  InputHandler.h
//  Lab3
//
//  Created by Macbook Pro on 2021-02-24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputHandler : NSString
@property (assign, nonatomic) int size;
@property (nonatomic, strong) NSString *strInput;

//public methods
+ (NSString *)prompt:(NSString *) input andSize:(int) size;
@end

NS_ASSUME_NONNULL_END
