//
//  BoringPictureViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureViewController.h"
#import <SDWebImage.h>
@interface BoringPictureViewController ()

@end

@implementation BoringPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:({
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
        [imageView sd_setImageWithURL:@"http://img.jandan.net/news/2019/03/32b1db99c0db99b5be9fa93bc6757d95.jpg" completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"");
        }];
        
        imageView;
        
    })];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden =NO;
}
@end
