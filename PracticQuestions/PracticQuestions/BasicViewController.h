//
//  ViewController.h
//  PracticQuestions
//
//  Created by Yevhen Herasymenko on 12/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

@property (copy, nonatomic) NSString *myString;

- (IBAction)addCharacterToString:(id)sender;

- (void)checkString;

@end

