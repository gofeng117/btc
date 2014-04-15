//
//  GraphView.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphViewController.h"

@protocol GraphViewDelegate <NSObject>

@required
- (void)getCoinData;

@end


@interface GraphView : UIView
@property (nonatomic, retain) GraphViewController *iPhoneGraph;
@property (nonatomic, retain) NSString * coinName;
@property (nonatomic, weak) id<GraphViewDelegate> delegate;

@end
