//
//  DataFormViewController.h
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-5.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataFormViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *highPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *VolPriceLabel;

@end
