//
//  BoringPictureViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureViewController.h"

@interface BoringPictureViewController ()

@end

@implementation BoringPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor blueColor];
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
