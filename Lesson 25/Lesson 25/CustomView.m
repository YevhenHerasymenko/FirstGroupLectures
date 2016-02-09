//
//  CustomView.m
//  Lesson 25
//
//  Created by Yevhen Herasymenko on 05/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation CustomView

- (IBAction)newText:(UIButton *)sender {
    self.label.text = @"new text";
}

@end
