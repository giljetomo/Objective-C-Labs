//
//  Contact.h
//  Lab4
//
//  Created by Macbook Pro on 2021-02-25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *email;

//public methods
- (instancetype)initWithName:(NSString *) name email:(NSString *) email;
-(BOOL)isSameAs:(Contact *) contact;
@end

NS_ASSUME_NONNULL_END
