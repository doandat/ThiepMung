//
//  AddImageTextViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/5/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddImageTextViewController.h"
#import "AddTextTableViewCell.h"
#import "WYPopoverController.h"
#import "DialogViewController.h"
#import "CropImageViewController.h"


@interface AddImageTextViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,WYPopoverControllerDelegate,DialogViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CropImageDelegate>{
    UIImageView *imageView;
    UILabel *lbDes;
    UILabel *lbTitleViewAddImage;
    UIButton *btnOk;
    WYPopoverController *btnAddImagePopoverController;
    NSInteger indexSelectDialog;
    CropImageViewController *cropImageVC;
    NSInteger tagSelected;
    NSMutableArray *arrImage;
    
    NSInteger indexTextViewChanging;

}
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) UIImage *imagePicker;
@property (nonatomic) BOOL *check;

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
@synthesize imagePicker;

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
    
    [self.scrollView addSubview:lbDes];
    
    
    numberInputImg = 7;
    heightImgAdd = 60;
    numberInputText = 3;
    
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
    
    [self.scrollView setContentSize:CGSizeMake(375, 2000)];

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
    
    arrImage = [[NSMutableArray alloc] initWithCapacity:numberInputImg];
    for (int i = 0; i < numberInputImg; i++) {
        [arrImage insertObject:[NSNull null] atIndex:i];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    [self.view layoutIfNeeded];

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
    AddTextTableViewCell *cell =(AddTextTableViewCell *) [self.tableViewAddText cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSLog(@"AddTextTableViewCell:%@",cell.tvMessage.text);
    for (int k=0; k<numberInputImg; k++) {
        NSLog(@"btnOK:%@",[arrImage objectAtIndex:k]);
    }
}

-(CGFloat)hightOfAddImageVCWithTotalImage:(NSInteger)totalImg{
    NSInteger numRow = (int)ceilf((totalImg/ ((int)([UIScreen mainScreen].bounds.size.width-20)/(heightImgAdd+10))));

    CGFloat heightView = numRow*heightImgAdd+(numRow-1)*10;
    
    NSLog(@"hightOfAddImageVCWithTotalImage:%tu,%f",numRow,heightView);
    return heightView;
}
- (void)viewDidAppear:(BOOL)animated{
    [self.scrollView setContentSize:CGSizeMake(self.viewContent.frame.size.width, 600+numberInputText*80)];
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
    UIButton *btnAddImage = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, heightImgAdd, heightImgAdd)];
    [btnAddImage setBackgroundImage:[UIImage imageNamed:@"addpicture.png"] forState:UIControlStateNormal];

    [btnAddImage addTarget:self action:@selector(btnAddImage:) forControlEvents:UIControlEventTouchUpInside];
    [btnAddImage setTag:(2000+indexPath.row)];
    [cell addSubview:btnAddImage];
    
////    UIImageView *imageViewBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, heightImgAdd, heightImgAdd)];
////    //    [imageViewBackground setBackgroundColor:[UIColor colorWithRed:19/255.0f green:19/255.0f blue:19/255.0f alpha:1.0f]];
////    imageViewBackground.contentMode = UIViewContentModeScaleToFill;
////    [imageViewBackground setImage:[UIImage imageNamed:@"addpicture.png"]];
//    [cell addSubview:imageViewBackground];
    
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
    cell.tvMessage.delegate = self;
    [cell.tvMessage setTag:(3000+indexPath.row)];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0f;
}

#pragma mark config keyboard

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)btnAddImage:(id)sender{
    if (btnAddImagePopoverController == nil)
    {
        UIView *btn = (UIView *)sender;
        tagSelected = [sender tag];
        DialogViewController *dialogVC = [[DialogViewController alloc]initWithNibName:@"DialogViewController" bundle:nil];
        dialogVC.preferredContentSize = CGSizeMake(130, 88);
        dialogVC.delegate = self;
        dialogVC.arrDataSource = [NSArray arrayWithObjects:@"Camera",@"Library", nil];
        dialogVC.arrImageDes = [NSArray arrayWithObjects:@"camera.png",@"library.png", nil];

        dialogVC.modalInPopover = NO;
        
        UINavigationController *contentViewController = [[UINavigationController alloc] initWithRootViewController:dialogVC];
        
        btnAddImagePopoverController = [[WYPopoverController alloc] initWithContentViewController:contentViewController];
        btnAddImagePopoverController.delegate = self;
        btnAddImagePopoverController.passthroughViews = @[btn];
        btnAddImagePopoverController.popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
        btnAddImagePopoverController.wantsDefaultContentAppearance = NO;
        
        [btnAddImagePopoverController presentPopoverFromRect:btn.bounds
                                                  inView:btn
                                permittedArrowDirections:WYPopoverArrowDirectionAny
                                                animated:YES
                                                 options:WYPopoverAnimationOptionFadeWithScale];
    }
    else
    {
        [self close:nil];
    }
}

#pragma mark implement WYPopoverControllerDelegate
- (void)close:(id)sender
{
    
    [btnAddImagePopoverController dismissPopoverAnimated:YES completion:^{
        [self popoverControllerDidDismissPopover:btnAddImagePopoverController];
    }];
}
#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    //    if (controller == anotherPopoverController)
    //    {
    //        anotherPopoverController.delegate = nil;
    //        anotherPopoverController = nil;
    //    }
    //    else
    if (controller == btnAddImagePopoverController)
    {
        btnAddImagePopoverController.delegate = nil;
        btnAddImagePopoverController = nil;
    }
}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return YES;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}

#pragma mark implement dialogDelegate
-(void)dialogViewController:(DialogViewController *)dialogVC selectIndex:(NSInteger)index{
    [self close:nil];
    indexSelectDialog = index;
    NSLog(@"indexSelectDialog:%tu",index);
    if (index==0) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }else{
            _imagePickerController = [[UIImagePickerController alloc] init];
            _imagePickerController.delegate = self;
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:_imagePickerController animated:YES completion:nil];
            //                _indexOfPicture = [button tag];
        }
    }else if(index == 1){
        
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_imagePickerController animated:YES completion:nil];
    }
}

#pragma mark implement pickerImage
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    imagePicker = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    if (!imagePicker) {
        NSLog(@"Không lấy được ảnh");
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"đã lấy được ảnh");
            cropImageVC = [[CropImageViewController alloc]initWithNibName:@"CropImageViewController" bundle:nil];
            cropImageVC.imageTest = imagePicker;
            cropImageVC.sizeWidth = 80.0f;
            cropImageVC.sizeHeight = 100.0f;
            cropImageVC.tagImage = tagSelected;
            cropImageVC.delegate = self;
            UINavigationController *navigationCropImg = [[UINavigationController alloc]initWithRootViewController:cropImageVC];
            [self.navigationController presentViewController:navigationCropImg animated:YES completion:nil];
        }];
    }
    
    
}

#pragma mark implement cropImageVC
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    [[self navigationController] dismissViewControllerAnimated:NO completion:nil];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.check = false;
    
}

- (void)cropImageButtonDonePress:(CropImageViewController*)cropImageVC image:(UIImage *)image tag:(NSInteger)tag{
    NSLog(@"cropImageButtonDonePress in addImageTextVC %tu : %@",tag,image);
    [arrImage replaceObjectAtIndex:tag-2000 withObject:image];
    UIButton *button = (UIButton *) [self.collectionViewAddImage viewWithTag:tag];
    [button setBackgroundImage:image forState:UIControlStateNormal];
//    [self.collectionViewAddImage reloadData];
}

//
- (void)_keyboardWillShowNotification:(NSNotification*)notification{
    CGFloat hightOfset  = imageView.frame.size.height+120+self.addImageView.frame.size.height+indexTextViewChanging*75;
    [self.scrollView setContentOffset:CGPointMake(0, hightOfset) animated:YES];
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 600+numberInputText*80+215)];
    NSLog(@"_keyboardWillShowNotification:%f",hightOfset);
}

- (void)_keyboardWillHideNotification:(NSNotification*)notification{
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 600+numberInputText*80)];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    indexTextViewChanging = textView.tag-3000;
    CGFloat hightOfset  = imageView.frame.size.height+120+self.addImageView.frame.size.height+indexTextViewChanging*75;

    NSLog(@"textViewShouldBeginEditing:%@:%tu",textView,indexTextViewChanging);
    [self.scrollView setContentOffset:CGPointMake(0, hightOfset) animated:YES];
    [self.scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 600+numberInputText*80+215)];

    return YES;
}
@end
