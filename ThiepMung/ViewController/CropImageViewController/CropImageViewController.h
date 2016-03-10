//
//  CropImageViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/10/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CropImageDelegate <NSObject>

@required
- (void)dataFromController:(UIImage *)data tag:(int)tag;

@end

@interface CropImageViewController : UIViewController
@property (weak, nonatomic) UIImage *imageTest;
@property (nonatomic) CGFloat sizeWidth;
@property (nonatomic) CGFloat sizeHeight;
@property (nonatomic) int tagImage;

@property (strong, nonatomic) UIView *bar;

@property (nonatomic, weak) id<CropImageDelegate> delegate;

@end
