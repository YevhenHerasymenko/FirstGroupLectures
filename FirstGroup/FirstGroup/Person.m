//
//  Person.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 22/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "Person.h"
#import "FGPCoreDataManager.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age {
    
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[FGPCoreDataManager sharedInstance].managedObjectContext];
    
    Person *person = [[Person alloc] initWithEntity:description insertIntoManagedObjectContext:[FGPCoreDataManager sharedInstance].managedObjectContext];
    
    person.name = name;
    person.age = age;
    
    return person;
}

@end
