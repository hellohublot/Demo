//
//  UIViewController+HTNavigationBarButtonItem.m
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

#import "UIViewController+HTNavigationBarButtonItem.h"

@implementation UIViewController (HTNavigationBarButtonItem)

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
	return [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"c74497afdc4af209dd77acc1ece997c3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
}

@end
