//
//  AddImageViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/7/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddImageViewController.h"

@interface AddImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation AddImageViewController
@synthesize heightCollectionCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark config collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgTotal;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
//    [cell setBackgroundColor:[UIColor redColor]];
    UIImageView *imageViewBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, heightCollectionCell, heightCollectionCell)];
//    [imageViewBackground setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    imageViewBackground.contentMode = UIViewContentModeScaleToFill;
    [imageViewBackground setImage:[UIImage imageNamed:@"addpicture.png"]];
    
    [cell addSubview:imageViewBackground];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didDeselectItemAtIndexPath:%tu",indexPath.row);
    
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(heightCollectionCell, heightCollectionCell);
}

@end
