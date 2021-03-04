//
//  ContactList.h
//  Lab4
//
//  Created by Gil Jetomo on 2021-02-25.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject
@property (nonatomic, strong) NSMutableArray *list;

//public methods
-(void)addContact:(Contact *) newContact;
@end

NS_ASSUME_NONNULL_END
