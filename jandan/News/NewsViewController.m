//
//  NewsViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
#import "NewsBean.h"
#import "NewsListLoader.h"
#import "NewsCellTableViewCell.h"
#import "NewsDetailViewController.h"
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray<NewsBean *> *dataArray;
@property(nonatomic,strong,readwrite) NewsListLoader *listLoader;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.listLoader = [[NewsListLoader alloc]init];
    __weak typeof (self)wself = self;
    [self.listLoader loadNewsListDataWithFinishBlock:^(BOOL success, NSArray<NewsBean *> * _Nonnull dataArray) {
        
        __strong typeof (wself) strongSelf = wself;
        if(success){
            strongSelf.dataArray = dataArray;
            [strongSelf.tableView reloadData];
        }else{
            
        }
    }];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    NewsCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[NewsCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    [ cell setData: [self.dataArray objectAtIndex:indexPath.row ] ];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc]init];
    detailViewController.url = [self.dataArray objectAtIndex:indexPath.row].url;
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden =NO;
}



-(void) pushToOther{
        NewsDetailViewController * detail = [[NewsDetailViewController alloc]init];
    
        
    
        [self.navigationController pushViewController:detail animated:YES];
    
    
    
}

@end
