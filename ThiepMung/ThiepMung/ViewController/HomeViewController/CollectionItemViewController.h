//
//  CollectionItemViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface CollectionItemViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) CGFloat heightCollectionCell;

@property (nonatomic) NSMutableArray *arrData;



@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
