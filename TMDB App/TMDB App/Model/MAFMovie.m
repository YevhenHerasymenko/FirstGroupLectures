//
//  MAFMovie.m
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFMovie.h"

@implementation MAFMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _originalTitle = dictionary[@"original_title"];
        _overview = dictionary[@"overview"];
        _posterPath = dictionary[@"poster_path"];
        _title = dictionary[@"title"];
        _movieId = [dictionary[@"id"] integerValue];
        _rate = [dictionary[@"vote_average"] integerValue];
        
    }
    return self;
}


@end
