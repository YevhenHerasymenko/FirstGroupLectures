//
//  FGPMovie.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 18/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "FGPMovie.h"
#import "FGPKnower.h"

@interface FGPMovie()

@property (strong, nonatomic) NSNumber *movieId;
@property (copy, nonatomic) NSString *name;

@property (strong, nonatomic) NSArray *knowns;

@end

@implementation FGPMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) {return nil;}
    _movieId = dictionary[@"id"];
    _name = dictionary[@"name"];
    
    NSArray *knownFor = dictionary[@"known_for"];
    NSMutableArray *knownsArr = [[NSMutableArray alloc] init];
    for (NSDictionary *knowForDict in knownFor) {
        FGPKnower *movie = [[FGPKnower alloc] initWithDictionary:knowForDict];
        [knownsArr addObject:movie];
    }
    _knowns = knownsArr;
    
    return self;
}

@end
