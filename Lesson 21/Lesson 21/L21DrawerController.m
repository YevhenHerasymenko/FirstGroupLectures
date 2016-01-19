//
//  L21DrawerController.m
//  Lesson 21
//
//  Created by Yevhen Herasymenko on 19/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "L21DrawerController.h"

@interface L21DrawerController ()

@end

@implementation L21DrawerController

- (void)loadView {
    [super loadView];
    
    UIViewController *centerController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    UIViewController *leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    self.centerViewController = centerController;
    self.leftDrawerViewController = leftViewController;
    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
