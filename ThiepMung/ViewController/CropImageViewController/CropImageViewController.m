//
//  CropImageViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/10/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CropImageViewController.h"
#import "Cropper.h"

@interface CropImageViewController (){
    CGFloat sizeWidth1;
    CGFloat sizeHeight1;
    UIImageView *uiViewCrop;
    CGFloat widthBounds;
    CGFloat heightBounds;
}

@property (strong, nonatomic) Cropper *cropper;

@end

@implementation CropImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40,CGRectGetWidth(self.view.frame)-40,40)];
    lbNavTitle.textAlignment = NSTextAlignmentCenter;
    //    lbNavTitle.textAlignment = UITextAlignmentLeft;
    [lbNavTitle setText:@"Frame Effects"];
    [lbNavTitle setTextColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.7f]];
    //    lbNavTitle.text = NSLocalizedString(@"Hiệu Ứng Khung Ảnh",@"");
    self.navigationItem.titleView = lbNavTitle;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(itemBack:) ];
    //    [self.navigationItem.leftBarButtonItem setImage: [UIImage imageNamed:@"back"]];
    
    
    widthBounds = CGRectGetWidth(self.view.frame);
    heightBounds = CGRectGetHeight(self.view.frame);
    //    NSLog(@"width height: %f %f",widthBounds,heightBounds);
    
    // Do any additional setup after loading the view.
    UIButton *crop1 = [[UIButton alloc]init];
    [crop1 setFrame:CGRectMake(widthBounds/2-110, heightBounds-45,100 , 40)];
    [crop1 addTarget:self action:@selector(crop1:) forControlEvents:UIControlEventTouchUpInside];
    [crop1 setTitle:@"Crop" forState:UIControlStateNormal];
    [crop1 setBackgroundColor:[UIColor colorWithRed:0/255.0f green:122/255.0f blue:204/255.0f alpha:0.7f]];
    [crop1 setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateHighlighted];
    [crop1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [crop1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    crop1.layer.cornerRadius = 10.0f;
    crop1.layer.borderColor = [UIColor whiteColor].CGColor;
    crop1.clipsToBounds = YES;
    [crop1.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    UIButton *cancel = [[UIButton alloc]init];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel setFrame:CGRectMake(widthBounds/2+10, heightBounds-45, 100 , 40)];
    [cancel addTarget:self action:@selector(cancel1:) forControlEvents:UIControlEventTouchUpInside];
    [cancel setBackgroundColor:[UIColor colorWithRed:0/255.0f green:122/255.0f blue:204/255.0f alpha:0.7f]];
    [cancel setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forState:UIControlStateHighlighted];
    [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    cancel.layer.cornerRadius = 10.0f;
    cancel.layer.borderColor = [UIColor whiteColor].CGColor;
    cancel.clipsToBounds = YES;
    [cancel.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.8f]];
    
    //NSLog(@"widthBounds: %f, %f",widthBounds,heightBounds);
    //NSLog(@"widthBounds: %@",_imageTest);
    uiViewCrop = [[UIImageView alloc] initWithImage:_imageTest];
    float ratioWidthHeight = _imageTest.size.width/_imageTest.size.height;
    float ratioHeightWidth = _imageTest.size.height/_imageTest.size.width;
    //NSLog(@"widthBounds: %f, %f",ratioWidthHeight,ratioHeightWidth);
    if (ratioHeightWidth< (heightBounds-115-70)/widthBounds) {
        [uiViewCrop setFrame:CGRectMake(0, 65+(heightBounds-65-ratioHeightWidth*widthBounds)/2, widthBounds, ratioHeightWidth*widthBounds)];
    }else{
        
        [uiViewCrop setFrame:CGRectMake((widthBounds-ratioWidthHeight*(heightBounds-115))/2, 65, ratioWidthHeight*(heightBounds-115), heightBounds-115)];
        
    }
    
    //    [self.view addSubview:uiScrollView];
    [self.view addSubview:uiViewCrop];
    [self.view addSubview:crop1];
    [self.view addSubview:cancel];
    
    
    
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cắt"
    //                                                            style:UIBarButtonItemStylePlain target:self action:@selector(cropit:)];
    ////////NSLog(@"width: :%f",_sizeWidth);
    ////////NSLog(@"height: :%f",_sizeHeight);
    if ((_sizeWidth ==0) || (_sizeHeight == 0)) {
        _sizeWidth = _sizeHeight = 300;
    }
    ////////NSLog(@"width: :%f",_sizeWidth);
    ////////NSLog(@"height: :%f",_sizeHeight);
    //    [self.btncrop setEnabled:NO];
    
    //    [self.view setBackgroundColor:[UIColor whiteColor]];
    //////////////////////////////
    
    if (widthBounds<768) {
        NSLog(@"widthBounds>=768 ipad");
        if (_sizeWidth >_sizeHeight) {
            CGFloat ratio = _sizeWidth/_sizeHeight;
            sizeHeight1 = 200;
            sizeWidth1 = sizeHeight1*ratio;
        }else{
            CGFloat ratio = _sizeHeight/_sizeWidth;
            sizeWidth1 = 200;
            sizeHeight1 = sizeWidth1*ratio;
        }
    }else{
        NSLog(@"widthBounds>=768 iphone");
        if (_sizeWidth >_sizeHeight) {
            CGFloat ratio = _sizeWidth/_sizeHeight;
            sizeHeight1 = 400;
            sizeWidth1 = sizeHeight1*ratio;
        }else{
            CGFloat ratio = _sizeHeight/_sizeWidth;
            sizeWidth1 = 400;
            sizeHeight1 = sizeWidth1*ratio;
        }
    }
    //    self.cropper = [[Cropper alloc] initWithImageView:self.imageView];
    //    [self.btncrop setEnabled:NO];
    //    [self addButtonsBar];
    //    self.cropper = [[Cropper alloc] initWithImageView:self.imageView InitialCroppingRect:50 y:50 w:sizeWidth1 h:sizeHeight1];
    self.cropper = [[Cropper alloc] initWithImageView:uiViewCrop InitialCroppingRect:70 y:70 w:sizeWidth1 h:sizeHeight1];
    __weak CropImageViewController *_self = self;
    _cropper.cropAction = ^(CropperAction action, UIImage *image){
        //        [_self.cropper removeFromSuperview];
        
        //sự kiện khi click vào button cắt ảnh.(đã chọn được vùng cắt)
        if( action == CropperActionDidCrop )
        {
            
            
            /////////////////
            //            CGRect rect = CGRectMake(0.0, 0.0, _sizeWidth, _sizeHeight);
            CGRect rect = CGRectMake(0.0, 0.0, _sizeWidth, _sizeHeight);
            UIGraphicsBeginImageContext(rect.size);
            [image drawInRect:rect];
            UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
            NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
            UIGraphicsEndImageContext();
            UIImage *image11 = [UIImage imageWithData:imageData];
            [[_self delegate] dataFromController:image11 tag:_tagImage];
            [_self.navigationController popViewControllerAnimated:YES];
        }
        ////////NSLog(@"aaa 2");
        
        //        [_self.cropButton setEnabled:YES];
    };
    //        [self.navigationController popViewControllerAnimated:YES];
    ////////NSLog(@"aaa 3");
    //    [self.cropButton setEnabled:NO];
    
    
    ////////////////////////////
}
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (IBAction)crop1:(id)sender
{
    if( self.cropper.cropAction )
    {
        UIImage *image = [self.cropper generateCroppedImage];
        self.cropper.cropAction(CropperActionDidCrop, image);
        //        [self.cropper finishCropper];
    }
}

- (IBAction)cancel1:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)itemBack:(UIButton*)button {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
