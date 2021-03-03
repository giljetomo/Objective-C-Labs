//
//  NSString+stringByPigLatinization.m
//  Lab13
//
//  Created by Gil Jetomo on 2021-02-26.
//

#import "NSString+stringByPigLatinization.h"

@implementation NSString (stringByPigLatinization)

- (NSString *) stringByPigLatinization {
    NSMutableString *pigLatinized = [NSMutableString new];
    
    for (NSString *str in [self componentsSeparatedByString:@" "]) {
        [pigLatinized appendString: (([[str substringToIndex:1] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiou"]].location != NSNotFound) ? [str stringByAppendingString:@"ay "] : (([@[@"sch", @"scr", @"shr", @"spl", @"spr", @"squ", @"str", @"thr"] containsObject:[str substringToIndex:3].lowercaseString]) ? [[str substringFromIndex:3] stringByAppendingFormat:@"%@ay ", [str substringToIndex:3]] : (([@[@"bl", @"br", @"ch", @"cl", @"cr", @"dr", @"fl", @"fr", @"gh", @"gl", @"gr", @"ng", @"ph", @"pl", @"pr", @"qu", @"sc", @"sh", @"sk", @"sl", @"sm", @"sn", @"sp", @"st", @"sw", @"th", @"tr", @"tw", @"wh", @"wr"] containsObject:[str substringToIndex:2].lowercaseString]) ? [[str substringFromIndex:2] stringByAppendingFormat:@"%@ay ", [str substringToIndex:2]] : (([[str substringWithRange:NSMakeRange(1, 1)] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiou"]].location == NSNotFound) ? @"" : [[str substringFromIndex:1] stringByAppendingFormat:@"%@ay ", [str substringToIndex:1]])))).capitalizedString];
        
//        MARK: - Expanded Form
//        //check if first character is a vowel
//        NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
//        NSString *firstLetter = [string substringToIndex:1];
//        BOOL isVowel = [firstLetter rangeOfCharacterFromSet:vowels].location != NSNotFound;
//
//        //check if a word begins in a two-letter cluster
//        NSArray *clusters = @[@"bl", @"br", @"ch", @"cl", @"cr", @"dr", @"fl", @"fr", @"gh", @"gl", @"gr", @"ng", @"ph", @"pl", @"pr", @"qu", @"sc", @"sh", @"sk", @"sl", @"sm", @"sn", @"sp", @"st", @"sw", @"th", @"tr", @"tw", @"wh", @"wr"];
//        NSString *cluster = [string substringToIndex:2];
//        BOOL isTwoCluster = [clusters containsObject:cluster.lowercaseString];
//
//        //check if a word begins in a three-letter cluster
//        NSArray *threeClusters = @[@"sch", @"scr", @"shr", @"spl", @"spr", @"squ", @"str", @"thr"];
//        NSString *threeCluster = [string substringToIndex:3];
//        BOOL isThreeCluster = [threeClusters containsObject:threeCluster.lowercaseString];
//
//        //sanitize invalid words
//        NSString *secondLetter = [string substringWithRange:NSMakeRange(1, 1)];
//        BOOL isSecondLetterConsonant = [secondLetter rangeOfCharacterFromSet:vowels].location == NSNotFound;
//
//        [pigLatinized appendString: (
//          isVowel ? [string stringByAppendingString:@"ay "] : (
//          isThreeCluster ? [[string substringFromIndex:3] stringByAppendingFormat:@"%@ay ", threeCluster] : (
//          isTwoCluster ? [[string substringFromIndex:2] stringByAppendingFormat:@"%@ay ", cluster] : (
//          isSecondLetterConsonant ? @"" : [[string substringFromIndex:1] stringByAppendingFormat:@"%@ay ", [string substringToIndex:1]])))).capitalizedString];
    }
    return pigLatinized;
}

@end
