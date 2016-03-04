//
//  HomeCellFirstViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/4/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeCellFirstViewController.h"
#import "ViewShowImageController.h"

@interface HomeCellFirstViewController ()

@end

@implementation HomeCellFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad HomeCellFirstViewController");
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

    UIView *viewTitle = [[UIView alloc]initWithFrame:CGRectMake(0, self.viewContainPage.frame.size.height-55, 200, 35)];
    [viewTitle setBackgroundColor:[UIColor yellowColor]];
    viewTitle.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|
                                             UIViewAutoresizingFlexibleHeight);

    [self.viewContainPage addSubview:viewTitle];

    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear HomeCellFirstViewController");

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ViewShowImageController *)viewControllerAtIndex:(NSInteger)index {
    NSLog(@"viewControllerAtIndex");
//    if (index<0) {
//        return nil;
//    }
//    if (index>=5) {
//        return nil;
//    }
    
    // Assuming you have SomePageViewController.xib
    ViewShowImageController *newController = [[ViewShowImageController alloc] initWithNibName:@"ViewShowImageController" bundle:nil];
    newController.index = index;
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
//    indexPendingView = [(ViewShowImageController *)[pendingViewControllers lastObject] index];
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed) {
//        if (indexPendingView<[(DailyViewController *)[previousViewControllers objectAtIndex:0] index]) {
//            [viewTabHeader setThreeLabelDay:currentDay offset:--indexDayInArr-3];
//        }else if(indexPendingView > [(DailyViewController *)[previousViewControllers objectAtIndex:0] index]){
//            [viewTabHeader setThreeLabelDay:currentDay offset:++indexDayInArr-3];
//        }
    }
    
}

// MAX_PAGES is the total # of pages.

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}
@end
