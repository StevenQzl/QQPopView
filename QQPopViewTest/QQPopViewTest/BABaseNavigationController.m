//
//  BABaseNavigationController.m
//  CeShi
//
//  Created by Qu ZhongLiang on 17/4/20.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//
#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)      UIColorFromHexA(hexValue, 1.0f)
#import "BABaseNavigationController.h"
@interface BABaseNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;
@end

@implementation BABaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    self.navigationBar.translucent = NO;
    //状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //title颜色和字体
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromHex(0xffffff),
                                               NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    if ([UIDevice currentDevice].systemVersion.floatValue > 7.0) {
        //导航背景颜色
        self.navigationBar.barTintColor = UIColorFromHex(0x13c2fb);
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    //    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回键-1"] style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    
    viewController.navigationItem.backBarButtonItem = backBarButtonItem;
    
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
}


@end
