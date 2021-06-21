//
//  BWNavigator.m
//  BWRouter
//
//  Created by bairdweng on 2021/6/18.
//

#import "BWNavigator.h"
#import <UIKit/UIKit.h>

@interface BWNavigator ()

@end


@implementation BWNavigator

+ (instancetype)sharedNavigator {
	static BWNavigator *sharedNavigator = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedNavigator = [[self alloc] init];
	});
	return sharedNavigator;
}

#pragma mark Public
- (UIViewController *)bw_rootVc {
	return [self _rootViewController];
}

- (UIViewController *)bw_currentVc {
	return [self _findVisibleViewController];
}

#pragma mark private
- (UIViewController *)_findVisibleViewController {
	UIViewController* currentViewController = [self _rootViewController];
	BOOL runLoopFind = YES;
	while (runLoopFind) {
		if (currentViewController.presentedViewController) {
			currentViewController = currentViewController.presentedViewController;
		} else {
			if ([currentViewController isKindOfClass:[UINavigationController class]]) {
				currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
			} else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
				currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
			} else {
				break;
			}
		}
	}
	return currentViewController;
}

- (UIViewController *)_rootViewController {
	UIWindow *rootWindow;
	id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
	if ([delegate respondsToSelector:@selector(window)]) {
		rootWindow = [delegate window];
	}
	rootWindow = [[UIApplication sharedApplication]windows].firstObject;
	return rootWindow.rootViewController;
}
@end
