//
//  HomeViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomNavigationBar.h"

@protocol HomeViewControllerDelegate
@required
- (void) presentVC:(UIViewController *)vc;

@end

@interface HomeViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,HomeViewControllerDelegate>

+(HomeViewController*)sharedInstance;


@property (weak, nonatomic) IBOutlet UIView *viewContain;

@property (weak, nonatomic) IBOutlet CustomNavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, weak) id<HomeViewControllerDelegate> delegate;



@end
