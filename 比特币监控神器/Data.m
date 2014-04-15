//
//  Data.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-4.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "Data.h"

@implementation Data

-(void)startRequest{
    
}
-(NSURL *)URLWithCoinName:(NSString *)coinName andPlatFormName:(NSString *)platFormName{
    ///////////////////
    
    NSURL * url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c"];
    return url;
}
-(NSString *)coinStringWithURL:(NSURL *)url{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //异步请求
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (connection) {
        NSLog(@"链接成功");
    }
    
    return self.coinString;
}
-(void)reloadView:(NSDictionary *)res{
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
    self.headerFields = res.allHeaderFields;
    NSLog(@"res.allHeaderFields:%@",self.headerFields);
    self.coinData = [NSMutableData data];

    self.coin = [[Coin alloc] init];
    NSString * nowTime = [_headerFields objectForKey:@"Date"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz"];
    
//    NSDate *now = [NSDate date];
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
//    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:now];
    
//    if(components.hour > 12){
//        
//    }
    
    _coin.nowTime = [formatter dateFromString:nowTime];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: _coin.nowTime];
    NSDate *localeDate = [_coin.nowTime  dateByAddingTimeInterval: interval];
    NSLog(@"enddate=%@",localeDate);
    NSLog(@"_coin.nowTime:%@",_coin.nowTime);
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"data.length:%d",data.length);
    [self.coinData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"self.coinData:%@",self.coinData);
    NSLog(@"请求完成…");
    
    _coinString = [[NSString alloc]initWithData:self.coinData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonString:%@",_coinString);

    
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:_coinData
                                                         options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"dict11:%@",dict);
    
    [self.coin coinWithDictionary:dict];
    NSLog(@"_coin.nowTime:%@",_coin.nowTime);

//    [self coinWithDictionary:dict];
//    [self reloadView:dict];
    
    
    
    [self.coinData writeToFile:@"/Users/apple/Desktop/recivefile/a.txt" atomically:NO];
}
-(Coin *)coinWithDictionary:(NSDictionary *) dictionary{
    NSString * buyPrice = [dictionary objectForKey:@"BuyPrice"];
    NSString * hignPrice = [dictionary objectForKey:@"HignPrice"];
    NSString * lastPrice = [dictionary objectForKey:@"LastPrice"];
    NSString * lowPrice = [dictionary objectForKey:@"LowPrice"];
    NSString * sellPrice = [dictionary objectForKey:@"SellPrice"];
    NSString * vol = [dictionary objectForKey:@"Vol"];
    
    _coin.buyPrice = [buyPrice floatValue];
    _coin.highPrice = [hignPrice floatValue];
    _coin.lastPrice = [lastPrice floatValue];
    _coin.lowPrice = [lowPrice floatValue];
    _coin.sellPrice = [sellPrice floatValue];
    _coin.vol = [vol doubleValue];

    NSLog(@"buyPrice:%f",_coin.buyPrice);
    NSLog(@"HignPrice:%f",_coin.highPrice);
    NSLog(@"LastPrice:%f",_coin.lastPrice);
    NSLog(@"LowPrice:%f",_coin.lowPrice);
    NSLog(@"SellPrice:%f",_coin.sellPrice);
    NSLog(@"Vol:%f",_coin.vol);
    
    NSLog(@"_coin:%@",_coin.nowTime);

    return self.coin;
}
/*
 2014-03-05 22:40:00.115 比特币监控神器[7086:a0b] res.allHeaderFields:{
 "Cache-Control" = "no-cache";
 "Content-Length" = 145;
 "Content-Type" = "application/json";
 Date = "Wed, 05 Mar 2014 14:40:01 GMT";
 Expires = "-1";
 Pragma = "no-cache";
 Server = "Microsoft-IIS/7.5";
 "X-AspNet-Version" = "4.0.30319";
 "X-Powered-By" = "ASP.NET";
 }
 
 2014-03-05 21:27:41.777 比特币监控神器[6821:a0b] jsonString:{
 "BuyPrice": 3959.99,
 "SellPrice": 3960.0,
 "HignPrice": 4260.0,
 "LowPrice": 3845.0,
 "LastPrice": 3960.0,
 "Vol": 291007.3373
 }
 2014-03-05 21:27:45.605 比特币监控神器[6821:a0b] dict11:{
 BuyPrice = "3959.99";
 HignPrice = 4260;
 LastPrice = 3960;
 LowPrice = 3845;
 SellPrice = 3960;
 Vol = "291007.3373";
 }
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"error:%@",[error localizedDescription]);
}


@end