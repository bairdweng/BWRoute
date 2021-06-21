#### 关于路由的总结

##### 1. 路由相关

主要采用了蘑菇街方案 [MGJRouter](https://github.com/meili/MGJRouter)

##### 2. 路由处理

1. 注册路由
   ```objective-c
   [BWRouter registerURLPattern:@"vc1" toHandler:^(NSDictionary * _Nonnull routerParameters) {
   	         BOOL animation = YES;
   	         if ([routerParameters objectForKey:@"animation"]) {
   			 animation = [[routerParameters objectForKey:@"animation"]boolValue];
   		 }
   	         ViewController1 *vc = [[ViewController1 alloc]init];
   	         [[[BWNavigator sharedNavigator] bw_currentVc].navigationController pushViewController:vc animated:animation];
   	 }];
   ```

2. 打开页面

   ```objective-c
   [[RouterManage sharedInstance]openUrl:@"vc1"];
   ```

##### 2. window 相关

1. 常见获取delegate中的window

   > 这种方案获取，当项目storyboard作为入口时会报异常，最好加个判断。

   ```objective-c
   UIWindow *rootWindow = [[UIApplication sharedApplication].delegate window];
   ...
   UIWindow *rootWindow;
   id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
   if ([delegate respondsToSelector:@selector(window)]) {
     rootWindow = [delegate window];
   }
   ```

2. 采用keywindow

   > 通常屡试不爽的方法是keywindows，在iOS13中会警告"Should not be used for applications that support multiple"

   ```objective-c
   [UIApplication sharedApplication]keyWindow];
   ```

3. 正确的方法应该是

   ```objective-c
   - (UIViewController *)_rootViewController {
   	UIWindow *rootWindow;
   	id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
   	if ([delegate respondsToSelector:@selector(window)]) {
   		rootWindow = [delegate window];
   	}
   	rootWindow = [[UIApplication sharedApplication]windows].firstObject;
   	return rootWindow.rootViewController;
   }
   ```

   
