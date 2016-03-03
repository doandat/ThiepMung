//
//  HomeViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomNavigationBar.h"

@interface HomeViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *viewContain;

@property (weak, nonatomic) IBOutlet CustomNavigationBar *navigationBar;

@end
