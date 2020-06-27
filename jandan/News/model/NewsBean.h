//
//  NewsBean.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsAuthor.h"
#import "CustomFields.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsBean : NSObject
@property(nonatomic) NSInteger idNumber;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *excerpt;
@property(nonatomic,copy) NSString *date;
@property(nonatomic) NSInteger *commentCount;
@property(nonatomic,copy) NSString *commentStatus;
@property(nonatomic) NewsAuthor *newsAthor;
@property(nonatomic) CustomFields * customFields;


-(instancetype) fromDictionary: (NSDictionary *) jsonDictionary;
@end

NS_ASSUME_NONNULL_END
