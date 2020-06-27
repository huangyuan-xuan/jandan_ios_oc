
//
//  NewsModel.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsModel.h"


@implementation NewsModel

-(instancetype) fromDictionary:(NSDictionary *)jsonDictionary{
    if(self){
        self.status = [jsonDictionary objectForKey:@"status"];
        self.count = [[jsonDictionary objectForKey:@"count"] integerValue];
        self.countTotal = [[jsonDictionary objectForKey:@"count_total"]integerValue];
        
        NSArray * postsJsonArray = [jsonDictionary objectForKey:@"posts"];
        NSMutableArray * newsBeanArray = [[NSMutableArray alloc]init];
        for(NSDictionary * dict in postsJsonArray){
         [newsBeanArray addObject:   [[NewsBean alloc]fromDictionary:dict]];
        }
        self.posts = newsBeanArray;
        
    }
    return self;
}



@end
