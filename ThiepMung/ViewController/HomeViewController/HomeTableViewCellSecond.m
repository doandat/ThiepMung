//
//  HomeTableViewCellSecond.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeTableViewCellSecond.h"

@implementation HomeTableViewCellSecond

- (void)awakeFromNib {
    // Initialization code
    _collectionItemVC = [[CollectionItemViewController alloc]initWithNibName:@"CollectionItemViewController" bundle:nil];
    [_collectionItemVC.view setFrame:CGRectMake(10, 5, _viewContent.bounds.size.width-10, _viewContent.bounds.size.height-10)];
    _collectionItemVC.view.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                               UIViewAutoresizingFlexibleBottomMargin |
                                               UIViewAutoresizingFlexibleLeftMargin|
                                               UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
//    _collectionItemVC.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    _collectionItemVC.heightCollectionCell =_viewContent.bounds.size.height;
    [self.viewContent addSubview:_collectionItemVC.view];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
