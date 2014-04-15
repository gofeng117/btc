//
//  Data.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-4.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coin.h"
#import "MonitorViewController.h"

@interface Data : NSObject<NSURLConnectionDataDelegate>
@property (nonatomic, strong)NSMutableData *coinData;
@property (nonatomic, strong)Coin *coin;

@property (nonatomic, strong)NSDictionary * headerFields;

@property (nonatomic, strong)NSString * coinString;
@property (strong, nonatomic) MonitorViewController * monitorViewController;
//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;
//接收从服务器返回数据。
@property (strong,nonatomic) NSMutableData *datas;
//重新加载表视图
-(void)reloadView:(NSDictionary*)res;
//开始请求Web Service
-(void)startRequest;


-(NSURL *)URLWithCoinName:(NSString *)coinName andPlatFormName:(NSString *) platFormName;

-(NSString *)coinStringWithURL:(NSURL *)url;
@end
