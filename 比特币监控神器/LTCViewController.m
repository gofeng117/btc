//
//  LTCViewController.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-1.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "LTCViewController.h"

@interface LTCViewController ()

@end

@implementation LTCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //URL
//    
//    NSURL *url = [NSURL URLWithString:@"http://vip.btcchina.com/"];
//    //http://vip.btcchina.com/
//    //http://okcoin.com/t-1000052.html
//    //
//    //
//    //网络请求
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    
//    //连接服务器
//    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str);
    

    //NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
    //其中缓存协议是个枚举类型包含：
    //    NSURLRequestUseProtocolCachePolicy（基础策略）
    //
    //    NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
    //
    //    NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
    //
    //    NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
    //
    //    NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
    //
    //    NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
    //    
    
 
    
    
    
    
//    UIViewController * vc = [[MonitorViewController alloc] init];
//    UIView * view = vc.view;
//    view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height - 49);
//    
//    [self.view addSubview:view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
