//
//  AddImageTextViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/5/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddImageTextViewController.h"
#import "ShowImageView.h"
#import "AddTextTableViewCell.h"

@interface AddImageTextViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIImageView *imageView;
    UILabel *lbDes;
    UILabel *lbTitleViewAddImage;
    UIButton *btnOk;
}
@property (nonatomic) NSInteger numberInputText;
@property (nonatomic) NSInteger numberInputImg;
@property (nonatomic) CGFloat heightImgAdd;

@end

@implementation AddImageTextViewController
@synthesize numberInputText;
@synthesize numberInputImg;
@synthesize heightImgAdd;
@synthesize collectionViewAddImage;
@synthesize tableViewAddText;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [_btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.width*2/3)];
    [imageView setImage:[UIImage imageNamed:@"khunganhmua.png"]];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:imageView];
    
    lbDes = [[UILabel alloc]initWithFrame:CGRectMake(0, 500, 325, 100)];
    [lbDes setText:@"Description Description Description Description"];
    [lbDes setBackgroundColor:[UIColor redColor]];
    lbDes.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView setBackgroundColor:[UIColor greenColor]];
    [self.scrollView addSubview:lbDes];
    [self.scrollView setContentSize:CGSizeMake(375, 2000)];
    
    
    
    numberInputImg = 10;
    heightImgAdd = 60;
    numberInputText = 5;
    
    lbTitleViewAddImage = [[UILabel alloc]init];
    lbTitleViewAddImage.text = @"Chọn ảnh ghép";
    lbTitleViewAddImage.textColor = [UIColor colorWithRed:70/255.0f green:6/255.0f blue:143/255.0f alpha:1.0];
    lbTitleViewAddImage.translatesAutoresizingMaskIntoConstraints = NO;

    [self.scrollView addSubview:lbTitleViewAddImage];
    
    /*Create add Image input View*/
    collectionViewAddImage.translatesAutoresizingMaskIntoConstraints = NO;
    collectionViewAddImage.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:collectionViewAddImage];
    
    /*Create add Text input View*/
    tableViewAddText.translatesAutoresizingMaskIntoConstraints = NO;
    tableViewAddText.backgroundColor = [UIColor darkGrayColor];
    [self.scrollView addSubview:tableViewAddText];
    
    
    btnOk = [[UIButton alloc]init];
    [btnOk setBackgroundColor:[UIColor redColor]];
    [btnOk setTitle:@"OK" forState:UIControlStateNormal];
    [btnOk addTarget:self action:@selector(btnOK:) forControlEvents:UIControlEventTouchUpInside];
    btnOk.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:btnOk];
    
    
    [self updateViewConstraints];
    
    /*config collection view*/
    self.collectionViewAddImage.dataSource = self;
    self.collectionViewAddImage.delegate = self;
    [self.collectionViewAddImage registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.collectionViewAddImage setBackgroundColor:[UIColor whiteColor]];
    
    /*config tableview view*/
    self.tableViewAddText.dataSource = self;
    self.tableViewAddText.delegate = self;
    [self.tableViewAddText reloadData];
    [self.tableViewAddText registerNib:[UINib nibWithNibName:@"AddTextTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddTextTableViewCellIdentifier"];
    self.tableViewAddText.allowsSelection = NO;

}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:imageView
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:2.0/3.0 //Aspect ratio: 4*height = 3*width
                                                            constant:0.0f]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0.0f]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containerView
    //                                                              attribute:NSLayoutAttributeBottom
    //                                                              relatedBy:NSLayoutRelationEqual
    //                                                                 toItem:self.view
    //                                                              attribute:NSLayoutAttributeBottom
    //                                                             multiplier:1.0
    //                                                               constant:0.0]];
    
    /*add constraint for lbDes */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbDes attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:imageView attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbDes
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbDes
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbDes(==70)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(lbDes)]];
    /*add constraint for lbTitleAddImage */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbTitleViewAddImage attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:lbDes attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbTitleViewAddImage
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:10.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lbTitleViewAddImage
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbTitleViewAddImage(==30)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(lbTitleViewAddImage)]];
    
    
    
    /*add constraint for view add image */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionViewAddImage attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:lbTitleViewAddImage attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionViewAddImage
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:10.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:collectionViewAddImage
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:-10.0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat: @"V:[collectionViewAddImage(==%f)]",[self hightOfAddImageVCWithTotalImage:numberInputImg]]
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(collectionViewAddImage)]];
    /*add constraint for view add text input */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewAddText attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:collectionViewAddImage attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewAddText
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewAddText
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat: @"V:[tableViewAddText(==%f)]",numberInputText*75.0]
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(tableViewAddText)]];
    /*add constraint for button Ok */
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOk attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tableViewAddText attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0 constant:20]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOk
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.scrollView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[btnOk(==50)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(btnOk)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[btnOk(==70)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(btnOk)]];
    
    
}


-(void)btnOK:(id) sender{
//    AddTextTableViewCell *cell =(AddTextTableViewCell *) [addTextVC.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//    NSLog(@"AddTextTableViewCell:%@",cell.tvMessage.text);
}

-(CGFloat)hightOfAddImageVCWithTotalImage:(NSInteger)totalImg{
    NSInteger numRow = (int)ceilf((totalImg/ ((int)([UIScreen mainScreen].bounds.size.width-20)/(heightImgAdd+10))));

    CGFloat heightView = numRow*heightImgAdd+(numRow-1)*10;
    
    NSLog(@"hightOfAddImageVCWithTotalImage:%tu,%f",numRow,heightView);
    return heightView;
}
- (void)viewDidAppear:(BOOL)animated{
    [self.scrollView setContentSize:CGSizeMake(self.viewContent.frame.size.width, 2000)];
}

- (void)btnBack:(id) sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark config collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numberInputImg;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    //    [cell setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
    //    [cell setBackgroundColor:[UIColor redColor]];
    UIImageView *imageViewBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, heightImgAdd, heightImgAdd)];
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
    return CGSizeMake(heightImgAdd, heightImgAdd);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numberInputText;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AddTextTableViewCellIdentifier";
    AddTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AddTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.lbMessage.text = [NSString stringWithFormat:@"Thông điệp %tu:",indexPath.row+1];
    //    NSLog(@"cell:%@",cell);
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0f;
}

@end
