//
//  HomeTableViewCellSecond.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeTableViewCellSecond.h"

@implementation HomeTableViewCellSecond

-(id)initWithCoder:(NSCoder*)aDecoder
{
    NSLog(@"_dCategory0:%@",self.dCategory);

    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        NSLog(@"_dCategory1:%@",self.dCategory);
        //Changes here after init'ing self
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _collectionItemVC = [[CollectionItemViewController alloc]initWithNibName:@"CollectionItemViewController" bundle:nil];
    [_collectionItemVC.view setFrame:CGRectMake(10, 5, _viewContent.bounds.size.width-10, _viewContent.bounds.size.height-10)];
    _collectionItemVC.view.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                               UIViewAutoresizingFlexibleBottomMargin |
                                               UIViewAutoresizingFlexibleLeftMargin|
                                               UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
//    _collectionItemVC.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    _collectionItemVC.heightCollectionCell =_viewContent.bounds.size.height;
//    _collectionItemVC.dCategory = self.dCategory;
    NSLog(@"_dCategory:%@",self.dCategory);
    [self.viewContent addSubview:_collectionItemVC.view];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
