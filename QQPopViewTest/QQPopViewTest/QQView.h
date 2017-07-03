//
//  QQView.h
//  CeShi
//
//  Created by Qu ZhongLiang on 17/7/3.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^clicBlock)(NSString *clickStr);
@interface QQView : UIView
@property (nonatomic, copy)clicBlock clickblcok;

- (instancetype)initPoplist:(NSArray *)arr clickblockk:(void(^)(NSString *str))clickblco;
- (void)show;
@end
