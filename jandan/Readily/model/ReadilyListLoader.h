//
//  ReadilyListLoader.h
//  jandan
//
//  Created by huangyuan on 2020/6/29.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoringPictureBean.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^LoadReadilyList)(BOOL success, NSArray<BoringPictureBean *> * _Nullable dataArray);

@interface ReadilyListLoader : NSObject

-(void) loadReadilyListWithFinishBlock:(LoadReadilyList) block;

@end

NS_ASSUME_NONNULL_END
