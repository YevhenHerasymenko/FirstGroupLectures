//
//  Car+CoreDataProperties.h
//  Lesson 30
//
//  Created by Yevhen Herasymenko on 19/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Car.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *speed;
@property (nullable, nonatomic, retain) NSString *type;


@end

NS_ASSUME_NONNULL_END
