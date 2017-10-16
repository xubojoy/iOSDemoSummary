//
//  RotateViewController.m
//  IOSEffect
//
//  Created by xubojoy on 2017/10/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI{
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cd_cycleImage"]];
    image.frame =CGRectMake(50, 100, self.view.bounds.size.width-100, self.view.bounds.size.width-100);
    image.backgroundColor = [UIColor purpleColor];
    image.layer.cornerRadius = (self.view.bounds.size.width-100)/2;
    image.layer.masksToBounds = YES;
    image.contentMode = UIViewContentModeScaleAspectFill;
    image.clipsToBounds = YES;
    [self.view addSubview:image];
    
    UIImageView *small = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-100)/2-15, 0, 30, 30)];
    small.image = [UIImage imageNamed:@"cd_cycleSmall"];
    //    small.backgroundColor = [UIColor cyanColor];
    small.layer.cornerRadius = 30/2;
    small.layer.masksToBounds = YES;
    small.contentMode = UIViewContentModeScaleAspectFill;
    small.clipsToBounds = YES;
    [image addSubview:small];
    
    CABasicAnimation *monkeyAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    monkeyAnimation.toValue = [NSNumber numberWithFloat:2.0 *M_PI];
    monkeyAnimation.duration = 30.0f;
    monkeyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    monkeyAnimation.cumulative = NO;
    monkeyAnimation.removedOnCompletion = NO;
    monkeyAnimation.repeatCount = FLT_MAX;
    [image.layer addAnimation:monkeyAnimation forKey:@"AnimatedKey"];
    //[_cycleImage stopAnimating];
    // 加载动画 但不播放动画
    image.layer.speed = 3.0;
    
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
