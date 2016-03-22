//
//  SubCategoryViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/14/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "SubItemCollectionView.h"
#import "AddImageTextViewController.h"

@interface SubCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation SubCategoryViewController
@synthesize arrDataSource;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionView setBackgroundColor:MU_RGBA(108, 64, 184, 0.7)];
    [_btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController setNavigationBarHidden:YES];
    _lbTitle.text = _stringTitle;
}
- (void)btnBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    DEffect *dEffect = [arrDataSource objectAtIndex:indexPath.row];
    CGFloat width = (([UIScreen mainScreen].bounds.size.width-10)/2>202)? ([UIScreen mainScreen].bounds.size.width-30)/4:([UIScreen mainScreen].bounds.size.width-10)/2;

    SubItemCollectionView *subItemView = [[SubItemCollectionView alloc]initWithFrame:CGRectMake(0, 0, width, width*2/3+40)];
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DEffect *dEffect = [arrDataSource objectAtIndex:indexPath.row];
    AddImageTextViewController *addImageTextVC = [[AddImageTextViewController alloc]initWithNibName:@"AddImageTextViewController" bundle:nil];
    UINavigationController *navigationAddImageText = [[UINavigationController alloc]initWithRootViewController:addImageTextVC];;
    addImageTextVC.dEffect = dEffect;
    [self presentViewController:navigationAddImageText animated:YES completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    CGFloat width = (([UIScreen mainScreen].bounds.size.width-10)/2>202)? ([UIScreen mainScreen].bounds.size.width-30)/4:([UIScreen mainScreen].bounds.size.width-10)/2;
    return CGSizeMake(width, width*2/3+40);
}

@end
