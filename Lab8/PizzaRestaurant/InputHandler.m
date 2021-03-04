//
//  InputHandler.m
//  Lab3
//
//  Created by Gil Jetomo on 2021-02-24.
//

#import "InputHandler.h"

@implementation InputHandler

+ (NSString *)prompt:(NSString *) input andSize:(int) size
{
    if (size < 1) {
        size = 255;
    }
    NSLog(@"%@ ", input);
    char inputChars[size]; // create a char array of size maxLength
    char *result = fgets(inputChars, size, stdin);
    if (result != NULL) {
        // 1. initialize NSString from c-string (char array)
        NSString *objCString = [NSString stringWithUTF8String:inputChars];
        // 2. trim the input (remove all whitespaces)
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [objCString stringByTrimmingCharactersInSet: whitespaces];
    }
    return NULL;
}
@end
