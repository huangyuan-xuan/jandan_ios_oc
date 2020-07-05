//
//  PictureModel.h
//  jandan
//
//  Created by 代烁 on 2020/7/5.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PictureModel : NSObject
@property(nonatomic,strong,readwrite) NSString *url;
@property(nonatomic,strong,readwrite) NSNumber * height;
@property(nonatomic,strong,readwrite) NSNumber *width;


-(instancetype) fromUrl:(NSString *) url;
@end

NS_ASSUME_NONNULL_END
