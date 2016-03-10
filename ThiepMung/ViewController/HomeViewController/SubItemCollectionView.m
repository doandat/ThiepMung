//
//  SubItemCollectionView.m
//  ThiepMung
//
//  Created by DatDV on 3/3/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "SubItemCollectionView.h"

@interface SubItemCollectionView()

@end

@implementation SubItemCollectionView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super initWithCoder:aDecoder]) {
        [self load];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"SubItemCollectionView" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
}
@end
