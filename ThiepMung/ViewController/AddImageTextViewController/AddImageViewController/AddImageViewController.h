//
//  AddImageViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/7/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface AddImageViewController : BaseViewController

@property (nonatomic) NSInteger imgTotal;
@property (nonatomic) NSMutableArray *arrImage;
@property (nonatomic) CGFloat heightCollectionCell;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
