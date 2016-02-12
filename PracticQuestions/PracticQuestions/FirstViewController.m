//
//  FirstViewController.m
//  PracticQuestions
//
//  Created by Yevhen Herasymenko on 12/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)checkString {
    [super checkString];
    if ([self.myString isEqualToString:@"AB"]) {
        NSLog(@"Success");
    } else {
        NSLog(@"%@", self.myString);
    }
}

@end
