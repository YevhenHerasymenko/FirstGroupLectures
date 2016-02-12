//
//  SecondViewController.m
//  PracticQuestions
//
//  Created by Yevhen Herasymenko on 12/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)checkString {
    if (self.myString.length > 3) {
        NSLog(@"Success");
    } else {
        NSLog(@"%@", self.myString);
    }
}

@end
