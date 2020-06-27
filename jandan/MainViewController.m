//
//  MainViewController.m
//  jandan
//
//  Created by huangyuan on 2020/6/27.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    
    scrollView.pagingEnabled = YES;
    
    
    
    [self.view addSubview: scrollView];
    
}


@end
