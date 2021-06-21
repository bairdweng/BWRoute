//
//  RouterManage.h
//  BWRouter
//
//  Created by bairdweng on 2021/6/18.
//

#import "BWRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface RouterManage : NSObject

+ (instancetype)sharedInstance;
- (void)setUp;
- (void)openUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
