//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "CPDViewController.h"

#import "ARNHeaderStretchFlowLayout.h"

@interface CPDViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation CPDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ARNHeaderStretchFlowLayout *flowLayout = ARNHeaderStretchFlowLayout.new;
    [flowLayout setSectionInset:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width, 50)];
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 160)];
    flowLayout.minimumLineSpacing      = 1;
    flowLayout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CPDViewControllerCell"
                                                                           forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                  withReuseIdentifier:@"CPDViewControllerHeaderView"
                                                                                         forIndexPath:indexPath];
        return headerView;
    }
    return nil;
}

@end
