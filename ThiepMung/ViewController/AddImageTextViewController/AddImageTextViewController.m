//
//  AddImageTextViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/5/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddImageTextViewController.h"
#import "ShowImageView.h"
#import "AddImageViewController.h"
#import "AddTextViewController.h"
#import "AddTextTableViewCell.h"

@interface AddImageTextViewController (){
    AddImageViewController *addImageVC;
    AddTextViewController *addTextVC;
    
}
@property (nonatomic) NSInteger numberInputText;
@property (nonatomic) NSInteger numberInputImg;
@property (nonatomic) CGFloat heightImgAdd;

@end

@implementation AddImageTextViewController
@synthesize numberInputText;
@synthesize numberInputImg;
@synthesize heightImgAdd;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [_btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 2000)];

//    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
//                                   UIViewAutoresizingFlexibleHeight);
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.viewContent.frame.size.width, self.viewContent.frame.size.width*2/3)];
//    [imageView setImage:[UIImage imageNamed:@"khunganhmua.png"]];
//    [imageView layoutSubviews];
//    [imageView setContentMode:UIViewContentModeScaleToFill];
//        imageView.autoresizingMask = (
//                                          UIViewAutoresizingFlexibleWidth|
//                                          UIViewAutoresizingFlexibleHeight|
//                                            UIViewAutoresizingFlexibleLeftMargin|
//                                            UIViewAutoresizingFlexibleRightMargin|
//                                            UIViewAutoresizingFlexibleTopMargin
////                                            UIViewAutoresizingFlexibleBottomMargin
//                                          );
//    [imageView setBackgroundColor:[UIColor yellowColor]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
////    [self.scrollView addSubview:imageView];
//    
//    UILabel *labelDes = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height, self.viewContent.frame.size.width, 50)];
//    [labelDes setText:@"Description"];
//    [labelDes setBackgroundColor:[UIColor redColor]];
//    labelDes.autoresizingMask = (
//                                          UIViewAutoresizingFlexibleWidth|
////                                          UIViewAutoresizingFlexibleHeight|
//                                            UIViewAutoresizingFlexibleLeftMargin|
//                                            UIViewAutoresizingFlexibleRightMargin|
//                                            UIViewAutoresizingFlexibleTopMargin
////                                            UIViewAutoresizingFlexibleBottomMargin
//                                          );

//    [self.scrollView addSubview:labelDes];
    
    
    
    ShowImageView *showImageView = [[ShowImageView alloc]initWithFrame:CGRectMake(0, 0,320, 263)];
//    [showImageView layoutIfNeeded];
    showImageView.autoresizingMask = (
                                      UIViewAutoresizingFlexibleWidth|
                                      UIViewAutoresizingFlexibleHeight|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin
//                                        UIViewAutoresizingFlexibleBottomMargin
                                      );

    [self.scrollView addSubview:showImageView];
    
    numberInputImg = 6;
    heightImgAdd = 60;
    
//    UIView *viewAddImage = [[UIView alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height+labelDes.frame.size.height+10, self.viewContent.frame.size.width, [self hightOfAddImageVCWithTotalImage:numberInputImg]+40)];
    UIView *viewAddImage = [[UIView alloc]initWithFrame:CGRectMake(0, showImageView.frame.size.height+10, self.scrollView.frame.size.width, [self hightOfAddImageVCWithTotalImage:numberInputImg]+40)];

    [viewAddImage setBackgroundColor:[UIColor orangeColor]];
    viewAddImage.autoresizingMask = (UIViewAutoresizingFlexibleWidth|
//                                     UIViewAutoresizingFlexibleHeight|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin
//                                        UIViewAutoresizingFlexibleBottomMargin
                                     );
    UILabel *lbTitleViewAddImage = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, viewAddImage.frame.size.width-20, 20)];
    lbTitleViewAddImage.text = @"Chọn ảnh ghép";
    lbTitleViewAddImage.textColor = [UIColor colorWithRed:70/255.0f green:6/255.0f blue:143/255.0f alpha:1.0f];
    
    [viewAddImage addSubview:lbTitleViewAddImage];
    
    addImageVC = [[AddImageViewController alloc]initWithNibName:@"AddImageViewController" bundle:nil];
    [addImageVC.view setFrame:CGRectMake(10, 20+lbTitleViewAddImage.frame.size.height, self.viewContent.frame.size.width-20, [self hightOfAddImageVCWithTotalImage:numberInputImg])];
    addImageVC.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth|
//                                        UIViewAutoresizingFlexibleHeight|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin|
                                        UIViewAutoresizingFlexibleBottomMargin);
    addImageVC.imgTotal = numberInputImg;
    addImageVC.heightCollectionCell = heightImgAdd;
    [self addChildViewController:addImageVC];
    [viewAddImage addSubview:addImageVC.view];
    [addImageVC didMoveToParentViewController:self];
    
    [self.scrollView addSubview:viewAddImage];
    
    numberInputText = 5;
    addTextVC = [[AddTextViewController alloc]initWithNibName:@"AddTextViewController" bundle:nil];
//    [addTextVC.view setFrame:CGRectMake(0, imageView.frame.size.height+labelDes.frame.size.height+20 +viewAddImage.frame.size.height, self.view.frame.size.width, numberInputText*75)];
    [addTextVC.view setFrame:CGRectMake(0, showImageView.frame.size.height +viewAddImage.frame.size.height, self.view.frame.size.width, numberInputText*75)];

    addTextVC.numberInputText = numberInputText;
    addTextVC.view.autoresizingMask = (
                                       UIViewAutoresizingFlexibleWidth|
//                                       UIViewAutoresizingFlexibleHeight|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin
//                                        UIViewAutoresizingFlexibleBottomMargin
                                       );
    [self.scrollView addSubview:addTextVC.view];
    
//    UIButton *btnOk = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-25, imageView.frame.size.height+labelDes.frame.size.height+30 +viewAddImage.frame.size.height+addTextVC.view.frame.size.height, 50, 50)];
    UIButton *btnOk = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-25, showImageView.frame.size.height +viewAddImage.frame.size.height+addTextVC.view.frame.size.height, 50, 50)];

    [btnOk setBackgroundColor:[UIColor greenColor]];
    [btnOk setTitle:@"OK" forState:UIControlStateNormal];
    [btnOk addTarget:self action:@selector(btnOK:) forControlEvents:UIControlEventTouchUpInside];
    btnOk.autoresizingMask = (
//                              UIViewAutoresizingFlexibleWidth|
//                                       UIViewAutoresizingFlexibleHeight|
                                       UIViewAutoresizingFlexibleLeftMargin|
                                       UIViewAutoresizingFlexibleRightMargin|
                                       UIViewAutoresizingFlexibleTopMargin
//                                       UIViewAutoresizingFlexibleBottomMargin
                              );

    [self.scrollView addSubview:btnOk];
   

}

-(void)btnOK:(id) sender{
    AddTextTableViewCell *cell =(AddTextTableViewCell *) [addTextVC.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSLog(@"AddTextTableViewCell:%@",cell.tvMessage.text);
}

-(CGFloat)hightOfAddImageVCWithTotalImage:(NSInteger)totalImg{
    NSInteger numRow = (int)ceilf((totalImg/ ((int)(self.viewContent.frame.size.width-20)/heightImgAdd)));

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
