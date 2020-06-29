//
//  NewsCellTableViewCell.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsCellTableViewCell.h"

#import "NewsBean.h"
#import <SDWebImage.h>
#import <Masonry.h>
@interface NewsCellTableViewCell()

@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UIImageView *converImageView;
@property(nonatomic,strong,readwrite) UILabel *authorNameLabel;
@property(nonatomic,strong,readwrite) UILabel * timeLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;

@end


@implementation NewsCellTableViewCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]init];
            self.titleLabel.adjustsFontSizeToFitWidth = YES;
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel;
        })];
        
        
        [self.contentView addSubview:({
            self.converImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
            self.converImageView.translatesAutoresizingMaskIntoConstraints = NO;
            self.converImageView;
            
        })];
        
        [self.contentView addSubview:({
            self.authorNameLabel = [[UILabel alloc]init];
            self.authorNameLabel.adjustsFontSizeToFitWidth = YES;
            self.authorNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.authorNameLabel.font = [UIFont boldSystemFontOfSize:16.0f];
            self.authorNameLabel.textColor = [UIColor grayColor];
            self.authorNameLabel;
            
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc]init];
            self.timeLabel.adjustsFontSizeToFitWidth = YES;
            self.timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.timeLabel.font = [UIFont boldSystemFontOfSize:16.0f];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
            
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc]init];
            self.commentLabel.adjustsFontSizeToFitWidth = YES;
            self.commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            self.commentLabel.font = [UIFont boldSystemFontOfSize:16.0f];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
            
        })];
        
        
        
        
    }
    
    return self;
}

-(void)setData:(NewsBean *) bean{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [dateFormatter setTimeZone:timezone];
    NSDate *postDate = [dateFormatter dateFromString:bean.date];
    [dateFormatter setDateFormat:@"MM-dd"];
    
    self.timeLabel.text = [dateFormatter stringFromDate:postDate];
    
    self.titleLabel.text = bean.title;
    
    self.authorNameLabel.text = bean.newsAthor.nickName;
    self.commentLabel.text= [NSString stringWithFormat:@"%D评论",bean.commentCount];
    
    
    NSString *imageUrlString =[bean.customFields.thumbC objectAtIndex:0];
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    
    
    [self.converImageView sd_setImageWithURL:imageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        NSLog(@"");
        
    }];
    
    
    [_converImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@120);
        make.height.equalTo(@80);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.centerY.equalTo(self.contentView.mas_centerY);

    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView.mas_top).and.offset(10);
        make.left.equalTo(self.contentView.mas_left).and.offset(10);
        make.right.equalTo(_converImageView.mas_left).and.offset(-10);
        
    }];
    
    [_authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).and.offset(10);
        make.bottom.equalTo(_converImageView.mas_bottom);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_authorNameLabel.mas_right).and.offset(10);
        make.bottom.equalTo(_converImageView.mas_bottom);
    }];
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_converImageView.mas_left).and.offset(-10);
        make.bottom.equalTo(_converImageView.mas_bottom);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
