//
//  CustomFields.h
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomFields : NSObject
@property(nonatomic) NSArray * thumbC;

-(instancetype) fromDictionary:(NSDictionary *) jsonDic;
@end

NS_ASSUME_NONNULL_END
