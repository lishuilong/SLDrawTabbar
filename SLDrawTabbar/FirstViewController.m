//
//  FirstViewController.m
//  SLDrawTabbar
//
//  Created by lsl on 2017/7/20.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstChildViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    self.title = @"Home";
    
    UIButton *gotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    gotoButton.frame = CGRectMake(0, 0, 80, 40);
    gotoButton.backgroundColor = [UIColor blueColor];
    [gotoButton setTitle:@"下一页" forState:UIControlStateNormal];
    [gotoButton addTarget:self action:@selector(gotoButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gotoButton];
    gotoButton.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    
}

- (void)gotoButtonDidClick:(UIButton *)sender {
    
    FirstChildViewController *firstChildvc = [[FirstChildViewController alloc] init];
    [self.navigationController pushViewController:firstChildvc animated:YES];
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
