//
//  HomeCellFirstViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeCellFirstViewController : BaseViewController

@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic) NSArray *arrDataSource;


@property (nonatomic) IBOutlet UIView *viewContainPage;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *lbDesciption;

@end
