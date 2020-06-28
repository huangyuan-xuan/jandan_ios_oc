//
//  BoringPictureListLoader.h
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoringPictureBean.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^LoadBoringPictureList)(BOOL success,NSArray<BoringPictureBean *> * date);
@interface BoringPictureListLoader : NSObject

-(void) loadBoringPictureListWithBlock:(LoadBoringPictureList) block;
@end

NS_ASSUME_NONNULL_END
