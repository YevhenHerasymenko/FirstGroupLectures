//
//  L21BasicViewController.h
//  Lesson 21
//
//  Created by Yevhen Herasymenko on 29/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface L21BasicViewController : UIViewController

@property (strong, nullable, nonatomic) NSString *string;

- (void)addLetters;
- (IBAction)myAction:(id)sender;

@end
