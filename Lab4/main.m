//
//  main.m
//  Lab4
//
//  Created by Gil Jetomo on 2021-02-25.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "InputHandler.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL appOn = YES;
        int size = 255;
        //Contact objects
        Contact *c1 = [[Contact alloc]initWithName:@"A" email:@"A@yahoo.com"];
        Contact *c2 = [[Contact alloc]initWithName:@"B" email:@"B@yahoo.com"];
        Contact *c3 = [[Contact alloc]initWithName:@"C" email:@"C@yahoo.com"];
        //ContactList object
        ContactList *contacts = [ContactList new];
        [contacts.list addObject: c1];
        [contacts.list addObject: c2];
        
        //Main menu
        while (appOn) {
        NSString *selectedMenu = [InputHandler prompt:@"What would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nshow - Show contact detail\nquit - Exit application\n> " andSize:size];
            if ([selectedMenu isEqualToString: @"quit"]) {
                appOn = NO;
            } else if ([selectedMenu isEqualToString: @"new"]) {
                NSString *name = [InputHandler prompt:@"Enter name: " andSize:size];
                NSString *email = [InputHandler prompt:@"Enter email: " andSize:size];
                
                Contact *newContact = [[Contact alloc]initWithName:name email:email];
                BOOL isValidEntry = YES;
                for(Contact *contact in contacts.list) {
                    if ([contact isSameAs:newContact]) {
                        NSLog(@"Contact already exists");
                        isValidEntry = NO;
                        break;
                    }
                }
                isValidEntry ? [contacts addContact:newContact] : NULL;
            } else if([selectedMenu isEqualToString: @"list"]) {
                for (Contact *contact in contacts.list) {
                    NSUInteger index = [contacts.list indexOfObject:contact];
                    NSLog(@"%lu:%@", index, contact);
                }
            } else if ([selectedMenu isEqualToString: @"show"]) {
                NSString *index = [InputHandler prompt:@"Enter contact ID number: " andSize:size];
                NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString: index];
                if (number != nil) {
                    @try {
                        Contact *fetchedContact = [contacts.list objectAtIndex: [number unsignedIntegerValue]];
                        NSLog(@"%@",fetchedContact);
                    }
                    @catch (NSException *exception) {
                        NSLog(@"ID does not exist!");
                    }
                    
                } else {
                    NSLog(@"%@", @"Input Cannot Be Converted to an ID.");
                }
            }
        }

    }
    return 0;
}
