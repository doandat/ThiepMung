//
//  MenuTableViewCell.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright © 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageDes;
@property (weak, nonatomic) IBOutlet UIView *viewSpace;

@end
