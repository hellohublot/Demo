//
//  HTCollectionFallLayout.h
//  HTCollectionFallLayout
//
//  Created by hublot on 2018/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HTCollectionFallDelegateLayout <NSObject>

@optional

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSectionAt:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAt:(NSIndexPath *)indexPath;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

- (nullable UICollectionViewLayoutAttributes *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout layoutAttributesForDecorationViewInSection:(NSInteger)section sectionContentMinY:(CGFloat)minY sectionContentMaxY:(CGFloat)maxY;

@end


@interface HTCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes

@property (nonatomic, strong) id model;

@end

@interface HTCollectionFallLayout: UICollectionViewLayout

@property (nonatomic, weak) id <HTCollectionFallDelegateLayout> delegate;

@end

NS_ASSUME_NONNULL_END
