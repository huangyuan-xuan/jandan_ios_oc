//
//  CellReadily.m
//  jandan
//
//  Created by huangyuan on 2020/6/29.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "CellReadily.h"

@interface CellReadily()

@property(nonatomic,strong,readwrite) UILabel *author;


@end

@implementation CellReadily

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
