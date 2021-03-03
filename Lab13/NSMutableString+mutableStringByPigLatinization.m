//
//  NSMutableString+stringByPigLatinization.m
//  Lab13
//
//  Created by Macbook Pro on 2021-03-02.
//

#import "NSMutableString+mutableStringByPigLatinization.h"

@implementation NSMutableString (stringByPigLatinization)

- (NSString *) mutableStringByPigLatinization {
    
    for (NSString *word in [self componentsSeparatedByString:@" "]) {
        [self replaceCharactersInRange:[self rangeOfString:word] withString: (([[word substringToIndex:1].lowercaseString rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiou"]].location != NSNotFound) ? [word stringByAppendingString:@"ay"] : (([@[@"sch", @"scr", @"shr", @"spl", @"spr", @"squ", @"str", @"thr"] containsObject:[word substringToIndex:3].lowercaseString]) ? [[word substringFromIndex:3] stringByAppendingFormat:@"%@ay ", [word substringToIndex:3]] : (([@[@"bl", @"br", @"ch", @"cl", @"cr", @"dr", @"fl", @"fr", @"gh", @"gl", @"gr", @"ng", @"ph", @"pl", @"pr", @"qu", @"sc", @"sh", @"sk", @"sl", @"sm", @"sn", @"sp", @"st", @"sw", @"th", @"tr", @"tw", @"wh", @"wr"] containsObject:[word substringToIndex:2].lowercaseString]) ? [[word substringFromIndex:2] stringByAppendingFormat:@"%@ay", [word substringToIndex:2]] : (([[word substringWithRange:NSMakeRange(1, 1)] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiou"]].location == NSNotFound) ? @"" : [[word substringFromIndex:1] stringByAppendingFormat:@"%@ay", [word substringToIndex:1]])))).capitalizedString];
        
//        MARK: - Expanded Form
//        //check if first character is a vowel
//        NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
//        NSString *firstLetter = [word substringToIndex:1];
//        BOOL isVowel = [firstLetter.lowercaseString rangeOfCharacterFromSet:vowels].location != NSNotFound;
//
//        //check if a word begins in a two-letter cluster
//        NSArray *clusters = @[@"bl", @"br", @"ch", @"cl", @"cr", @"dr", @"fl", @"fr", @"gh", @"gl", @"gr", @"ng", @"ph", @"pl", @"pr", @"qu", @"sc", @"sh", @"sk", @"sl", @"sm", @"sn", @"sp", @"st", @"sw", @"th", @"tr", @"tw", @"wh", @"wr"];
//        NSString *cluster = [word substringToIndex:2];
//        BOOL isTwoCluster = [clusters containsObject:cluster.lowercaseString];
//
//        //check if a word begins in a three-letter cluster
//        NSArray *threeClusters = @[@"sch", @"scr", @"shr", @"spl", @"spr", @"squ", @"str", @"thr"];
//        NSString *threeCluster = [word substringToIndex:3];
//        BOOL isThreeCluster = [threeClusters containsObject:threeCluster.lowercaseString];
//
//        //sanitize invalid words
//        NSString *secondLetter = [word substringWithRange:NSMakeRange(1, 1)];
//        BOOL isSecondLetterConsonant = [secondLetter rangeOfCharacterFromSet:vowels].location == NSNotFound;
//
//        [pigLatinized appendString: (
//          isVowel ? [word stringByAppendingString:@"ay "] : (
//          isThreeCluster ? [[word substringFromIndex:3] stringByAppendingFormat:@"%@ay ", threeCluster] : (
//          isTwoCluster ? [[word substringFromIndex:2] stringByAppendingFormat:@"%@ay ", cluster] : (
//          isSecondLetterConsonant ? @"" : [[word substringFromIndex:1] stringByAppendingFormat:@"%@ay ", [word substringToIndex:1]])))).capitalizedString];
    }
    return [self stringByReplacingOccurrencesOfString:@"  " withString:@" "];
}

@end
