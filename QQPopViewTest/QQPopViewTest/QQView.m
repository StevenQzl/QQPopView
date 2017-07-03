//
//  QQView.m
//  CeShi
//
//  Created by Qu ZhongLiang on 17/7/3.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "QQView.h"
#define ViewWidth [UIScreen mainScreen].bounds.size.width
#define ViewHeight [UIScreen mainScreen].bounds.size.height
@interface QQView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *popDataArr;
@end
@implementation QQView

- (instancetype)initPoplist:(NSArray *)arr clickblockk:(void(^)(NSString *))clickblco
{
    self = [super initWithFrame:CGRectMake(0, 0,ViewWidth , ViewHeight)];
    if (self) {
     //两个block的写法其实执行起来是一样的
        self.clickblcok = ^(NSString *str){
            NSLog(@"-==-%@",str);
            clickblco(str);
        };
        
      //  self.clickblcok = [clickblco copy];
         [self addpopListView:arr];
    }
    return self;
}
- (void)addpopListView:(NSArray *)arr{
    self.popDataArr = arr;
    _backView = [UIView new];
    [self addSubview:_backView];
    _backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    _backView.frame = self.frame;
    _backView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [_backView addGestureRecognizer:tap];
    
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    _tableview.backgroundColor = [UIColor whiteColor];
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.dataSource = self;
    _tableview.delegate = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableview.layer.cornerRadius = 10;
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.scrollEnabled = NO;
    [self addSubview:self.tableview];

    [self setBezierPath];
    [self showYableView];
}
// 画三角形-------
- (void)setBezierPath{
    CGFloat width = ViewWidth-15;//白色箭头的偏移量
    CGFloat height = 64;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width - 25, height)];
    [path addLineToPoint:CGPointMake(width - 20, height-5)];
    [path addLineToPoint:CGPointMake(width - 15, height)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    // 颜色设置和cell颜色一样
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
}
- (void)showYableView
{
    self.tableview.frame = CGRectMake(ViewWidth - 150, 64, 140, 0);
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.tableview.frame = CGRectMake(ViewWidth-150, 64, 140, 50.0 * (self.popDataArr.count));
                     }];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.textLabel.textColor = [UIColor redColor];
        cell.backgroundColor = [UIColor clearColor];
        [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.popDataArr[indexPath.row];
    cell.separatorInset = UIEdgeInsetsMake(0, 2, 0, 3);
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.popDataArr.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 10)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.clickblcok(self.popDataArr[indexPath.row]);
    [self removeFromSuperview];
}


- (void)tapClick{
    [self removeFromSuperview];
}

- (void)show{
    
    [[UIApplication sharedApplication].keyWindow  addSubview:self];
    
}
@end
