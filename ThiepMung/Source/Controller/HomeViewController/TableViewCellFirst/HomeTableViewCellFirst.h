//
//  HomeTableViewCellFirst.h
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellFirstViewController.h"

@interface HomeTableViewCellFirst : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (nonatomic) HomeCellFirstViewController *homeCellFirstVC;
@end
