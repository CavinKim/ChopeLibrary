//
//  ChopeTestViewController.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChopeImageService.h"

@interface ChopeTestViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) ChopeImageService *imageService;

@end
