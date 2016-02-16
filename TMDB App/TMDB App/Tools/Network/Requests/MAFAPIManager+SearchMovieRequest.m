//
//  APIManager+SearchMovieRequest.m
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFAPIManager+SearchMovieRequest.h"
#import "MAFConstants.h"
#import "MAFMovie.h"

@implementation MAFAPIManager (SearchMovieRequest)

- (void)searchMovie:(NSString *)movieName success:(SuccessBlock)success {
    NSString *urlString = [MAFBasicUrl stringByAppendingString:MAFSearchMovie];
    urlString = [NSString stringWithFormat:urlString, movieName, MAFTMDBApiKey];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    [[self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSMutableArray<MAFMovie *> *movies = [NSMutableArray new];
        NSArray *results = json[@"results"];
        for (NSDictionary *movieDict in results) {
            MAFMovie *movie = [[MAFMovie alloc] initWithDictionary:movieDict];
            [movies addObject:movie];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            success(movies);
        });
        
    }] resume];
}

@end
