//
//  ViewController.m
//  PracticQuestions
//
//  Created by Yevhen Herasymenko on 12/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()


@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupString];
}

- (void)setupString {
    self.myString = @"";
}

- (void)addCharacters:(NSString *)str {
    self.myString = [self.myString stringByAppendingString:str];
    [self checkString];
}

- (void)checkString {
    NSLog(@"Super method");
}

#pragma mark - Actions

- (IBAction)addCharacterToString:(UIButton *)sender {
    [self addCharacters:sender.titleLabel.text];
}

@end
