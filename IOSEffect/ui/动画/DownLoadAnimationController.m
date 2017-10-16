//
//  DownLoadAnimationController.m
//  IOSEffect
//
//  Created by xubojoy on 2017/10/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

#import "DownLoadAnimationController.h"
#import "JSDownloadView.h"
@interface DownLoadAnimationController ()<JSDownloadAnimationDelegate>
{
    NSTimer *_timer;
    double _timeCount;
    CGFloat _progress;
}

@property (nonatomic, strong) JSDownloadView *downloadView;
@end

@implementation DownLoadAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title  = @"下载炫酷动画";
    self.view.backgroundColor = XNColor(41, 158, 239, 1);
    
    [self initData];
    
    [self.view addSubview:({
        JSDownloadView *downloadView = [[JSDownloadView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2-50, CGRectGetHeight(self.view.frame)/2-50, 100, 100)];
        downloadView.delegate = self;
        downloadView.progressWidth = 4;
        
        self.downloadView = downloadView;
        self.downloadView;
    })];
    
}

- (void)initData{
    _timeCount = 200.0;
    _progress = 0.0;
}

// 模拟网络请求数据进度
- (void)timeDown{
    _timeCount -= 1;
    _progress += 0.005;
    self.downloadView.progress  = _progress;
    
    if (_timeCount <= 0) {
        
        [self initData];
        [_timer invalidate];
        _timer = nil;
        self.downloadView.isSuccess = YES;
    }
}

- (void)animationStart{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
