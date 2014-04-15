//
//  Coin.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "Coin.h"

@implementation Coin

-(Coin *)coinWithDictionary:(NSDictionary *) dictionary{
    NSString * buyPrice = [dictionary objectForKey:@"BuyPrice"];
    NSString * hignPrice = [dictionary objectForKey:@"HignPrice"];
    NSString * lastPrice = [dictionary objectForKey:@"LastPrice"];
    NSString * lowPrice = [dictionary objectForKey:@"LowPrice"];
    NSString * sellPrice = [dictionary objectForKey:@"SellPrice"];
    NSString * vol = [dictionary objectForKey:@"Vol"];
    
    Coin * coin = [[Coin alloc] init];
    coin.buyPrice = [buyPrice floatValue];
    coin.highPrice = [hignPrice floatValue];
    coin.lastPrice = [lastPrice floatValue];
    coin.lowPrice = [lowPrice floatValue];
    coin.sellPrice = [sellPrice floatValue];
    coin.vol = [vol doubleValue];
    
    NSLog(@"buyPrice:%f",coin.buyPrice);
    NSLog(@"HignPrice:%f",coin.highPrice);
    NSLog(@"LastPrice:%f",coin.lastPrice);
    NSLog(@"LowPrice:%f",coin.lowPrice);
    NSLog(@"SellPrice:%f",coin.sellPrice);
    NSLog(@"Vol:%f",coin.vol);
    
//    NSLog(@"nowTime:%@",coin.nowTime);
    
    return coin;
}
@end
