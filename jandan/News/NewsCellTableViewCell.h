//
//  NewsCellTableViewCell.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsBean.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsCellTableViewCell : UITableViewCell
-(void)setData:(NewsBean *) bean;
@end

NS_ASSUME_NONNULL_END
