//
//  NewsModel.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsBean.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject
@property(nonatomic) NSString *status;
@property(nonatomic) NSInteger count;
@property(nonatomic) NSArray<NewsBean *> *posts;
@property(nonatomic) NSInteger countTotal;

-(instancetype) fromDictionary:(NSDictionary *)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
