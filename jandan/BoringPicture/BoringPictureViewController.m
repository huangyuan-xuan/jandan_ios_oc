//
//  BoringPictureViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "BoringPictureViewController.h"
#import <SDWebImage.h>
#import "BoringPictureListLoader.h"
#import "BoringPictureBean.h"
#import "CellBoringPicture.h"
#import <Masonry.h>
@interface BoringPictureViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray<BoringPictureBean *> *dataArray;
@property(nonatomic,strong,readwrite) BoringPictureListLoader *listLoader;
@property(nonatomic,strong,readwrite) UIActivityIndicatorView * loadingView;
@end

@implementation BoringPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 230.0f;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    _loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _loadingView.color = [UIColor redColor];
    [self.view addSubview:_loadingView];
    [_loadingView startAnimating];
    
    [_loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        
    }];
    
    
    self.listLoader = [[BoringPictureListLoader alloc]init];
    __weak typeof (self)wself = self;
    [self.listLoader loadBoringPictureListWithBlock:^(BOOL success, NSArray<BoringPictureBean *> * _Nonnull dataArray) {
        
        __strong typeof (wself) strongSelf = wself;
        if(success){
            strongSelf.dataArray = dataArray;
            [strongSelf.tableView reloadData];
            [strongSelf.loadingView stopAnimating];
        }else{
            
        }
    }];
    
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 230.0f;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  [[[_dataArray objectAtIndex:indexPath.row].pictureModels firstObject].height intValue];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CellBoringPicture * cell = [tableView dequeueReusableCellWithIdentifier:@"CellBoringPicture"];
    if(!cell){
        cell = [[CellBoringPicture alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellBoringPicture"];
    }
    
    [cell setData: [self.dataArray objectAtIndex:indexPath.row ] ];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellBoringPicture *boringPictureCell = (CellBoringPicture *) cell;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
    
    scaleAnimation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [boringPictureCell.layer addAnimation:scaleAnimation forKey:@"transform"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    self.navigationController.navigationBarHidden =NO;
}
@end
