//
//  CellBoringPicture.h
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoringPictureBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface CellBoringPicture : UITableViewCell

-(void)setData:(BoringPictureBean *) bean;

@end

NS_ASSUME_NONNULL_END
