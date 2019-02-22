//
//  HTCollectionFallLayout.m
//  HTCollectionFallLayout
//
//  Created by hublot on 2018/12/18.
//

#import "HTCollectionFallLayout.h"

@implementation HTCollectionViewLayoutAttributes

@end

@interface HTCollectionFallLayout ()

@property (nonatomic, assign) CGSize contentSize;

@property (nonatomic, strong) NSMutableArray <UICollectionViewLayoutAttributes *> *attributedList;

@end

@implementation HTCollectionFallLayout

+ (Class)layoutAttributesClass {
	return [HTCollectionViewLayoutAttributes class];
}

- (CGSize)collectionViewContentSize {
	return self.contentSize;
}

- (NSMutableArray<UICollectionViewLayoutAttributes *> *)attributedList {
	if (!_attributedList) {
		_attributedList = [@[] mutableCopy];
	}
	return _attributedList;
}

- (void)invalidateLayout {
	self.contentSize = CGSizeZero;
	[self.attributedList removeAllObjects];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
	NSMutableArray <UICollectionViewLayoutAttributes *> *attributedArray = [@[] mutableCopy];
	for (UICollectionViewLayoutAttributes *attributed in self.attributedList) {
//		if (CGRectIntersectsRect(attributed.frame, rect) == true) {
			[attributedArray addObject:attributed];
//		}
	}
	return attributedArray;
}

- (void)prepareLayout {
	
	CGFloat contentHeight = 0;
	
	
	for (NSInteger section = 0; section < self.collectionView.numberOfSections; section ++) {
		BOOL supplementary = [self.collectionView.dataSource respondsToSelector:@selector(collectionView:viewForSupplementaryElementOfKind:atIndexPath:)];
		CGSize headerSize = CGSizeZero;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)]) {
			headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:section];
		}
		CGFloat sectionContentMinY = contentHeight;
		if (supplementary && headerSize.height > 0) {
			UICollectionViewLayoutAttributes *header = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
			header.frame = CGRectMake(0, contentHeight, headerSize.width, headerSize.height);
			header.zIndex = 1;
			[self.attributedList addObject:header];
			contentHeight += header.frame.size.height;
		}
		
		NSInteger columnCount = 1;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:columnCountForSectionAt:)]) {
			columnCount = [self.delegate collectionView:self.collectionView layout:self columnCountForSectionAt:section];
		}
		UIEdgeInsets inset = UIEdgeInsetsZero;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
			inset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
		}
		CGFloat lineSpacing = 0;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:lineSpacingForSectionAtIndex:)]) {
			lineSpacing = [self.delegate collectionView:self.collectionView layout:self lineSpacingForSectionAtIndex:section];
		}
		CGFloat interitemSpacing = 0;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:interitemSpacingForSectionAtIndex:)]) {
			interitemSpacing = [self.delegate collectionView:self.collectionView layout:self interitemSpacingForSectionAtIndex:section];
		}
		CGFloat itemWidth = (self.collectionView.bounds.size.width - inset.left - inset.right - (columnCount - 1) * interitemSpacing) / columnCount;
		
		NSInteger numberOfItem = [self.collectionView numberOfItemsInSection:section];
		if (numberOfItem > 0) {
			contentHeight += inset.top;
		}
		NSMutableArray <NSNumber *> *heightList = [@[] mutableCopy];
		for (int index = 0; index < columnCount; index ++) {
			[heightList addObject:@(contentHeight)];
		}
		
		for (NSInteger row = 0; row < numberOfItem; row ++) {
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
			UICollectionViewLayoutAttributes *cell = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
			CGFloat itemHeight = 0;
			if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:heightForItemAt:)]) {
				itemHeight = [self.delegate collectionView:self.collectionView layout:self heightForItemAt:indexPath];
			}
			__block NSInteger minColumn = 0;
			__block CGFloat minHeight = [heightList.firstObject floatValue];
			[heightList enumerateObjectsUsingBlock:^(NSNumber *height, NSUInteger column, BOOL * _Nonnull stop) {
				CGFloat heightValue = height.floatValue;
				if (heightValue < minHeight) {
					minColumn = column;
					minHeight = heightValue;
				}
			}];
			CGFloat x = inset.left + (itemWidth + interitemSpacing) * minColumn;
			CGFloat y = heightList[minColumn].floatValue + (indexPath.row >= columnCount ? lineSpacing : 0);
			cell.frame = CGRectMake(x, y, itemWidth, itemHeight);
			heightList[minColumn] = @(CGRectGetMaxY(cell.frame));
			[self.attributedList addObject:cell];
		}
		
		__block CGFloat maxHeight = 0;
		[heightList enumerateObjectsUsingBlock:^(NSNumber *height, NSUInteger column, BOOL * _Nonnull stop) {
			CGFloat heightValue = height.floatValue;
			if (heightValue > maxHeight) {
				maxHeight = heightValue;
			}
		}];
		contentHeight = MAX(maxHeight, contentHeight);
		
		if (numberOfItem > 0) {
			contentHeight += inset.bottom;
		}
		
		CGSize footerSize = CGSizeZero;
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)]) {
			footerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForFooterInSection:section];
		}
		if (supplementary && footerSize.height > 0) {
			UICollectionViewLayoutAttributes *footer = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
			footer.frame = CGRectMake(0, contentHeight, footerSize.width, footerSize.height);
			footer.zIndex = 1;
			[self.attributedList addObject:footer];
			contentHeight += footer.frame.size.height;
		}
		
		if (self.delegate && [self.delegate respondsToSelector:@selector(collectionView:layout:layoutAttributesForDecorationViewInSection:sectionContentMinY:sectionContentMaxY:)] ) {
			UICollectionViewLayoutAttributes *decoration = [self.delegate collectionView:self.collectionView layout:self layoutAttributesForDecorationViewInSection:section sectionContentMinY:sectionContentMinY sectionContentMaxY:contentHeight];
			if (decoration) {
				[self.attributedList addObject:decoration];
			}
		}
		
	}
	
	
	self.contentSize = CGSizeMake(self.collectionView.bounds.size.width, contentHeight);
	
}


@end
