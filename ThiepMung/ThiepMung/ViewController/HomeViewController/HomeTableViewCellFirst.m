//
//  HomeTableViewCellFirst.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeTableViewCellFirst.h"

@implementation HomeTableViewCellFirst
@synthesize homeCellFirstVC;

- (void)awakeFromNib {
    // Initialization code
    homeCellFirstVC = [[HomeCellFirstViewController alloc]initWithNibName:@"HomeCellFirstViewController" bundle:nil];
    homeCellFirstVC.view.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|
                                             UIViewAutoresizingFlexibleHeight);
//    [self addChildViewController:self.homeCellFirstVC];
    [self.viewContent addSubview:homeCellFirstVC.view];
//    [self.homeCellFirstVC didMoveToParentViewController:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
