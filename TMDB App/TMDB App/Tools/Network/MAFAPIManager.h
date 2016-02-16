//
//  APIManager.h
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAFAPIManager : NSObject

@property (strong, nonatomic) NSURLSession *session;

+ (instancetype)sharedManager;

@end
