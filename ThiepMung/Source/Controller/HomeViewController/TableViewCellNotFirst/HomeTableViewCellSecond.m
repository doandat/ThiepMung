//
//  HomeTableViewCellSecond.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeTableViewCellSecond.h"
#import "SubItemCollectionView.h"
#import "AddImageTextViewController.h"

@interface HomeTableViewCellSecond (){
}
@end

@implementation HomeTableViewCellSecond
@synthesize arrDataSource;

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
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setBackgroundColor:MU_RGBA(108, 64, 184, 0.7)];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize = CGSizeMake((_collectionView.frame.size.height-20)*4/3, _collectionView.frame.size.height);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    [self.collectionView setCollectionViewLayout:flowLayout];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    arrDataSource = [AppService getEffectListWithCategoryId:_dCategory.dCategory_id];
    
    [self.collectionView reloadData];
    NSLog(@"setSelected HomeTableViewCellSecond:%lu",(unsigned long)arrDataSource.count);

}

#pragma mark config collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"numberOfItemsInSection:%lu",(unsigned long)arrDataSource.count);
    return arrDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    DEffect *dEffect = [arrDataSource objectAtIndex:indexPath.row];
    SubItemCollectionView *subItemView = [[SubItemCollectionView alloc]initWithFrame:CGRectMake(0, 0, (_collectionView.frame.size.height-40)*4/3, _collectionView.frame.size.height)];
    subItemView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleBottomMargin |
                                    UIViewAutoresizingFlexibleLeftMargin|
                                    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    
    [subItemView.imgAvatar sd_setImageWithURL:[NSURL URLWithString: dEffect.avatar] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    subItemView.lbDes.text = dEffect.effectDescription;
    [subItemView setBackgroundColor:[UIColor redColor]];
    [cell addSubview:subItemView];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DEffect *dEffect = [arrDataSource objectAtIndex:indexPath.row];
    AddImageTextViewController *addImageTextVC = [[AddImageTextViewController alloc]initWithNibName:@"AddImageTextViewController" bundle:nil];
    UINavigationController *navigationAddImageText = [[UINavigationController alloc]initWithRootViewController:addImageTextVC];;
    addImageTextVC.dEffect = dEffect;
    [self.delegate presentVC:navigationAddImageText];
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((_collectionView.frame.size.height-40)*4/3, _collectionView.frame.size.height);
}

@end
