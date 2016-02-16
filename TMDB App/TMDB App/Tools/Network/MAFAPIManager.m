//
//  APIManager.m
//  TMDB App
//
//  Created by Yevhen Herasymenko on 16/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFAPIManager.h"

@interface MAFAPIManager()<NSURLSessionDelegate>

@end

@implementation MAFAPIManager

+ (instancetype)sharedManager {
    static MAFAPIManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init {
    if (self = [super init]) {
        NSOperationQueue *operationQueue = [NSOperationQueue new];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operationQueue];
        
    }
    return self;
}

@end
