//
//  ChopeAppDelegate.h
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 11. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChopeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
