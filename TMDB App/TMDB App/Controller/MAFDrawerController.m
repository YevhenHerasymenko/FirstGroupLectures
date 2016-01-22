//
//  MAFDrawerController.m
//  TMDB App
//
//  Created by Yevhen Herasymenko on 22/01/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "MAFDrawerController.h"

@interface MAFDrawerController ()

@end

@implementation MAFDrawerController

- (void)loadView {
    [super loadView];
    UIViewController *leftController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    UIViewController *centerController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    
    self.leftDrawerViewController = leftController;
    self.centerViewController = centerController;
    
    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
