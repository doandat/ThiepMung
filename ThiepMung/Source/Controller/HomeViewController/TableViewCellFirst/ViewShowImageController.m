//
//  ViewShowImageController.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "ViewShowImageController.h"
#import "HomeViewController.h"
#import "AddImageTextViewController.h"

@interface ViewShowImageController ()

@end

@implementation ViewShowImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.imageViewContent setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_dEffect.avatar]]]];
    NSLog(@"_dEffect.avatar:%@",_dEffect.avatar);
    [self.btnFull setBackgroundColor:MU_RGBA(0, 0, 0, 0.1)];
    [self.btnFull addTarget:self action:@selector(btnFull:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnFull:(id)sender{
    AddImageTextViewController *addImageTextVC = [[AddImageTextViewController alloc]initWithNibName:@"AddImageTextViewController" bundle:nil];
    UINavigationController *navigationAddImageText = [[UINavigationController alloc]initWithRootViewController:addImageTextVC];;
    addImageTextVC.dEffect = _dEffect;
//    [self.delegate presentVC:navigationAddImageText];

    [[HomeViewController sharedInstance] presentViewController:navigationAddImageText animated:YES completion:nil];
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
