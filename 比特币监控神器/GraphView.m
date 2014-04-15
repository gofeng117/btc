//
//  GraphView.m
//  比特币监控神器
//
//  Created by ios_Dream on 14-3-3.
//  Copyright (c) 2014年 ZY. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        UILabel *forIphone = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x + 10, self.frame.origin.y + 10, self.frame.size.width - 20, self.frame.size.height - 20)];
        forIphone.text = @"Graph";
        [forIphone setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:forIphone];
        
        self.iPhoneGraph = [[GraphViewController alloc]init];
        if ((self.coinName = @"BTC")) {
            _iPhoneGraph.fistArray = @[[NSNumber numberWithInt:2],[NSNumber numberWithInt:8],[NSNumber numberWithInt:1],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32],[NSNumber numberWithInt:22],[NSNumber numberWithInt:-12],[NSNumber numberWithInt:16],[NSNumber numberWithInt:-19],[NSNumber numberWithInt:22],[NSNumber numberWithInt:12]];
        } else {
            _iPhoneGraph.fistArray = @[[NSNumber numberWithInt:12],[NSNumber numberWithInt:8],[NSNumber numberWithInt:1],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:32],[NSNumber numberWithInt:22],[NSNumber numberWithInt:-12],[NSNumber numberWithInt:16],[NSNumber numberWithInt:19],[NSNumber numberWithInt:22],[NSNumber numberWithInt:32]];
        }
        
        //    _iPhoneGraph.secondArray = @[[NSNumber numberWithInt:2],[NSNumber numberWithInt:-18],[NSNumber numberWithInt:-5],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:30],[NSNumber numberWithInt:19],[NSNumber numberWithInt:-10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:32],[NSNumber numberWithInt:12]];
        //
        _iPhoneGraph.frame = CGRectMake(frame.origin.x + 20, frame.origin.y + 60, frame.size.width - 20, frame.size.height - 20);
        
        //graph类型 (Yes = For lines, No = For charts)
        [_iPhoneGraph setLinesGraph:YES];
        self.backgroundColor = [UIColor magentaColor];
        [self addSubview:_iPhoneGraph];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
