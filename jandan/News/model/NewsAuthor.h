//
//  NewsAuthor.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsAuthor : NSObject

@property(nonatomic,readwrite)NSInteger *authorId;
@property(nonatomic,readwrite)NSString *slug;
@property(nonatomic,readwrite)NSString *name;
@property(nonatomic,readwrite)NSString *nickName;


-(instancetype) fromDictionary:(NSDictionary *) jsonDictionary;
@end

NS_ASSUME_NONNULL_END
