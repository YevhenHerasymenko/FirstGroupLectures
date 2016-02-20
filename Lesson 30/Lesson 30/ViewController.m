//
//  ViewController.m
//  Lesson 30
//
//  Created by Yevhen Herasymenko on 19/02/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Car"];
    request.predicate = [NSPredicate predicateWithFormat:@"speed > 149"];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    Car *car = [[Car alloc] initWithType:@"Mazda" speed:@150 context:delegate.managedObjectContext];
    [delegate saveContext];

    NSArray <Car *> * cars = [delegate.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"%@", cars);
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
