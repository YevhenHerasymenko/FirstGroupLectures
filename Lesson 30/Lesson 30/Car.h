//
//  Car.h
//  Lesson 30
//
//  Created by Yevhen Herasymenko on 19/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSManagedObject

- (instancetype)initWithType:(NSString *)type speed:(NSNumber *)speed context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Car+CoreDataProperties.h"
