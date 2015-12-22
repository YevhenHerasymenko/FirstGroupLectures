//
//  Person.h
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 22/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSManagedObject

- (instancetype)initWithName:(NSString *)name age:(NSNumber *)age;

@end

NS_ASSUME_NONNULL_END

#import "Person+CoreDataProperties.h"
