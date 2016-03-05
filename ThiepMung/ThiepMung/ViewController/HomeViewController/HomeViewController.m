//
//  HomeViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "HomeTableViewCellFirst.h"
#import "HomeTableViewCellSecond.h"

@interface HomeViewController (){
    NSMutableArray *arrDataSource;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    SWRevealViewController *revealController = [self revealViewController];
    
//    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //custom navigationbar
    [_navigationBar.btnMenu addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar.lbTitle setText:@"Home"];
    [_navigationBar.lbTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    [self.tableView registerClass:[HomeTableViewCellSecond class] forCellReuseIdentifier:@"HomeTableViewCellSecondIdentifier"];
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
//    return [arrDataSource count];
    if (section==0) {
        return 1;
    }else
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        HomeTableViewCellFirst *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCellFirstIdentifier"];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCellFirst" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        [self addChildViewController:cell.homeCellFirstVC];
        [cell.homeCellFirstVC didMoveToParentViewController:self];
//        cell.userInteractionEnabled = NO;
        return cell;
    }else{
        HomeTableViewCellSecond *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCellSecondIdentifier"];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCellSecond" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        [cell.btnTitle setTitle:@"Viet Thu Phap" forState:UIControlStateNormal];
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
        return [UIScreen mainScreen].bounds.size.width*2/3+50;
    }else{
        return 150;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
//    UILabel *lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, self.view.frame.size.width -20, 34)];
//    [lbTitle setText:@"Menu"];
//    [lbTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30]];
//    [lbTitle setTextColor:[UIColor whiteColor]];
//    
//    [viewHeader addSubview:lbTitle];
//    [viewHeader setBackgroundColor:[UIColor colorWithRed:23/255.0f green:137/255.0f blue:206/255.0f alpha:1.0f]];
//    UIView *viewSeparator = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 375, 1)];
//    [viewSeparator setBackgroundColor:[UIColor colorWithRed:27/255.0f green:156/255.0f blue:222/255.0f alpha:1.0f]];
//    [viewHeader addSubview:viewSeparator];
//    
//    return viewHeader;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 45;
//}

@end
