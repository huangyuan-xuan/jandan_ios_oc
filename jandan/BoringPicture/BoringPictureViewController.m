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
@interface BoringPictureViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray<BoringPictureBean *> *dataArray;
@property(nonatomic,strong,readwrite) BoringPictureListLoader *listLoader;
@end

@implementation BoringPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 230.0f;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:_tableView];
    
    
    self.listLoader = [[BoringPictureListLoader alloc]init];
    __weak typeof (self)wself = self;
    [self.listLoader loadBoringPictureListWithBlock:^(BOOL success, NSArray<BoringPictureBean *> * _Nonnull dataArray) {
        
        __strong typeof (wself) strongSelf = wself;
        if(success){
            strongSelf.dataArray = dataArray;
            [strongSelf.tableView reloadData];
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



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    self.navigationController.navigationBarHidden =NO;
}
@end
