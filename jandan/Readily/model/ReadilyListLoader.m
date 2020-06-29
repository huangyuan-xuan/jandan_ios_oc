//
//  ReadilyListLoader.m
//  jandan
//
//  Created by huangyuan on 2020/6/29.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "ReadilyListLoader.h"
#import "BoringPictureBean.h"
#import "BoringPictureListModel.h"
#import <AFNetworking.h>
@implementation ReadilyListLoader


-(void) loadReadilyListWithFinishBlock:(LoadReadilyList)block{
    
    NSString *url = @"http://i.jandan.net/?oxwlxojflwblxbsapi=jandan.get_ooxx_comments";
    
 AFHTTPSessionManager *manager =   [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取随手拍列表成功");
        
        NSError *error;
        
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        
        BoringPictureListModel *model = [[BoringPictureListModel alloc]fromJsonDict:resultDict];
        dispatch_async(dispatch_get_main_queue(), ^{
            block([model.status isEqualToString:@"ok"],model.comments );
        });
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取随手拍列表失败");
        dispatch_async(dispatch_get_main_queue(), ^{
            block(NO,nil);
        });
    }];
    
    
    
}


@end
