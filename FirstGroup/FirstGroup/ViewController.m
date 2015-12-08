//
//  ViewController.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 05/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"asff", @"Vas", @"Pet", @"Vad", @"Vas", @"Pet", @"Vas"];
    NSDictionary *dict = [self dictionarryFromArray:array];
    
    NSLog(@"%@", dict);
    
    /*
    NSInteger i = 10;
    
    while( i < 10) {
        i++;
    }
    
    do
    {
        i++;
        
    }while( i<10 );
    */
    
    
}


- (NSDictionary *)dictionarryFromArray:(NSArray *)array {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSString *str in array) {
        if (dict[str]) {
            NSInteger integer = [dict[str] integerValue];
            integer++;
            dict[str] = @(integer);
        } else {
            dict[str] = @1;
        }
    }
    return dict;
}

@end
