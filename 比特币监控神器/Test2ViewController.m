//
//  Test2ViewController.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "Test2ViewController.h"
#import "GraphViewController.h"

@interface Test2ViewController ()
@property (nonatomic, retain) GraphViewController *iPhoneGraph;
@property (nonatomic, retain) GraphViewController *iPhoneGraph2;

@end

@implementation Test2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataFormViewController * dvc = [[DataFormViewController alloc]init];
    [self.view addSubview:dvc.view];
    
    UILabel *forIphone = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 20)];
    forIphone.text = @"Graph";
    [forIphone setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:forIphone];
    
    _iPhoneGraph = [[GraphViewController alloc]init];
    
    _iPhoneGraph.fistArray = @[[NSNumber numberWithInt:12],[NSNumber numberWithInt:8],[NSNumber numberWithInt:1],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32],[NSNumber numberWithInt:22],[NSNumber numberWithInt:-12],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:22],[NSNumber numberWithInt:32]];
    _iPhoneGraph.secondArray = @[[NSNumber numberWithInt:2],[NSNumber numberWithInt:-18],[NSNumber numberWithInt:-5],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:30],[NSNumber numberWithInt:19],[NSNumber numberWithInt:-10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:32],[NSNumber numberWithInt:12]];
//
    [_iPhoneGraph setFrame:CGRectMake(20, 40, 700, 300)];
    
    //graph类型 (Yes = For lines, No = For charts)
    [_iPhoneGraph setLinesGraph:YES];
    [self.view addSubview:_iPhoneGraph];

    UIView * gV = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:_iPhoneGraph]];
    
    GraphView * graphView = [[GraphView alloc]initWithFrame:CGRectMake(10, 300, 300, 200)];
    [graphView addSubview:gV];
    [self.view addSubview:graphView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
