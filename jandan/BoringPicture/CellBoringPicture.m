//
//  CellBoringPicture.m
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "CellBoringPicture.h"
#import <SDWebImage.h>

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
    
    
    NSURL *imageUrl = [NSURL URLWithString: [bean.pics firstObject]];
    
    
    [_contentImageView sd_setImageWithURL: imageUrl];
    
    
    
    
    [NSLayoutConstraint activateConstraints: @[
        
        [NSLayoutConstraint constraintWithItem: _authorLabel
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem: _authorLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1
                                      constant:0],
        
        
        
        [NSLayoutConstraint constraintWithItem: _timeLabel
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem: _timeLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_authorLabel
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:0],
        
        [NSLayoutConstraint constraintWithItem: _contentLabel
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem: _contentLabel
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_timeLabel
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:0],
        

        [NSLayoutConstraint constraintWithItem:_contentImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1 constant:0],
        
        [NSLayoutConstraint constraintWithItem:_contentImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        
    
        [NSLayoutConstraint constraintWithItem:_positiveVoteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_positiveVoteLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0],
        [NSLayoutConstraint constraintWithItem:_positiveVoteLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
         [NSLayoutConstraint constraintWithItem:_positiveVoteLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        
        
        
        [NSLayoutConstraint constraintWithItem:_negativeVoteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_negativeVoteLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
         [NSLayoutConstraint constraintWithItem:_negativeVoteLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0],
         [NSLayoutConstraint constraintWithItem:_negativeVoteLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_positiveVoteLabel attribute:NSLayoutAttributeRight multiplier:1 constant:0],
        
        [NSLayoutConstraint constraintWithItem:_commentCountLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
         [NSLayoutConstraint constraintWithItem:_commentCountLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0],
        [NSLayoutConstraint constraintWithItem:_commentCountLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_negativeVoteLabel attribute:NSLayoutAttributeRight multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_commentCountLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        
        
        
         [NSLayoutConstraint constraintWithItem:_moreFunctionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_moreFunctionLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0],
        [NSLayoutConstraint constraintWithItem:_moreFunctionLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:_moreFunctionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
        
        
    ]];
    
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
