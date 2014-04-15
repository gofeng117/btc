//
//  MonitorViewController.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-2-27.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "MonitorViewController.h"
#import "GraphView.h"

@interface MonitorViewController ()

@end


@implementation MonitorViewController

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
    
    [self addPlatformScrollView];
	
    [self.view bringSubviewToFront:self.platformScrollView];
    self.newsArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5"]];
    
}
-(void)addPlatformScrollView{
    NSMutableArray *viewsArray = [@[] mutableCopy];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_nosie.png"]];
    NSArray *colorArray = @[[UIColor cyanColor],backgroundColor,backgroundColor];
    
    //    NSArray *colorArray = @[[UIColor cyanColor],[UIColor magentaColor],[UIColor greenColor]];
    for (int i = 0; i < 3; i++) {
        //        DataFormViewController * dataFormViewController = [[DataFormViewController alloc]initWithNibName:<#(NSString *)#> bundle:<#(NSBundle *)#>];
        //        ProfileHeaderView *phv = [[[NSBundle mainBundle]loadNibNamed:@"ProfileHeaderView" owner:self options:Nil] lastObject];
        
        DataFormViewController * dvc = [[DataFormViewController alloc]init];
        dvc.view.frame = CGRectMake(0, 0, 320, 300);
        
        GraphView * graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
        
        self.newsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
        [_newsView setTag:99];
        UITableView * newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 300)];
        [newsTableView setTag:98];
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        view.backgroundColor = [UIColor magentaColor];
        newsTableView.tableHeaderView = view;
        newsTableView.delegate = self;
        newsTableView.dataSource = self;
        [_newsView addSubview:newsTableView];
        
        switch (i) {
            case 0:
                
                dvc.view.backgroundColor = [(UIColor *)[colorArray objectAtIndex:0] colorWithAlphaComponent:1];
                [viewsArray insertObject:dvc.view atIndex:0];
                break;
            case 1:
                graphView.backgroundColor = [(UIColor *)[colorArray objectAtIndex:1] colorWithAlphaComponent:1];
                [viewsArray insertObject:graphView atIndex:1];
                break;
            case 2:
                _newsView.backgroundColor = [(UIColor *)[colorArray objectAtIndex:2] colorWithAlphaComponent:1];
                [viewsArray insertObject:newsTableView atIndex:2];
                break;
                
            default:
                break;
        }
    }
    
    //    UIView *tempView0 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    //
    //    [viewsArray addObject:tempView0];
    //    GraphView * graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    //    [viewsArray addObject:graphView];
    //    UIView *tempView2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    //    [viewsArray addObject:tempView2];
    
    self.platformScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height - 300, self.view.frame.size.width, 300) animationDuration:-2];
    //    self.platformScrollView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.1];
    
    self.platformScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    self.platformScrollView.totalPagesCount = ^NSInteger(void){
        return 3;
    };
    
    __block MonitorViewController * tempSelf = self;//防止retain cycle
    self.platformScrollView.TapActionBlock = ^(NSInteger pageIndex){
        if (pageIndex == 2) {
            tempSelf.platformScrollView.canCancelContentTouches = YES;
        }
        NSLog(@"点击了第%d个",pageIndex + 1);
        
    };
    
    _platformScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 300);
    
    [self.view addSubview:self.platformScrollView];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return self.newsArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    if(tableView.tag == 98){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"百度搜索";
            
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"新浪新闻";
            
        }
        else if (indexPath.row == 2){
            cell.textLabel.text = @"第3条新闻";
            
        }
        else if (indexPath.row == 3){
            cell.textLabel.text = @"第4条新闻";
            
        }
        else if (indexPath.row == 4){
            cell.textLabel.text = @"第5条新闻";
            
        }
    }
    
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView.tag == 98){
        if (indexPath.row == 0) {
            NSLog(@"百度搜索");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
            
        }else if (indexPath.row == 1) {
            NSLog(@"新浪新闻");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sina.com"]];
            
        }else if (indexPath.row == 2){
            NSLog(@"第3条新闻");
            
        }else if (indexPath.row == 3){
            NSLog(@"第4条新闻");
            
        }else if (indexPath.row == 4){
            NSLog(@"第5条新闻");
            
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
