//
//  DateCalculator.h
//  Classes
//
//  Created by Derrick Park on 2021-02-23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// .h: header file (includes anything you want to share with other files)
@interface DateCalculator : NSObject
// public properties
@property (nonatomic, strong) NSString *name;

// public methods
- (instancetype)initWithName:(NSString *) name AndAge:(float) age;
- (BOOL) canDateAPersonWithAge:(float) age;

@end

NS_ASSUME_NONNULL_END
