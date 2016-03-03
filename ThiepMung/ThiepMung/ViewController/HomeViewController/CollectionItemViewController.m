//
//  CollectionItemViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CollectionItemViewController.h"
#import "SubItemCollectionView.h"

@interface CollectionItemViewController (){
    
}

@end

@implementation CollectionItemViewController

@synthesize heightCollectionCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize = CGSizeMake(heightCollectionCell-10,heightCollectionCell);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark config collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    ItemCollection *itemCollection = [_arrData objectAtIndex:indexPath.row];
    SubItemCollectionView *subItemView = [[SubItemCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.heightCollectionCell, self.heightCollectionCell*3/4+20)];
    [subItemView.imgAvatar setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:itemCollection.urlAvatar]]]];
    subItemView.lbDes.text = itemCollection.des;
    [subItemView setBackgroundColor:[UIColor redColor]];
    [cell addSubview:subItemView];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(heightCollectionCell, heightCollectionCell);
}


@end
