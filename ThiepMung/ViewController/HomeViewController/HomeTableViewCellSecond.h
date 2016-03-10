//
//  HomeTableViewCellSecond.h
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionItemViewController.h"

@interface HomeTableViewCellSecond : UITableViewCell


@property (nonatomic) CollectionItemViewController *collectionItemVC;



@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet UIView *viewContent;

@end
