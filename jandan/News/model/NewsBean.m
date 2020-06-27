//
//  NewsBean.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsBean.h"

@implementation NewsBean



-(instancetype) fromDictionary:(NSDictionary *)jsonDictionary{
     if(self){
            self.idNumber = [[jsonDictionary objectForKey:@"id"]integerValue] ;
            self.title = [jsonDictionary objectForKey:@"title"];
            
            self.excerpt = [jsonDictionary objectForKey:@"excerpt"];
            self.url = [jsonDictionary objectForKey:@"url"];
            self.date = [jsonDictionary objectForKey:@"date"];
            self.commentCount = [jsonDictionary objectForKey:@"comment_count"];
            
            self.newsAthor = [[NewsAuthor alloc]fromDictionary:[jsonDictionary objectForKey:@"author"]];
            self.customFields = [[CustomFields alloc]fromDictionary: [jsonDictionary objectForKey:@"custom_fields"]];
        }
        
        
        return self;
}

@end

