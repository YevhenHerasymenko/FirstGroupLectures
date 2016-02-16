//
//  L21BasicNotificationViewController.m
//  Lesson 21
//
//  Created by Yevhen Herasymenko on 02/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "L21BasicNotificationViewController.h"

@interface L21BasicNotificationViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (assign, nonatomic) NSInteger counter;

@end

@implementation L21BasicNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.counter = 0;
    
    
    //Register for notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNewCounterValue:) name:@"changeCounter" object:nil];
    
//    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.countLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
//    [self.view addConstraint:topConstraint];
    
    //Register KVO
    [self.countLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:30];
    
    localNotification.fireDate = fireDate;
    localNotification.alertBody = @"Alert text";
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone localTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        NSLog(@"new text");
        //NSLog([object description]);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification {
    [UIView animateWithDuration:5 animations:^{
        self.bottomConstraint.constant = 100;
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification*)notification {
    [UIView animateWithDuration:5 animations:^{
        self.bottomConstraint.constant = 25;
        [self.view layoutIfNeeded];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)increase:(id)sender {
    self.counter++;
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"changeCounter" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeCounter" object:nil userInfo:@{@"counter" : @(self.counter)}];
    
    //[self.countLabel setValue:@"some text" forKey:@"text"];
    
    //NSString *text = [self.countLabel valueForKey:@"text"];
    
}

- (IBAction)decrease:(id)sender {
    self.counter--;
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"changeCounter" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeCounter" object:nil userInfo:@{@"counter" : @(self.counter)}];
}

- (void)showNewCounterValue:(NSNotification *)notification {
    
    NSNumber *counter = notification.userInfo[@"counter"];
    
    self.countLabel.text = counter.description;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeCounter" object:nil];
    [self.countLabel removeObserver:self forKeyPath:@"text"];
}

@end
