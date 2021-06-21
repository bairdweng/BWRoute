//
//  ViewController.m
//  BWRouter
//
//  Created by bairdweng on 2021/6/18.
//

#import "ViewController.h"
#import "RouterManage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (IBAction)openVc1:(id)sender {
	[[RouterManage sharedInstance]openUrl:@"vc1"];
}

- (IBAction)openVc2:(id)sender {
	[[RouterManage sharedInstance]openUrl:@"vc2"];
}


@end
