//
//  SLTabBarController.m
//  SLDrawTabbar
//
//  Created by lsl on 2017/7/20.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import "SLTabBarController.h"

#define BACK_TAG 1013
#define BTNBASIC_TAG 20

#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width

@interface SLTabBarController ()
{
    NSArray *infoArray;
    NSMutableArray *itemButtonsArray;//存储所有按钮，用于状态切换
    
    UIColor *normalColor;
    UIColor *selectColor;
}
@property(strong,nonatomic)NSArray* vcArray;
@end

@implementation SLTabBarController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {

    self = [super init];
    if (self) {
        infoArray = array;
        
        [self createTabBar];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    //self.view.backgroundColor = [UIColor clearColor];
}

- (void)createTabBar {
    
    if (infoArray == nil || infoArray.count == 0) {
        return;
    }
    
    normalColor = [UIColor blackColor];
    selectColor = [UIColor blueColor];
    itemButtonsArray = [NSMutableArray arrayWithCapacity:infoArray.count];
    
    ///创建backgroundView
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 90, SCREENWIDTH, 90)];
    backgroundView.tag = BACK_TAG;
    backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backgroundView];
    
    //白色背景
    UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 90-49, SCREENWIDTH, 49)];
    back.backgroundColor = [UIColor whiteColor];
    [backgroundView addSubview:back];
    
    
    
    float itemButtonWidth = SCREENWIDTH / infoArray.count;
    float itemButtonHeight = 49;
    //获取vc
    NSMutableArray *temArray = [NSMutableArray arrayWithCapacity:infoArray.count];
    for (int i = 0; i < infoArray.count; i++) {
        NSDictionary *dic = infoArray[i];
        UIViewController *temvc = (UIViewController *)(dic[@"vc"]);
        NSString *text = dic[@"text"];
        UIImage *icon = (UIImage *)dic[@"iconNormal"];
        [temArray addObject:temvc];
        
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemButton.frame = CGRectMake(i*itemButtonWidth, 90-49, itemButtonWidth, itemButtonHeight);
        
        //中间是大按钮
        if (i == infoArray.count/2) {
            itemButton.frame = CGRectMake(i*itemButtonWidth, 0, itemButtonWidth, 60);
        }
        
        itemButton.tag = BTNBASIC_TAG + i;
        
        //创建label ，image
        
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90-65, CGRectGetWidth(itemButton.frame), 60)];
        iconImageView.contentMode = UIViewContentModeCenter;
        iconImageView.image = icon;
        iconImageView.tag = 100;
        
        [itemButton addSubview:iconImageView];
        
        if (text != nil && text.length > 0) {
            UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(itemButton.frame) - 20, CGRectGetWidth(itemButton.frame), 20)];
            textLabel.textAlignment = NSTextAlignmentCenter;
            textLabel.font = [UIFont systemFontOfSize:12];
            textLabel.text = text;
            textLabel.tag = 200;
            [itemButton addSubview:textLabel];
            
            iconImageView.frame = CGRectMake(0, 0, CGRectGetWidth(itemButton.frame), CGRectGetHeight(itemButton.frame) - 20);
            
        }
        
        
        [backgroundView addSubview:itemButton];
        [itemButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [itemButtonsArray addObject:itemButton];
        
    }
    
    _vcArray = temArray;
    [self setViewControllers:_vcArray];
    // 先把第一个按钮变成选中状态
    [self setSelectedIndexPage:0];
}

- (void)setSelectedIndexPage:(NSUInteger)selectedIndex {
    
    if (selectedIndex < itemButtonsArray.count) {
        [self btnClicked:itemButtonsArray[selectedIndex]];
    }
    
}

- (void)btnClicked:(UIButton*)sender
{
    
    if ((sender.tag - BTNBASIC_TAG) >= _vcArray.count) {
        return;
    }
    
    //全部按钮恢复默认
    //1
    
    for (int i = 0; i < itemButtonsArray.count; i++) {
        UIButton *obj = itemButtonsArray[i];
        UILabel *titleLabel = [obj viewWithTag:200];
        titleLabel.textColor = normalColor;
        
        UIImage *iconNormal = infoArray[i][@"iconNormal"];
        UIImageView *iconView = [obj viewWithTag:100];
        iconView.image = iconNormal;
    }
    
    //2
    //    UIView* backView = [self.view viewWithTag:BACK_TAG];
    //    UIButton *currentBtn = [backView viewWithTag:(self.selectedIndex+BTNBASIC_TAG)];
    //    currentBtn.selected = NO;
    
    
    // 利用标签栏控制器的视图切换逻辑来实现视图的切换
    self.selectedIndex = sender.tag-BTNBASIC_TAG;
    sender.selected = YES;

    UILabel *titleLabel = [sender viewWithTag:200];
    titleLabel.textColor = selectColor;
    
    UIImage *iconSelect= infoArray[sender.tag-BTNBASIC_TAG][@"iconSelect"];
    UIImageView *iconView = [sender viewWithTag:100];
    iconView.image = iconSelect;
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
