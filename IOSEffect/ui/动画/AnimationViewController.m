//
//  AnimationViewController.m
//  IOSEffect
//
//  Created by xubojoy on 2017/10/16.
//  Copyright © 2017年 xubojoy. All rights reserved.
//

#import "AnimationViewController.h"
#import "RotateViewController.h"
#import "DownLoadAnimationController.h"
#import "IOSEffect-Swift.h"
@interface AnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"动画";
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    switch (indexPath.row) {
        case 0:
        {
           cell.textLabel.text = @"旋转动画";
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"下载动画";
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"下雨动画";
        }
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            RotateViewController *rotateVc = [[RotateViewController alloc] init];
            [self.navigationController pushViewController:rotateVc animated:YES];
        }
            break;
        case 1:
        {
            DownLoadAnimationController *downVc = [[DownLoadAnimationController alloc] init];
            [self.navigationController pushViewController:downVc animated:YES];
        }
            break;
        case 2:
        {
            WaterDropController *waterVc = [[WaterDropController alloc] init];
            [self.navigationController pushViewController:waterVc animated:YES];
            
        }
            break;
        default:
            break;
    }
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
