//
//  Coin.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coin : NSObject
@property(strong,nonatomic) NSString * coinName;    //币种
@property(strong,nonatomic) NSString * platFormName;//所在平台名字
@property(nonatomic) float  buyPrice;               //当前买价
@property(nonatomic) float  sellPrice;              //卖出价格
@property(nonatomic) float  highPrice;              //最高值
@property(nonatomic) float  lowPrice;               //最低值
@property(nonatomic) float  vol;                    //交易量
@property(nonatomic,strong) NSDate * nowTime;                 //当前时间
@property(nonatomic) float lastPrice;   //最近一次成交价


-(Coin *)coinWithDictionary:(NSDictionary *)dictionary;

@end
