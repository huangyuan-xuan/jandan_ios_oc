//
//  BoringPictureBean.h
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PictureModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BoringPictureBean : NSObject

@property(nonatomic,copy) NSString * commentID;
@property(nonatomic,copy) NSString * commentPostID;
@property(nonatomic,copy) NSString * commentAuther;
@property(nonatomic,copy) NSString * commentDate;
@property(nonatomic,copy) NSString * votePositive;

@property(nonatomic,copy) NSString * voteNegative;
@property(nonatomic,copy) NSString * subCommentCount;
@property(nonatomic,copy) NSString * textContent;
@property(nonatomic,copy) NSArray<PictureModel *> * pictureModels;


-(instancetype) fromJsonDict:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END
