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
    NSArray *arrDCategory;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
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
    arrDCategory = [AppService getDCategoryFromUrlString:URL_GET_CATEGORY];
    for (DCategory *dCategory in arrDCategory) {
        NSLog(@"dCategory:%@:%@",dCategory.dCategory_name,dCategory.dCategory_id);
    }
    
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
    return arrDCategory.count;
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
        DCategory *dCategory1 = [arrDCategory objectAtIndex:indexPath.row];
        HomeTableViewCellSecond *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCellSecondIdentifier"];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCellSecond" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        [cell.btnTitle setTitle:dCategory1.dCategory_name forState:UIControlStateNormal];
//        cell.dCategory = dCategory1;
        NSLog(@"cell.dCategory:%@",cell.dCategory);
        cell.collectionItemVC.delegate = self;
        cell.collectionItemVC.dCategory = dCategory1;
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

#pragma mark implement protocol
- (void)presentVC:(UIViewController *)VC{
    [self presentViewController:VC animated:YES completion:nil];
}

@end
