//
//  AHSViewController.m
//  ARNHeaderStretchFlowLayout
//
//  Created by Airin on 09/18/2014.
//  Copyright (c) 2014 Airin. All rights reserved.
//

#import "AHSViewController.h"

#import <ARNHeaderStretchFlowLayout.h>

@interface AHSViewController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation AHSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ARNHeaderStretchFlowLayout *flowLayout = ARNHeaderStretchFlowLayout.new;
    [flowLayout setSectionInset:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width, 50)];
    [flowLayout setHeaderReferenceSize:CGSizeMake(self.view.frame.size.width, 200)];
    flowLayout.minimumLineSpacing      = 1;
    flowLayout.minimumInteritemSpacing = 0;
    [self.collectionView setCollectionViewLayout:flowLayout];
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
