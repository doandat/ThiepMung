//
//  SidebarViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "SidebarViewController.h"
#import "MenuTableViewCell.h"
#import "AboutViewController.h"

@interface SidebarViewController (){
    NSArray *arrMenu;
    NSArray *arrIconMenu;
}

@end

@implementation SidebarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    arrMenu = [NSArray arrayWithObjects: @"QStore.vn",@"Đánh giá ứng dụng",@"Thông tin",nil];
    arrIconMenu = [NSArray arrayWithObjects:@"icon1.png",@"icon_2.png",@"icon_3.png",nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuTableViewCellIdentifier"];
    [self.tableView reloadData];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrMenu count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MenuTableViewCellIdentifier";
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.lbTitle.text = [arrMenu objectAtIndex:indexPath.row];
    [cell.imageDes setImage:[UIImage imageNamed:[arrIconMenu objectAtIndex:indexPath.row]]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==2) {
        AboutViewController *infoVC = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
        [self presentViewController:infoVC animated:YES completion:nil];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    UILabel *lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(25, 5, self.view.frame.size.width -20, 34)];
    [lbTitle setText:@"Menu"];
    [lbTitle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30]];
    [lbTitle setTextColor:[UIColor whiteColor]];
    
    [viewHeader addSubview:lbTitle];
    [viewHeader setBackgroundColor:[UIColor colorWithRed:108/255.0f green:46/255.0f blue:184/255.0f alpha:1.0f]];
    UIView *viewSeparator = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 375, 1)];
    [viewSeparator setBackgroundColor:[UIColor colorWithRed:27/255.0f green:156/255.0f blue:222/255.0f alpha:1.0f]];
    [viewHeader addSubview:viewSeparator];
    
    return viewHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}


@end
