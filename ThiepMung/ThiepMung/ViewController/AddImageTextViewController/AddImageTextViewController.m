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

@interface AddImageTextViewController (){
    AddImageViewController *addImageVC;
}
@property (nonatomic) NSInteger imgTotal;
@property (nonatomic) CGFloat heightImgAdd;

@end

@implementation AddImageTextViewController
@synthesize imgTotal;
@synthesize heightImgAdd;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [_btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.viewContent.frame.size.width, self.viewContent.frame.size.width*2/3)];
    [imageView setImage:[UIImage imageNamed:@"khunganhmua.png"]];
    [imageView layoutSubviews];
    [imageView setContentMode:UIViewContentModeScaleToFill];
        imageView.autoresizingMask = (
                                          UIViewAutoresizingFlexibleWidth|
                                          UIViewAutoresizingFlexibleHeight|
//                                            UIViewAutoresizingFlexibleLeftMargin|
//                                            UIViewAutoresizingFlexibleRightMargin|
//                                            UIViewAutoresizingFlexibleTopMargin|
                                            UIViewAutoresizingFlexibleBottomMargin
                                          );

    [self.scrollView addSubview:imageView];
    
    UILabel *labelDes = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height, self.viewContent.frame.size.width, 50)];
    [labelDes setText:@"Description"];
    [labelDes setBackgroundColor:[UIColor redColor]];
    labelDes.autoresizingMask = (
                                          UIViewAutoresizingFlexibleWidth|
                                          UIViewAutoresizingFlexibleHeight|
                                            UIViewAutoresizingFlexibleLeftMargin|
                                            UIViewAutoresizingFlexibleRightMargin|
                                            UIViewAutoresizingFlexibleTopMargin|
                                            UIViewAutoresizingFlexibleBottomMargin
                                          );

    [self.scrollView addSubview:labelDes];
    
    
    
//    ShowImageView *showImageView = [[ShowImageView alloc]initWithFrame:CGRectMake(0, 0, self.viewContent.frame.size.width, self.viewContent.frame.size.width*2/3+50)];
//    [showImageView layoutIfNeeded];
//    showImageView.autoresizingMask = (
//                                      UIViewAutoresizingFlexibleWidth|
//                                      UIViewAutoresizingFlexibleHeight|
//                                        UIViewAutoresizingFlexibleLeftMargin|
//                                        UIViewAutoresizingFlexibleRightMargin|
//                                        UIViewAutoresizingFlexibleTopMargin|
//                                        UIViewAutoresizingFlexibleBottomMargin
//                                      );
//
//    [self.scrollView addSubview:showImageView];
    
    imgTotal = 5;
    heightImgAdd = 60;
    
    UIView *viewAddImage = [[UIView alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height+labelDes.frame.size.height+10, self.viewContent.frame.size.width, [self hightOfAddImageVCWithTotalImage:imgTotal]+40)];
    [viewAddImage setBackgroundColor:[UIColor orangeColor]];
    viewAddImage.autoresizingMask = (UIViewAutoresizingFlexibleWidth|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin|
                                        UIViewAutoresizingFlexibleBottomMargin);
    UILabel *lbTitleViewAddImage = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, viewAddImage.frame.size.width-20, 20)];
    lbTitleViewAddImage.text = @"Chọn ảnh ghép";
    lbTitleViewAddImage.textColor = [UIColor colorWithRed:70/255.0f green:6/255.0f blue:143/255.0f alpha:1.0f];
    
    [viewAddImage addSubview:lbTitleViewAddImage];
    
    addImageVC = [[AddImageViewController alloc]initWithNibName:@"AddImageViewController" bundle:nil];
    [addImageVC.view setFrame:CGRectMake(10, 20+lbTitleViewAddImage.frame.size.height, self.viewContent.frame.size.width-20, [self hightOfAddImageVCWithTotalImage:imgTotal])];
    addImageVC.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth|
                                        UIViewAutoresizingFlexibleLeftMargin|
                                        UIViewAutoresizingFlexibleRightMargin|
                                        UIViewAutoresizingFlexibleTopMargin|
                                        UIViewAutoresizingFlexibleBottomMargin);
    addImageVC.imgTotal = imgTotal;
    addImageVC.heightCollectionCell = heightImgAdd;
    [self addChildViewController:addImageVC];
    [viewAddImage addSubview:addImageVC.view];
    [addImageVC didMoveToParentViewController:self];
    
    [self.scrollView addSubview:viewAddImage];
    
    
    

}
-(CGFloat)hightOfAddImageVCWithTotalImage:(NSInteger)totalImg{
    NSInteger numRow = (int)ceilf((totalImg/ ((int)(self.viewContent.frame.size.width-20)/heightImgAdd)));

    CGFloat heightView = numRow*heightImgAdd+(numRow-1)*10;
    
    NSLog(@"hightOfAddImageVCWithTotalImage:%tu,%f",numRow,heightView);
    return heightView;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.scrollView setContentSize:CGSizeMake(self.viewContent.frame.size.width, 1000)];
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
