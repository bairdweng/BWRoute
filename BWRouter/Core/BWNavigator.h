//
//  BWNavigator.h
//  BWRouter
//
//  Created by bairdweng on 2021/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWNavigator : NSObject

+ (instancetype)sharedNavigator;
- (UIViewController *)bw_rootVc;
- (UIViewController *)bw_currentVc;

@end

NS_ASSUME_NONNULL_END
