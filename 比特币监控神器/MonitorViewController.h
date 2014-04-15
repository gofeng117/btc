//
//  MonitorViewController.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-2-27.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"
#import "DataFormViewController.h"

@interface MonitorViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) CycleScrollView * platformScrollView;

@property (strong,nonatomic) UIView * newsView;
@property (strong,nonatomic) NSMutableArray * newsArray;

@end
