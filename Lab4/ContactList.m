//
//  ContactList.m
//  Lab4
//
//  Created by Macbook Pro on 2021-02-25.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [NSMutableArray new];
    }
    return self;
}
-(void)addContact:(Contact *) newContact
{
    [_list addObject: newContact];
}
@end
