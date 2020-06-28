//
//  NewsListLoader.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsListLoader.h"
#import "NewsModel.h"
#import <AFNetworking.h>
@implementation NewsListLoader


-(void) loadNewsListDataWithFinishBlock:(NewsListLoaderFinishBlock)finishBlock{
    
    NSString *urlString = @"https://i.jandan.net/?oxwlxojflwblxbsapi=get_recent_posts&include=url,date,tags,author,title,excerpt,comment_count,comment_status,custom_fields&custom_fields=thumb_c,views&dev=1&page=1";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer =[AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取新闻列表成功");
        NSError *jsonError;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&jsonError];
        NewsModel *newsModel = [[NewsModel alloc]fromDictionary:jsonDict];
        NSLog(@"status:%@",newsModel.status);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock([newsModel.status isEqualToString:@"ok"],newsModel.posts);
            }
        });
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取新闻列表失败");
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(NO,nil);
            }
        });
    }];
    
    
}

@end
