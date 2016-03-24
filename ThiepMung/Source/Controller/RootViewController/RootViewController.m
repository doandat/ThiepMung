//
//  RootViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "RootViewController.h"
#import "SWRevealViewController.h"
#import "HomeViewController.h"
#import "SidebarViewController.h"

@interface RootViewController ()<SWRevealViewControllerDelegate>

@end

@implementation RootViewController

@synthesize viewController = _viewController;
static RootViewController *sharedInstance;

+(RootViewController*)sharedInstance {
    if (sharedInstance) {
        return sharedInstance;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    sharedInstance = self;
    // Do any additional setup after loading the view from its nib.
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    SidebarViewController *sidebarViewController = [[SidebarViewController alloc] init];
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    UINavigationController *sidebarNavigationController = [[UINavigationController alloc] initWithRootViewController:sidebarViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:sidebarNavigationController frontViewController:homeNavigationController];
    revealController.delegate = self;
    
    self.viewController = revealController;
    
    
    self.navigation = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    
    [self.navigation setNavigationBarHidden:YES];
    
    
    CGRect frame = self.viewContain.bounds;
    if (MU_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        frame.origin.y = 20;
        frame.size.height -= 20;
    }

    self.navigation.view.frame = frame;
    self.navigation.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.viewContain addSubview:self.navigation.view];
    [self addChildViewController:self.navigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    if(position == FrontViewPositionLeft) {
        revealController.frontViewController.view.userInteractionEnabled = YES;
    } else {
        revealController.frontViewController.view.userInteractionEnabled = NO;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
