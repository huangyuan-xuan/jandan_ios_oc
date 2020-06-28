//
//  BoringPictureListModel.h
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoringPictureBean.h"
NS_ASSUME_NONNULL_BEGIN

@interface BoringPictureListModel : NSObject
@property(nonatomic,copy) NSString * status;
@property(nonatomic,readwrite) int * currentPage;
@property(nonatomic,readwrite) int * totalComments;
@property(nonatomic,readwrite) int * pageCount;
@property(nonatomic,readwrite) int * count;
@property(nonatomic,copy) NSArray<BoringPictureBean *> *comments;


-(instancetype) fromJsonDict:(NSDictionary *) dict;
@end

NS_ASSUME_NONNULL_END
