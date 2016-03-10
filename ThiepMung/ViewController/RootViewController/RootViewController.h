//
//  RootViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@class SWRevealViewController;

@interface RootViewController : BaseViewController

@property (nonatomic, strong) UINavigationController *navigation;
@property (strong, nonatomic) SWRevealViewController *viewController;

+(RootViewController*)sharedInstance;


@property (weak, nonatomic) IBOutlet UIView *viewContain;

@end
