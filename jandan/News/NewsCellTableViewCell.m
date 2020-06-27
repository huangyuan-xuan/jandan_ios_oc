//
//  NewsCellTableViewCell.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsCellTableViewCell.h"

#import "NewsBean.h"
@interface NewsCellTableViewCell()

@property(nonatomic,strong,readwrite) UILabel *title;

@end


@implementation NewsCellTableViewCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        [self.contentView addSubview:({
            _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 100)];
            _title.adjustsFontSizeToFitWidth = YES;
            _title.numberOfLines = 2;
            
            _title;
            
            
        })];
    }
    
    return self;
}

-(void)setData:(NewsBean *) bean{
    
    self.title.text = bean.title;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
    

@end
