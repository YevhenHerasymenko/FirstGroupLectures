//
//  APIManager+SearchMovieRequest.h
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFAPIManager.h"

@class MAFMovie;

typedef void (^SuccessBlock)(NSArray<MAFMovie *> *movies);

@interface MAFAPIManager (SearchMovieRequest)

- (void)searchMovie:(NSString *)movieName success:(SuccessBlock)success;

@end
