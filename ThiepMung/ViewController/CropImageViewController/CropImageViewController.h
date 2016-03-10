//
//  CropImageViewController.h
//  ThiepMung
//
//  Created by DatDV on 3/10/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CropImageViewController;
@protocol CropImageDelegate <NSObject>

@required
- (void)imageFromController:(CropImageViewController*)cropImageVC image:(UIImage *)image tag:(int)tag;

@end

@interface CropImageViewController : UIViewController
@property (weak, nonatomic) UIImage *imageTest;
@property (nonatomic) CGFloat sizeWidth;
@property (nonatomic) CGFloat sizeHeight;
@property (nonatomic) int tagImage;

@property (strong, nonatomic) UIView *bar;

@property (nonatomic, weak) id<CropImageDelegate> delegate;
+(CropImageViewController *)cropImageVC;

@end
