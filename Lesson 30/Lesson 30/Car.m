//
//  Car.m
//  Lesson 30
//
//  Created by Yevhen Herasymenko on 19/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithType:(NSString *)type speed:(NSNumber *)speed context:(NSManagedObjectContext *)context {
    NSEntityDescription *entityDescr = [NSEntityDescription entityForName:@"Car" inManagedObjectContext:context];
    self = [super initWithEntity:entityDescr insertIntoManagedObjectContext:context];
    if (self) {
        self.speed = speed;
        self.type = type;
    }
    return self;
}

@end
