//
//  NewsAuthor.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsAuthor.h"

@implementation NewsAuthor



-(instancetype) fromDictionary:(NSDictionary *)jsonDictionary{
    
    
    if(self){
        self.authorId = [[jsonDictionary objectForKey:@"id"]integerValue];
        self.name = [jsonDictionary objectForKey:@"name"];
        self.slug = [jsonDictionary objectForKey:@"slug"];
        self.nickName = [jsonDictionary objectForKey:@"nickname"];
    }
    
    
    return self;
    
    
}


@end
