//
//  NewsViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor greenColor];
    
   
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushToOther) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void) pushToOther{
        NewsDetailViewController * detail = [[NewsDetailViewController alloc]init];
    
        
    
        [self.navigationController pushViewController:detail animated:YES];
    
    
    
}

@end
