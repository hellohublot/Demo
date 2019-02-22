//
//  UIButton+HTButtonEdge.m
//  HTButton
//
//  Created by hublot on 2018/3/28.
//

#import "UIButton+HTButtonEdge.h"
#import <objc/runtime.h>

@implementation NSObject (HTRuntime)

- (void)ht_setValue:(id)value forSelector:(SEL)selector {
	objc_setAssociatedObject(self, selector, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)ht_valueForSelector:(SEL)selector {
	return objc_getAssociatedObject(self, selector);
}


+ (void)ht_swizzInstanceNativeSelector:(SEL)nativeSelector customSelector:(SEL)customSelector {
	Method nativeMethod = class_getInstanceMethod(self, nativeSelector);
	Method customMethod = class_getInstanceMethod(self, customSelector);
	if (!(nativeMethod || customMethod)) {
		return;
	}
	class_addMethod(self, nativeSelector, class_getMethodImplementation(self, nativeSelector), method_getTypeEncoding(nativeMethod));
	class_addMethod(self, customSelector, class_getMethodImplementation(self, customSelector), method_getTypeEncoding(customMethod));
	method_exchangeImplementations(class_getInstanceMethod(self, nativeSelector),
								   class_getInstanceMethod(self, customSelector));
}

+ (void)ht_swizzleClassNativeSelector:(SEL)nativeSelector customSelector:(SEL)customSelector {
	Method nativeMethod = class_getClassMethod(self, nativeSelector);
	Method customMethod = class_getClassMethod(self, customSelector);
	method_exchangeImplementations(nativeMethod, customMethod);
}

@end

@interface UIButton ()

@property (nonatomic, assign) CGSize imageToTitleOffsetSize;

@property (nonatomic, assign) CGSize titleIntrinsicContentSize;

@end


@implementation UIButton (HTButtonEdge)

+ (void)load {
	[self ht_swizzInstanceNativeSelector:@selector(intrinsicContentSize) customSelector:@selector(ht_intrinsicContentSize)];
	[self ht_swizzInstanceNativeSelector:@selector(titleRectForContentRect:) customSelector:@selector(ht_titleRectForContentRect:)];
	[self ht_swizzInstanceNativeSelector:@selector(imageRectForContentRect:) customSelector:@selector(ht_imageRectForContentRect:)];
}

- (CGSize)imageToTitleOffsetSize {
	return [[self ht_valueForSelector:@selector(imageToTitleOffsetSize)] CGSizeValue];
}

- (void)setImageToTitleOffsetSize:(CGSize)imageToTitleOffsetSize {
	[self ht_setValue:[NSValue valueWithCGSize:imageToTitleOffsetSize] forSelector:@selector(imageToTitleOffsetSize)];
}

- (CGSize)titleIntrinsicContentSize {
	return [[self ht_valueForSelector:@selector(titleIntrinsicContentSize)] CGSizeValue];
}

- (void)setTitleIntrinsicContentSize:(CGSize)titleIntrinsicContentSize {
	[self ht_setValue:[NSValue valueWithCGSize:titleIntrinsicContentSize] forSelector:@selector(titleIntrinsicContentSize)];
}

- (void)ht_makeEdgeWithDirection:(HTButtonEdgeDirection)direction imageToTitleaOffset:(CGFloat)imageToTitleOffset {
	CGSize imageToTitleOffsetSize = CGSizeZero;
	switch (direction) {
		case HTButtonEdgeDirectionHorizontal: {
			imageToTitleOffsetSize.width += imageToTitleOffset;
			break;
		}
		case HTButtonEdgeDirectionVertical: {
			imageToTitleOffsetSize.height += imageToTitleOffset;
			break;
		}
		default:
			break;
	}
	self.imageToTitleOffsetSize = imageToTitleOffsetSize;
	[self invalidateIntrinsicContentSize];
}

- (CGSize)ht_intrinsicContentSize {
	CGSize imageToTitleOffsetSize = self.imageToTitleOffsetSize;
	if (CGSizeEqualToSize(imageToTitleOffsetSize, CGSizeZero)) {
		return [self ht_intrinsicContentSize];
	}
	CGSize imageViewSize = self.imageView.intrinsicContentSize;
	CGSize titleLabelSize = self.titleLabel.intrinsicContentSize;
    
    if ([[UIFont systemFontOfSize:1].fontName containsString:@"bold"]) {
        titleLabelSize.width += 1.3;
    }
	
	if (imageToTitleOffsetSize.width != 0) {
		
		CGFloat imageToTitleOffset = imageToTitleOffsetSize.width;
		
		CGFloat contentWidth = self.contentEdgeInsets.left + imageViewSize.width + fabs(imageToTitleOffset) + titleLabelSize.width + self.contentEdgeInsets.right;
		CGFloat contentHeight = self.contentEdgeInsets.top + MAX(imageViewSize.height, titleLabelSize.height) + self.contentEdgeInsets.bottom;
		return CGSizeMake(contentWidth, contentHeight);
	} else {
		CGFloat imageToTitleOffset = imageToTitleOffsetSize.height;
		
		CGFloat contentWidth = self.contentEdgeInsets.left + MAX(imageViewSize.width, titleLabelSize.width) + self.contentEdgeInsets.right;
		CGFloat contentHeight = self.contentEdgeInsets.top + imageViewSize.height + fabs(imageToTitleOffset) + titleLabelSize.height + self.contentEdgeInsets.bottom;
		return CGSizeMake(contentWidth, contentHeight);
	}
}

- (CGRect)reloadContentRectFromImageToTitleOffsetSize:(CGSize)imageToTitleOffsetSize {
	CGRect reloadContentRect = self.bounds;
	reloadContentRect.origin.x += self.contentEdgeInsets.left;
	reloadContentRect.origin.y += self.contentEdgeInsets.top;
	reloadContentRect.size.width -= (self.contentEdgeInsets.left + self.contentEdgeInsets.right);
	reloadContentRect.size.height -= (self.contentEdgeInsets.top + self.contentEdgeInsets.bottom);
	reloadContentRect.size.width -= imageToTitleOffsetSize.width;
	return reloadContentRect;
}

- (CGRect)ht_titleRectForContentRect:(CGRect)contentRect {
	CGSize imageToTitleOffsetSize = self.imageToTitleOffsetSize;
	if (CGSizeEqualToSize(imageToTitleOffsetSize, CGSizeZero)) {
		return [self ht_titleRectForContentRect:contentRect];
	}
	contentRect = [self reloadContentRectFromImageToTitleOffsetSize:imageToTitleOffsetSize];
	CGRect superRect = [self ht_titleRectForContentRect:contentRect];
	CGRect imageRect = [self ht_imageRectForContentRect:contentRect];
	if (imageToTitleOffsetSize.width != 0) {
		if (imageToTitleOffsetSize.width < 0) {
			superRect.origin.x -= imageRect.size.width;
		}
		superRect.origin.x += imageToTitleOffsetSize.width;
	} else {
		superRect.size.width = MIN(self.titleIntrinsicContentSize.width, contentRect.size.width);
		superRect.origin.x = (contentRect.size.width - superRect.size.width) / 2;
		superRect.origin.y += imageRect.size.height / 2;
		superRect.origin.y += imageToTitleOffsetSize.height / 2;
	}
	return superRect;
}

- (CGRect)ht_imageRectForContentRect:(CGRect)contentRect {
	CGSize imageToTitleOffsetSize = self.imageToTitleOffsetSize;
	if (CGSizeEqualToSize(imageToTitleOffsetSize, CGSizeZero)) {
		return [self ht_imageRectForContentRect:contentRect];
	}
	contentRect = [self reloadContentRectFromImageToTitleOffsetSize:imageToTitleOffsetSize];
	CGRect superRect = [self ht_imageRectForContentRect:contentRect];
	CGRect titleRect = [self ht_titleRectForContentRect:contentRect];
	
	if (imageToTitleOffsetSize.width != 0) {
        if (imageToTitleOffsetSize.width < 0) {
			superRect.origin.x += titleRect.size.width;
        }
	} else {
		superRect.size.width = MIN(superRect.size.width, contentRect.size.width);
		self.titleIntrinsicContentSize = self.titleLabel.intrinsicContentSize;
		superRect.origin.x = (contentRect.size.width - superRect.size.width) / 2;
		superRect.origin.y -= titleRect.size.height / 2;
		superRect.origin.y -= imageToTitleOffsetSize.height / 2;
	}
	return superRect;
}

@end

