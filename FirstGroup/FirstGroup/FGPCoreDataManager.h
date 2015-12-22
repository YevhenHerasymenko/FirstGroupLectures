//
//  FGPCoreDataManager.h
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 22/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FGPCoreDataManager : NSObject

+ (instancetype)sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
