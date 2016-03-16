//
//  HomeCellFirstViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeCellFirstViewController.h"
#import "ViewShowImageController.h"

@interface HomeCellFirstViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>{
    UIView *viewTitle;
    UILabel *lbTitle;
    NSInteger indexPendingView;
    NSArray *arrTitleFake;
    
}

@end

@implementation HomeCellFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad HomeCellFirstViewController");
    

}
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear HomeCellFirstViewController");
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.viewContainPage.frame.size.width, self.viewContainPage.frame.size.height)];
    [self.pageController.view setBackgroundColor:[UIColor colorWithRed:180/255.0f green:228/255.0f blue:250/255.0f alpha:1.0f]];
    
    
    ViewShowImageController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [self.viewContainPage addSubview:[self.pageController view]];
    NSLog(@"viewContainPage:%lu",(unsigned long)_viewContainPage.subviews.count);
    [self.pageController didMoveToParentViewController:self];
    
    viewTitle = [[UIView alloc]initWithFrame:CGRectMake(0, self.viewContainPage.frame.size.height-60, 200, 30)];
    
    [viewTitle setBackgroundColor:[UIColor colorWithRed:176/255.0f green:150/255.0f blue:217/255.0f alpha:1.0f]];
    
    viewTitle.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|
                                  UIViewAutoresizingFlexibleHeight);
    lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, viewTitle.frame.size.width-10, viewTitle.frame.size.height)];
    [lbTitle setText:@"Khung anh phong thuy"];
    lbTitle.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|
                                UIViewAutoresizingFlexibleHeight);
    [viewTitle addSubview:lbTitle];
    
    [self.viewContainPage addSubview:viewTitle];
    
    self.pageControl.numberOfPages = 5;
    [self.viewContainPage bringSubviewToFront:self.pageControl];
    arrTitleFake = [NSArray arrayWithObjects:@"Khung ảnh phong thuỷ",@"KHung ảnh sinh nhật màu hồng",@"Cover facebook",@"Khung ảnh giọt nước",@"Khung ảnh điện thoại", nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ViewShowImageController *)viewControllerAtIndex:(NSInteger)index {
    NSLog(@"viewControllerAtIndex");
    if (index<0) {
        return nil;
    }
    if (index>=5) {
        return nil;
    }
    
    // Assuming you have SomePageViewController.xib
    ViewShowImageController *newController = [[ViewShowImageController alloc] initWithNibName:@"ViewShowImageController" bundle:nil];
    newController.index = index;
    newController.dEffect = [_arrDataSource objectAtIndex:index];
//    newController.date = [Helper calculateDateFromDate:currentDay offset:index-3];
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
        [lbTitle setText:[arrTitleFake objectAtIndex:indexPendingView]];
        [_lbDesciption setText:[arrTitleFake objectAtIndex:indexPendingView]];
    }
    
}

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    // The number of items reflected in the page indicator.
//    return 5;
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    // The selected item reflected in the page indicator.
//    return 0;
//}
@end
