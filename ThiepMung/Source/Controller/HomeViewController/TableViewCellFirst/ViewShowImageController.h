//
//  ViewShowImageController.h
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface ViewShowImageController : BaseViewController

@property (assign,nonatomic) NSInteger index;
@property (nonatomic) DEffect *dEffect;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewContent;
@property (weak, nonatomic) IBOutlet UIButton *btnFull;

@end
