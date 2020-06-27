//
//  CustomFields.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "CustomFields.h"

@implementation CustomFields



-(instancetype)fromDictionary:(NSDictionary *)jsonDictionary{
    if (self) {
           self.thumbC = [jsonDictionary objectForKey:@"thumb_c"];
           
       }
       return self;
}

@end
