//
//  CollectionItemViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CollectionItemViewController.h"
#import "SubItemCollectionView.h"
#import "AddImageTextViewController.h"

@interface CollectionItemViewController (){
    
}

@end

@implementation CollectionItemViewController

@synthesize heightCollectionCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _arrData = [[NSMutableArray alloc]init];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize = CGSizeMake((_collectionView.frame.size.height-20)*4/3, _collectionView.frame.size.height);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    [self.collectionView setCollectionViewLayout:flowLayout];
    ItemCollection *item1 = [[ItemCollection alloc]init];
    item1.urlAvatar = @"http://thiepmung.com/images/frame/frame_demo/demo-156d85c6879c55.jpg";
    item1.des = @"AAAA BBB";
    [_arrData addObject:item1];
    [_arrData addObject:item1];
    [_arrData addObject:item1];
    [_arrData addObject:item1];
    [_arrData addObject:item1];
    [self.collectionView reloadData];
    NSLog(@"viewWillAppear:%lu",(unsigned long)_arrData.count);
}
-(void)viewWillAppear:(BOOL)animated{
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark config collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"numberOfItemsInSection:%lu",(unsigned long)_arrData.count);
    return _arrData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    ItemCollection *itemCollection = [_arrData objectAtIndex:indexPath.row];
    SubItemCollectionView *subItemView = [[SubItemCollectionView alloc]initWithFrame:CGRectMake(0, 0, (_collectionView.frame.size.height-20)*4/3, _collectionView.frame.size.height)];
    subItemView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                               UIViewAutoresizingFlexibleBottomMargin |
                                               UIViewAutoresizingFlexibleLeftMargin|
                                               UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);

    [subItemView.imgAvatar setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:itemCollection.urlAvatar]]]];
    [subItemView.imgAvatar sd_setImageWithURL:[NSURL URLWithString: itemCollection.urlAvatar] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    subItemView.lbDes.text = itemCollection.des;
    [subItemView setBackgroundColor:[UIColor redColor]];
    [cell addSubview:subItemView];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AddImageTextViewController *addImageTextVC = [[AddImageTextViewController alloc]initWithNibName:@"AddImageTextViewController" bundle:nil];;
    [self.delegate presentVC:addImageTextVC];
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((_collectionView.frame.size.height-20)*4/3, _collectionView.frame.size.height);
}


@end
