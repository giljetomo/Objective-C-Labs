//
//  main.m
//  ASN1
//
//  Created by Derrick Park on 2017-08-17.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *getUserInput(int maxLength, NSString *prompt) {
    if (maxLength < 1) {
        maxLength = 255;
    }
    NSLog(@"%@ ", prompt);
    char inputChars[maxLength];
    char *result = fgets(inputChars, maxLength, stdin);
    if (result != NULL) {
        return [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return NULL;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (1) {
            NSString *strInput = getUserInput(255, @"\nEnter your String: ('q' to quit)");
            if ([strInput isEqualToString:@"q"]) { break; }
            while (1) {
                NSString *option = getUserInput(10, @"\nChoose one of the following options:\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Word Count\n8. Remove Punctuations\n9. Done\n");

                if ([option isEqualToString:@"1"]) {
                    NSLog(@"%@", [strInput uppercaseString]);
                } else if ([option isEqualToString:@"2"]) {
                    NSLog(@"%@", [strInput lowercaseString]);
                } else if ([option isEqualToString:@"3"]) {
                    NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString: strInput];
                    if (number != nil) {
                        NSLog(@"%ld", [number integerValue]);
                    } else {
                        NSLog(@"%@", @"Input Cannot Be Converted to Integer.");
                    }
                } else if ([option isEqualToString:@"4"]) {
                    NSLog(@"%@", [strInput stringByAppendingString:@", eh?"]);
                } else if ([option isEqualToString:@"5"]) {
                    if ([strInput characterAtIndex: [strInput length] - 1] == '?') {
                        NSLog(@"%@", @"I don't know");
                    } else if ([strInput characterAtIndex: [strInput length] - 1] == '!') {
                        NSLog(@"%@", @"Whoa, calm down!");
                    }
                } else if ([option isEqualToString:@"6"]) {
                    NSLog(@"%@", [strInput stringByReplacingOccurrencesOfString:@" " withString:@"-"]);

                } else if ([option isEqualToString:@"7"]) {
                    NSLog(@"%ld words.", [[strInput componentsSeparatedByString:@" "] count]);

                } else if ([option isEqualToString:@"8"]) {
                    NSCharacterSet *illegal = [NSCharacterSet punctuationCharacterSet];
                    NSLog(@"%@", [[strInput componentsSeparatedByCharactersInSet: illegal] componentsJoinedByString:@""]);

                } else if (option == nil || [option isEqualToString: @"9"]) {
                    NSLog(@"Next String!");
                    break;

                } else {
                    NSLog(@"Not available.");
                }

            }
        }
    }
    return 0;
}
