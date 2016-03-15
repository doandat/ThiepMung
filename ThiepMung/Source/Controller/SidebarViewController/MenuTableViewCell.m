//
//  MenuTableViewCell.h
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright © 2016 Ominext. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "MacroUtilities.h"

@implementation MenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.viewSpace setBackgroundColor:MU_RGBA(108, 64, 184, 0.9)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
