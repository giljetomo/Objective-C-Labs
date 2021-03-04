//
//  Contact.m
//  Lab4
//
//  Created by Gil Jetomo on 2021-02-25.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName:(NSString *) name email:(NSString *) email
{
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
    }
    return self;
}

-(NSString *)description
{
return [NSString stringWithFormat:@" %@ - %@", _name, _email];
}
-(BOOL)isSameAs:(Contact *) contact
{
    return _name == contact.name && _email == contact.email;
}
@end
