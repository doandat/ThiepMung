//
//  ViewController.m
//  TestTableview
//
//  Created by DatDV on 3/16/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TestTableViewController *testVC = [[TestTableViewController alloc]initWithNibName:@"TestTableViewController" bundle:nil];
    [self addChildViewController:testVC];
    [self.view addSubview:testVC.view];
    [testVC didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
