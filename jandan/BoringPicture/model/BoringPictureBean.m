//
//  BoringPictureBean.m
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureBean.h"

@implementation BoringPictureBean


- (instancetype)fromJsonDict:(NSDictionary *)dict{
    
    if(self){
        self.commentID = [dict objectForKey:@"comment_ID"];
        self.commentPostID = [dict objectForKey:@"comment_post_ID"];
        self.commentDate = [dict objectForKey:@"comment_date"];
        self.commentAuther = [dict objectForKey:@"comment_author"];
        self.voteNegative = [dict objectForKey:@"vote_negative"];
        self.votePositive = [dict objectForKey:@"vote_positive"];
        self.textContent = [dict objectForKey:@"text_content"];
        self.subCommentCount = [dict objectForKey:@"sub_comment_count"];
        
        
        NSMutableArray<PictureModel *> *array = [[NSMutableArray alloc]init];
        for(NSString *url in  [dict objectForKey:@"pics"]){
            PictureModel *pic = [[PictureModel alloc] fromUrl:url];
            [array addObject:pic];
        }
        
        self.pictureModels  = array;
        
        
    }
    return self;
    
}

@end
