//
//  News.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface News : NSObject
@property(strong,nonatomic) NSString * newsTitle;    //标题
@property(strong,nonatomic) NSString * newsContent;    //内容
@property(strong,nonatomic) NSString * newsAuther;    //作者
@property(strong,nonatomic) NSString * newsTime;    //时间
@property(strong,nonatomic) NSString * newsPicture;    //
@property(strong,nonatomic) NSString * newsLink;    //

@end
