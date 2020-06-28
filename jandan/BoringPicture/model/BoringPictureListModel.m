//
//  BoringPictureListModel.m
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureListModel.h"

@implementation BoringPictureListModel


- (instancetype)fromJsonDict:(NSDictionary *)dict{
    
    if(self){
        self.count = [[dict objectForKey:@"count"]intValue];
        self.currentPage = [[dict objectForKey:@"current_page"]intValue];
        self.totalComments = [[dict objectForKey:@"total_comments"]intValue];
        self.status = [dict objectForKey:@"status"];
        self.pageCount = [[dict objectForKey:@"page_count"]intValue];
        
        
        
        
        NSArray * postsJsonArray = [dict objectForKey:@"comments"];
        NSMutableArray * boringPictureArray = [[NSMutableArray alloc]init];
        for(NSDictionary * dict in postsJsonArray){
            [boringPictureArray addObject: [[BoringPictureBean alloc]fromJsonDict:dict]];
        }
        self.comments = boringPictureArray;
        
        
    }
    return self;
    
    
}

@end
