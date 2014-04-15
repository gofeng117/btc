//
//  CoinViewController.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-6.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonitorViewController.h"
#import "Data.h"

typedef NS_ENUM(NSInteger, ViewTAG) {
    
    PlatformTableViewTAG = 100,
    
    
};

@interface CoinViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray * platformArray;
@property (strong,nonatomic) UITableView * platformTableView;

@end
