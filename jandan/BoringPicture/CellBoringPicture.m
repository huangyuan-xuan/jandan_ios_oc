//
//  CellBoringPicture.m
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "CellBoringPicture.h"
#import <SDWebImage.h>
#import <Masonry.h>
@interface CellBoringPicture()

@property(nonatomic,strong,readwrite) UILabel *authorLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;
@property(nonatomic,strong,readwrite) UILabel *contentLabel;
@property(nonatomic,strong,readwrite) UILabel *positiveVoteLabel;
@property(nonatomic,strong,readwrite) UILabel *negativeVoteLabel;
@property(nonatomic,strong,readwrite) UILabel *commentCountLabel;
@property(nonatomic,strong,readwrite) UIImageView *moreFunctionLabel;
@property(nonatomic,strong,readwrite) UIImageView * contentImageView;
@end

@implementation CellBoringPicture


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    [self.contentView addSubview:({
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.adjustsFontSizeToFitWidth = YES;
        _authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _authorLabel;
    })];
    
    [self.contentView addSubview:({
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.adjustsFontSizeToFitWidth = YES;
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _timeLabel;
    })];
    [self.contentView addSubview:({
        _contentLabel  = [[UILabel alloc]init];
        _contentLabel.adjustsFontSizeToFitWidth = YES;
        _contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _contentLabel;
    })];
    
    [self.contentView addSubview:({
        _positiveVoteLabel  = [[UILabel alloc]init];
        _positiveVoteLabel.adjustsFontSizeToFitWidth = YES;
        _positiveVoteLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _positiveVoteLabel;
    })];
    [self.contentView addSubview:({
        _negativeVoteLabel  = [[UILabel alloc]init];
        _negativeVoteLabel.adjustsFontSizeToFitWidth = YES;
        _negativeVoteLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _negativeVoteLabel;
    })];
    
    [self.contentView addSubview:({
        _commentCountLabel  = [[UILabel alloc]init];
        _commentCountLabel.adjustsFontSizeToFitWidth = YES;
        _commentCountLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _commentCountLabel;
    })];
    
    [self.contentView addSubview:({
        _moreFunctionLabel  = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"icDotsHorizontal"]];
        _moreFunctionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _moreFunctionLabel.contentMode = UIViewContentModeScaleAspectFit;
        _moreFunctionLabel;
    })];
    
    [self.contentView addSubview:({
        _contentImageView  = [[UIImageView alloc]initWithFrame:CGRectZero];
        _contentImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentImageView.contentMode = UIViewContentModeScaleAspectFit;
        _contentImageView;
        
    })];
    
    
    
    return self;
}


- (void)setData:(BoringPictureBean *)bean{
    _authorLabel.text = bean.commentAuther;
    _timeLabel.text  = bean.commentDate;
    _contentLabel.text = bean.textContent;
    
    
    _positiveVoteLabel.text = [@"oo" stringByAppendingString:bean.votePositive];
    _negativeVoteLabel.text = [@"xx"stringByAppendingString:bean.voteNegative];
    _commentCountLabel.text = [@"吐槽" stringByAppendingString:bean.subCommentCount];
    
    
    NSURL *imageUrl = [NSURL URLWithString: [bean.pictureModels firstObject].url];
    
    
    [_contentImageView sd_setImageWithURL: imageUrl];
    
    
    
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.width.equalTo(self.contentView);
        
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authorLabel.mas_bottom);
        make.width.equalTo(self.contentView);
        
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom);
        make.width.equalTo(self.contentView);
        
    }];
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentLabel.mas_bottom);
        make.width.equalTo(self.contentView);
        
    }];
    
    
    NSMutableArray *functionViews = [NSMutableArray array];
    [functionViews addObject:_positiveVoteLabel];
     [functionViews addObject:_negativeVoteLabel];
     [functionViews addObject:_commentCountLabel];
     [functionViews addObject:_moreFunctionLabel];
    
    [functionViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [functionViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentImageView.mas_bottom);
        make.bottom.equalTo(self.contentView);
    }];
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
