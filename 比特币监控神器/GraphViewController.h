//
//  iPhoneGraphViewController.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-2-27.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphViewController : UIView

@property(retain,nonatomic) NSArray *fistArray;
@property(retain,nonatomic) NSArray *secondArray;
@property(retain,nonatomic) NSString *Xname;
@property(retain,nonatomic) NSString *Yname;
@property(retain,nonatomic) NSArray  *time;

@property (nonatomic, assign, getter = isLinesGraph) BOOL linesGraph; //改变graph类型 (Yes = For lines, No = For charts)

@end
