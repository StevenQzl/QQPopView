//
//  CYTabBarController.m
//  CeShi
//
//  Created by Qu ZhongLiang on 17/4/20.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "CYTabBarController.h"
#import "OneViewController.h"
#import "BABaseNavigationController.h"
@interface CYTabBarController ()<UITabBarControllerDelegate>

@end

@implementation CYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setUpAllChildViewcontroller];
}
- (void)setUpAllChildViewcontroller
{
    OneViewController *oneVc = [[OneViewController alloc] init];
    [self setUpNavgationwithController:oneVc image:[UIImage imageNamed:@"标签栏-首页-未选中"] selectImage:[UIImage imageNamed:@"标签栏-首页-选中"] title:@"消息"];
    
   
    
    self.selectedIndex = 0;
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    [[UITabBarItem appearance] setBadgeColor:[UIColor redColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor blackColor]} forState:UIControlStateNormal];
    
}
- (void)setUpNavgationwithController:(UIViewController *)controller image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
    BABaseNavigationController *nav = [[BABaseNavigationController alloc] initWithRootViewController:controller];
    nav.title = title;
    nav.navigationItem.title = title;
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor = [UIColor blackColor];
    [self addChildViewController:nav];
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    UIViewController *controller = self.viewControllers[selectedIndex];
    self.title = controller.title;
    self.navigationItem.rightBarButtonItem = controller.navigationItem.rightBarButtonItem;
    self.navigationItem.leftBarButtonItem = controller.navigationItem.leftBarButtonItem;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    self.title = viewController.title;
    self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
    self.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem;
}
@end
