//
//  SLTabBarController.h
//  SLDrawTabbar
//
//  Created by lsl on 2017/7/20.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLTabBarController : UITabBarController

-(instancetype)initWithArray:(NSArray *)array;
///设置当前显示页面
- (void)setSelectedIndexPage:(NSUInteger)selectedIndex;
@end
