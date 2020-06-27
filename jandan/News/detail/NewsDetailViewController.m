//
//  NewsDetailViewController.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "NewsDetailViewController.h"
#import  <WebKit/WebKit.h>
@interface NewsDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
@property(nonatomic,strong,readwrite) UIProgressView *progressView;
@end

@implementation NewsDetailViewController

- (void)viewDidLoad{
    
    
    [super viewDidLoad];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"返回";
    self.navigationItem.backBarButtonItem = backBtn;    
    
    [self.view addSubview:({
        
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        
        self.webView.navigationDelegate = self;
        self.webView;
        
        
    })];
    [self.view addSubview:({
           
           self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
           
           self.progressView;
       })];
       if(!_url){
           _url =@"https://blog.huangyuanlove.com/";
       }
       
       [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
       
       
       [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
       
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"");
    self.progressView.progress = self.webView.estimatedProgress;
    if(self.webView.estimatedProgress == 1){
        [self.progressView setAlpha:0];
    }
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}



@end
