//
//  ViewController.m
//  DemoActivityIndicator
//
//  Created by DatDV on 3/14/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "ViewController.h"
#import "JBWatchActivityIndicator.h"

static NSString * const kDefaultImagePrefix = @"Activity";

@interface ViewController ()

@property (nonatomic, readwrite, strong) JBWatchActivityIndicator *watchActivityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self applyType:JBWatchActivityIndicatorTypeSegments];

}

- (void)applyType:(JBWatchActivityIndicatorType)type {
    
    self.watchActivityIndicator = [[JBWatchActivityIndicator alloc] initWithType:type];
    [self update];
}


- (void)update {
    self.imageView.image = [self.watchActivityIndicator animatedImageWithDuration:1.0f];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
