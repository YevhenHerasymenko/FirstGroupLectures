//
//  MAFMovie.h
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAFMovie : NSObject

@property (copy, nonatomic) NSString *originalTitle;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *overview;
@property (copy, nonatomic) NSString *posterPath;
@property (assign, nonatomic) NSInteger movieId;
@property (assign, nonatomic) NSInteger rate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
