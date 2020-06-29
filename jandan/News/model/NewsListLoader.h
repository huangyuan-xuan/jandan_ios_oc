//
//  NewsListLoader.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsBean;
NS_ASSUME_NONNULL_BEGIN

typedef void(^NewsListLoaderFinishBlock)(BOOL success, NSArray<NewsBean *> * _Nullable dataArray);


@interface NewsListLoader : NSObject
-(void) loadNewsListDataWithFinishBlock:(NewsListLoaderFinishBlock) finishBlock;

@end

NS_ASSUME_NONNULL_END
