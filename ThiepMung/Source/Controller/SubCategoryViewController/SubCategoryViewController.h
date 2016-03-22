//
//  SubCategoryViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/14/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface SubCategoryViewController : BaseViewController

@property (nonatomic) NSArray *arrDataSource;
@property (nonatomic) NSString *stringTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@end
