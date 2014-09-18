//  Copyright (c) 2014年 Aruto Corp. All rights reserved.

#import "ARNHeaderStretchFlowLayout.h"

@implementation ARNHeaderStretchFlowLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (UICollectionViewScrollDirection)scrollDirection
{
    return UICollectionViewScrollDirectionVertical;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGPoint offset = [[self collectionView] contentOffset];
    CGFloat minY   = 0 - [[self collectionView] contentInset].top;

    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];

    if (offset.y < minY) {
        CGSize  headerSize = [self headerReferenceSize];
        CGFloat deltaY     = fabsf(offset.y - minY);

        for (UICollectionViewLayoutAttributes *attrs in attributes) {
            if ([attrs representedElementKind] == UICollectionElementKindSectionHeader &&
                attrs.indexPath.section == 0) {
                CGRect headerRect = [attrs frame];
                headerRect.size.height = MAX(minY, headerSize.height + deltaY);
                headerRect.origin.y    = headerRect.origin.y - deltaY;
                [attrs setFrame:headerRect];
                break;
            }
        }
    }
    return attributes;
}

@end
