//
//  OneViewController.m
//  QPopView
//
//  Created by Qu ZhongLiang on 17/7/3.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "OneViewController.h"
#import "QQView.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIBarButtonItem *button =[[UIBarButtonItem alloc]initWithTitle:@"账单" style:UIBarButtonItemStyleDone target:self action:@selector(BillClick)];
    self.navigationItem.rightBarButtonItem = button;
}
- (void)BillClick
{
    NSArray *carr = @[@"创建群聊",@"加好友/群",@"扫一扫",@"面对面快传",@"付款",@"面对面红包"];
    QQView *popListView = [[QQView alloc]initPoplist:carr clickblockk:^(NSString *str) {
        NSLog(@"%@",str);
    }  ];
    [popListView show];
}


@end
