//
//  RouterManage.m
//  BWRouter
//
//  Created by bairdweng on 2021/6/18.
//

#import "RouterManage.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "BWNavigator.h"
@implementation RouterManage

+ (instancetype)sharedInstance {
	static RouterManage *instance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instance = [[self alloc] init];
	});
	return instance;
}

- (void)setUp {
	[self registerVcs];
}

- (void)registerVcs {
	[BWRouter registerURLPattern:@"vc1" toHandler:^(NSDictionary * _Nonnull routerParameters) {
	         BOOL animation = YES;
	         if ([routerParameters objectForKey:@"animation"]) {
			 animation = [[routerParameters objectForKey:@"animation"]boolValue];
		 }
	         ViewController1 *vc = [[ViewController1 alloc]init];
	         [[[BWNavigator sharedNavigator] bw_currentVc].navigationController pushViewController:vc animated:animation];
	 }];

	[BWRouter registerURLPattern:@"vc2" toHandler:^(NSDictionary * _Nonnull routerParameters) {
	         BOOL animation = YES;
	         if ([routerParameters objectForKey:@"animation"]) {
			 animation = [[routerParameters objectForKey:@"animation"]boolValue];
		 }
	         ViewController2 *vc = [[ViewController2 alloc]init];
	         [[[BWNavigator sharedNavigator] bw_currentVc].navigationController pushViewController:vc animated:animation];
	 }];
    
    [BWRouter registerURLPattern:@"vc3" toHandler:^(NSDictionary * _Nonnull routerParameters) {
             BOOL animation = YES;
             if ([routerParameters objectForKey:@"animation"]) {
             animation = [[routerParameters objectForKey:@"animation"]boolValue];
         }
        ViewController3 *vc = [[ViewController3 alloc]init];
        [[[BWNavigator sharedNavigator]bw_rootVc] presentViewController:vc animated:YES completion:nil];
     }];
}

- (void)openUrl:(NSString *)url {
	[BWRouter openURL:url];
}

@end
