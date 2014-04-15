//
//  CoinViewController.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-6.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "CoinViewController.h"

@interface CoinViewController ()
@property (strong,nonatomic) NSMutableData * receiveData;

@end

@implementation CoinViewController

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
    
    [self addMonitorView];
    self.platformArray = [NSMutableArray arrayWithArray:@[@"1",@"2"]];
    
    [self addPlatformTableView];
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.106:8181/api/CoinAPI?cid=0&pid=0"];
    Data *coinData = [[Data alloc] init];
    NSString * string = [coinData coinStringWithURL:url];
    
    NSLog(@"data:%@",string);
    
    
	// Do any additional setup after loading the view.
    
    //    //异步POST请求
    //    //创建url
    //    NSURL *url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do"];
    //    //创建请求
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //    [request setHTTPMethod:@"POST"];
    //    NSString *str = @"type=focus-c";
    //    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //    [request setHTTPBody:data];
    //    //连接服务器
    //    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    //异步GET请求
    //    //创建url
    //    NSURL *url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c"];
    //    //创建请求
    //    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //    //连接服务器
    //    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    //
}
-(void)addPlatformTableView{
    UITableView * platformTableView = [[UITableView alloc]init];
    self.platformTableView = platformTableView;
    _platformTableView.frame = CGRectMake(0, 20, 320, self.view.frame.size.height - 300);
    self.platformTableView.delegate = self;
    self.platformTableView.dataSource = self;
    [self.platformTableView setTag:PlatformTableViewTAG];
    [self.view addSubview:self.platformTableView];
    
}

-(void)addMonitorView{
    MonitorViewController * monitorViewController = [[MonitorViewController alloc] init];
    monitorViewController.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height - 49);
    
    //    self.newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 300)];
    //    [_newsTableView setTag:NewsTableViewTAg];
    //    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    //    view.backgroundColor = [UIColor magentaColor];
    //    _newsTableView.tableHeaderView = view;
    //    _newsTableView.delegate = self;
    //    _newsTableView.dataSource = self;
    //    [monitorViewController.newsView addSubview:self.newsTableView];
    
    [self.view addSubview:monitorViewController.view];
    [self.view bringSubviewToFront:monitorViewController.view];
    
}


// 异步请求的代理方法
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    NSLog(@"%@",[res allHeaderFields]);
    
    self.receiveData = [NSMutableData data];
    
}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [self.receiveData appendData:data];
}
//数据传完之后调用此方法

-(void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    NSString *receiveStr = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",receiveStr);
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    NSLog(@"%@",[error localizedDescription]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView.tag == PlatformTableViewTAG) {
        return _platformArray.count;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    if (tableView.tag == PlatformTableViewTAG) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"BTC";
            
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"LTC";
            
        }
    }
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView.tag == PlatformTableViewTAG) {
        if (indexPath.row == 0) {
            NSLog(@"BTC平台1");
            
        }else{
            NSLog(@"LTC平台");
            
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
