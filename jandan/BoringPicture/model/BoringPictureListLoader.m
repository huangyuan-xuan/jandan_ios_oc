//
//  BoringPictureListLoader.m
//  jandan
//
//  Created by huangyuan on 2020/6/28.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureListLoader.h"
#import <AFNetworking.h>
#import "BoringPictureBean.h"
#import "BoringPictureListModel.h"
@implementation BoringPictureListLoader


-(void) loadBoringPictureListWithBlock:(LoadBoringPictureList)block{
    
    NSString * url = @"https://i.jandan.net/?oxwlxojflwblxbsapi=jandan.get_pic_comments&page=1";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取无聊图列表返回");
      
        
        NSError *error;
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        
        BoringPictureListModel *model = [[BoringPictureListModel alloc]fromJsonDict:jsonDict];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            block([model.status isEqualToString:@"ok"],model.comments);
            
        });

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       dispatch_async(dispatch_get_main_queue(), ^{
            
            block(NO,nil);
            
       });
    }];
    
    
}

@end
