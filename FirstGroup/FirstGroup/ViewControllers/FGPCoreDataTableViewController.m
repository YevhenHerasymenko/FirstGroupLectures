//
//  FGPCoreDataTableViewController.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 22/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "FGPCoreDataTableViewController.h"
#import "Person.h"
#import "FGPCoreDataManager.h"

@interface FGPCoreDataTableViewController ()

@end

@implementation FGPCoreDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *descr = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[FGPCoreDataManager sharedInstance].managedObjectContext];
    [request setEntity:descr];
    [request setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:NO];
    
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSArray *array = [[FGPCoreDataManager sharedInstance].managedObjectContext executeFetchRequest:request error:nil];
    
    Person *person = array[0];
    
    //[[FGPCoreDataManager sharedInstance].managedObjectContext deleteObject:person];
   // [[FGPCoreDataManager sharedInstance] saveContext];
    
}
- (IBAction)addPerson:(id)sender {
    Person *person = [[Person alloc] initWithName:@"Vika" age:@22];
    [[FGPCoreDataManager sharedInstance] saveContext];
}

@end
