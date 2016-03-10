//
//  AddTextViewController.m
//  ThiepMung
//
//  Created by DatDV on 3/7/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddTextViewController.h"
#import "AddTextTableViewCell.h"

@interface AddTextViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation AddTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"AddTextTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddTextTableViewCellIdentifier"];
    self.tableView.allowsSelection = NO;
//    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
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
    return _numberInputText;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AddTextTableViewCellIdentifier";
    AddTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AddTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.lbMessage.text = [NSString stringWithFormat:@"Thông điệp %tu:",indexPath.row+1];
//    NSLog(@"cell:%@",cell);

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75.0f;
}

@end
