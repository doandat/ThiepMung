//
//  HomeViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "HomeTableViewCellSecond.h"
#import "SubCategoryViewController.h"
#import "ActivityIndicatorViewController.h"
#import "RootViewController.h"
#import "ViewShowImageController.h"
#import "BookMarkViewController.h"

@interface HomeViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>{
    NSMutableArray *arrDataSource;
    NSMutableArray *arrDCategory;
    NSMutableArray *arrDataHot;
    NSInteger indexPendingView;
}
@property (strong, nonatomic) IBOutlet UIView *homeCellFirst;
@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic) IBOutlet UIView *viewContainPage;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *lbDesciption;
@property (weak, nonatomic) IBOutlet UIView *viewTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@end

@implementation HomeViewController
static HomeViewController *sharedInstance;

+(HomeViewController*)sharedInstance {
    if (sharedInstance) {
        return sharedInstance;
    }
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    sharedInstance = self;

    [self.navigationController setNavigationBarHidden:YES];
    SWRevealViewController *revealController = [self revealViewController];
    
//    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //custom navigationbar
    [_navigationBar.btnMenu addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar.lbTitle setText:@"Home"];
    [_navigationBar.lbTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [_navigationBar.btnBookMark addTarget:self action:@selector(btnBookMark:) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar.btnReload addTarget:self action:@selector(btnReload:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self.tableView registerClass:[HomeTableViewCellSecond class] forCellReuseIdentifier:@"HomeTableViewCellSecondIdentifier"];
    arrDataSource = [[NSMutableArray alloc]init];
    arrDCategory = [[NSMutableArray alloc]init];
    arrDataHot = [[NSMutableArray alloc]init];
    
    ActivityIndicatorViewController *activityVC = [[ActivityIndicatorViewController alloc]initWithNibName:@"ActivityIndicatorViewController" bundle:nil];
    
    [Helper showViewController:activityVC inViewController:[RootViewController sharedInstance] withSize:CGSizeMake(80, 80)];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.viewContainPage.frame.size.width, self.viewContainPage.frame.size.height)];
//    [self.pageController.view setBackgroundColor:[UIColor colorWithRed:180/255.0f green:228/255.0f blue:250/255.0f alpha:1.0f]];
    
    
//    ViewShowImageController *initialViewController = [self viewControllerAtIndex:0];
//    
//    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
//    
//    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [self.viewContainPage addSubview:[self.pageController view]];
    NSLog(@"viewContainPage:%lu",(unsigned long)_viewContainPage.subviews.count);
    [self.pageController didMoveToParentViewController:self];
    
    
    [_viewTitle setBackgroundColor:[UIColor colorWithRed:176/255.0f green:150/255.0f blue:217/255.0f alpha:1.0f]];
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        arrDCategory =[NSMutableArray arrayWithArray:[AppService getDCategoryFromUrlString:URL_GET_CATEGORY]];
        for (int k = 0; k<arrDCategory.count; k++) {
            DCategory *dCategory = [arrDCategory objectAtIndex:k];
            NSLog(@"dCategory:%@:%@",dCategory.dCategory_name,dCategory.dCategory_id);
            NSArray *arrDataTmp =[AppService getEffectListWithCategoryId:dCategory.dCategory_id];
            if (arrDataTmp.count) {
                [arrDataSource addObject:arrDataTmp];
            }else{
                //            [arrDCategory removeObjectAtIndex:k];
            }
            
        }
        
        NSLog(@"aaa:%tu",arrDataSource.count);
        
        arrDataHot =[NSMutableArray arrayWithArray:[AppService getEffectListHot]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [self.collectionView reloadItemsAtIndexPaths:[self.collectionView indexPathsForVisibleItems]];
            [Helper removeDialogViewController:[RootViewController sharedInstance]];
            ViewShowImageController *initialViewController = [self viewControllerAtIndex:0];
            
            NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
            [_lbDesciption setText:[(DEffect *)[arrDataHot objectAtIndex:indexPendingView] effectDescription]];
            [_lbTitle setText:[(DEffect *)[arrDataHot objectAtIndex:indexPendingView] label]];
            [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
            self.pageControl.numberOfPages = arrDataHot.count;
            [self.viewContainPage bringSubviewToFront:self.pageControl];
            [self.viewContainPage bringSubviewToFront:self.viewTitle];

            [self.tableView reloadData];
        });
    });    
    
}

-(void)btnBookMark:(id)sender{
    BookMarkViewController *bookMarkVC = [[BookMarkViewController alloc]initWithNibName:@"BookMarkViewController" bundle:nil];
    [self.navigationController pushViewController:bookMarkVC animated:YES];
}
-(void)btnReload:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else
    return arrDataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *simpleTableIdentifier = @"SimpleTableItem";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        [self.homeCellFirst setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*2/3+60)];
        [cell addSubview:self.homeCellFirst];
        
        return cell;
    }else{
        DCategory *dCategory1 = [arrDCategory objectAtIndex:indexPath.row];
        HomeTableViewCellSecond *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCellSecondIdentifier"];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCellSecond" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        [cell.btnTitle setTitle:dCategory1.dCategory_name forState:UIControlStateNormal];
        [cell.btnTitle setTitleColor:MU_RGB(108, 64, 184) forState:UIControlStateNormal];
        cell.dCategory = dCategory1;
        cell.arrDataSource = [arrDataSource objectAtIndex:indexPath.row];
        NSLog(@"cell.dCategory:%@",cell.dCategory);
        cell.delegate = self;
        cell.btnTitle.tag = 4000+indexPath.row;
        [cell.btnTitle addTarget:self action:@selector(btnTitle:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // rows in section 0 should not be selectable
    if ( indexPath.section == 0 ) return nil;
    
    return indexPath;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return [UIScreen mainScreen].bounds.size.width*2/3+60;
    }else{
        return 170.0f;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        NSLog(@"didSelectRowAtIndexPath");
    }
}

- (void)btnTitle:(id)sender{
    SubCategoryViewController *subCategoryVC = [[SubCategoryViewController alloc]initWithNibName:@"SubCategoryViewController" bundle:nil];
    subCategoryVC.stringTitle = [[arrDCategory objectAtIndex:[sender tag]-4000] dCategory_name];
    subCategoryVC.arrDataSource = [arrDataSource objectAtIndex:[sender tag]-4000];
//    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:subCategoryVC];
    [self.navigationController pushViewController:subCategoryVC animated:YES];
}

#pragma mark implement protocol
- (void)presentVC:(UIViewController *)VC{
    [self presentViewController:VC animated:YES completion:nil];
}


#pragma mark pageviewDelegate
- (ViewShowImageController *)viewControllerAtIndex:(NSInteger)index {
    NSLog(@"viewControllerAtIndex");
    if (index<0) {
        return nil;
    }
    if (index>=arrDataHot.count) {
        return nil;
    }
    
    // Assuming you have SomePageViewController.xib
    ViewShowImageController *newController = [[ViewShowImageController alloc] initWithNibName:@"ViewShowImageController" bundle:nil];
    newController.index = index;
    newController.dEffect = [arrDataHot objectAtIndex:index];
    //    newController.date = [Helper calculateDateFromDate:currentDay offset:index-3];
    [newController.btnFull setBackgroundColor:MU_RGBA(0, 0, 0, 0.9)];
//    [self.viewContainPage bringSubviewToFront:self.btnFull];

    NSLog(@"viewControllerAtIndex:%i---%@",index,newController);
    return newController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSLog(@"viewControllerBeforeViewController");
    
    ViewShowImageController *p = (ViewShowImageController *)viewController;
    return [self viewControllerAtIndex:(p.index - 1)];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSLog(@"viewControllerAfterViewController");
    ViewShowImageController *p = (ViewShowImageController *)viewController;
    return [self viewControllerAtIndex:(p.index + 1)];
    
}


- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
    //    NSLog(@"pendingViewControllers:%ld",(long)[(DailyViewController *)[pendingViewControllers lastObject] index]);
    indexPendingView = [(ViewShowImageController *)[pendingViewControllers lastObject] index];
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed) {
        [self.pageControl setCurrentPage:indexPendingView];
        [_lbTitle setText:[(DEffect *)[arrDataHot objectAtIndex:indexPendingView] label]];
        [_lbDesciption setText:[(DEffect *)[arrDataHot objectAtIndex:indexPendingView] effectDescription]];
    }
    
}

@end
