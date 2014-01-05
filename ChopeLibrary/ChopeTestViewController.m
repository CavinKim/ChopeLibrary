//
//  ChopeTestViewController.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeTestViewController.h"
#import "ChopeTestImageCell.h"
#import "ChopeImageService.h"

@interface ChopeTestViewController ()

@property (nonatomic, retain) NSMutableArray *images;

@end

@implementation ChopeTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.imageService = [[ChopeImageService alloc] init];
    self.images = [[NSMutableArray alloc] init];
    
    for (NSInteger i=1; i<=1199; i++) {
        [self.images addObject:[NSString stringWithFormat:@"http://192.168.0.7/images/NationalGeographic/%d.jpg", i]];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChopeTestImageCell *cell = (ChopeTestImageCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell" forIndexPath:indexPath];
    
//    [[FICImageCache sharedImageCache] retrieveImageForEntity:entity withFormatName:IMAGE_FORMAT_NAME_THUMBNAIL completionBlock:^(id<FICEntity> entity, NSString *formatName, UIImage *image) {
//        // This completion block may be called much later. We should check to make sure this cell hasn't been reused for different photos before displaying the image that has loaded.
//        [cell.imageView setImage:image];
//    }];
//
    cell.imageView.image = nil;
    [self.imageService imageView:cell.imageView url:[self.images objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
