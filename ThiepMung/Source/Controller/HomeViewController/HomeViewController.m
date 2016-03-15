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
#import "SubCategoryViewController.h"
#import "ActivityIndicatorViewController.h"
#import "RootViewController.h"

@interface HomeViewController (){
    NSMutableArray *arrDataSource;
    NSMutableArray *arrDCategory;
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
    arrDataSource = [[NSMutableArray alloc]init];
    arrDCategory = [[NSMutableArray alloc]init];
    ActivityIndicatorViewController *activityVC = [[ActivityIndicatorViewController alloc]initWithNibName:@"ActivityIndicatorViewController" bundle:nil];
    
    [Helper showViewController:activityVC inViewController:[RootViewController sharedInstance] withSize:CGSizeMake(80, 80)];
    
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
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [self.collectionView reloadItemsAtIndexPaths:[self.collectionView indexPathsForVisibleItems]];
            [Helper removeDialogViewController:[RootViewController sharedInstance]];
            [self.tableView reloadData];
        });
    });
    
    
    
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
        return [UIScreen mainScreen].bounds.size.width*2/3+50;
    }else{
        return 170;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)btnTitle:(id)sender{
    SubCategoryViewController *subCategoryVC = [[SubCategoryViewController alloc]initWithNibName:@"SubCategoryViewController" bundle:nil];
    subCategoryVC.stringTitle = [[arrDCategory objectAtIndex:[sender tag]-4000] dCategory_name];
    subCategoryVC.arrDataSource = [arrDataSource objectAtIndex:[sender tag]-4000];
    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:subCategoryVC];
    [self presentViewController:navigationVC animated:YES completion:nil];
}

#pragma mark implement protocol
- (void)presentVC:(UIViewController *)VC{
    [self presentViewController:VC animated:YES completion:nil];
}



@end
