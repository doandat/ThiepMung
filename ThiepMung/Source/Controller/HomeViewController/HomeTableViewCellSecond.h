//
//  HomeTableViewCellSecond.h
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCategory.h"
#import "HomeViewController.h"

@interface HomeTableViewCellSecond : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, weak) id<HomeViewControllerDelegate> delegate;
@property (nonatomic, weak) NSArray *arrDataSource;

@property (strong, nonatomic) DCategory *dCategory;

@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
