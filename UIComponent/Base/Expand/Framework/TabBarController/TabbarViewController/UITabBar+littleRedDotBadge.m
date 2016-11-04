//
//  UITabBar+littleRedDotBadge.m
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "UITabBar+littleRedDotBadge.h"

@implementation UITabBar (littleRedDotBadge)
- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badge animation:(BOOL)animation{
    
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UILabel *badgeLabel = [[UILabel alloc]init];
    badgeLabel.tag = 888 + index;
    badgeLabel.backgroundColor = [UIColor redColor];
    badgeLabel.textColor = [UIColor whiteColor];      //文字颜色
    badgeLabel.textAlignment = NSTextAlignmentCenter;     //居中
    badgeLabel.layer.borderWidth = 1;     //边界宽度
    badgeLabel.font=[UIFont systemFontOfSize:13];
    badgeLabel.adjustsFontSizeToFitWidth=YES;
    badgeLabel.layer.masksToBounds = YES;
    badgeLabel.layer.backgroundColor = [UIColor redColor].CGColor;  //红色背景
    badgeLabel.layer.borderColor = badgeLabel.backgroundColor.CGColor;    //边界白色
   

    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / [JSTabbarItemHelpModel shareInstance].tabbarItemModels.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeLabel.frame = CGRectMake(x-3, y-3, 20, 20);
    badgeLabel.layer.cornerRadius = badgeLabel.frame.size.width/2;
    
    
    if (!IS_NSString(badge) || [badge isEqualToString:@"0"]) {
        badgeLabel.frame=CGRectZero;
    }
    
    else if (badge.length<=2) {
        
        badgeLabel.font = [UIFont systemFontOfSize:12];

        badgeLabel.text=badge;
    }
    else{
        
        badgeLabel.font =[UIFont systemFontOfSize:10];;
   
        badgeLabel.text=@"99+";
    }
    
    [self addSubview:badgeLabel];
    if (animation) {
        [self easyInEasyOutView:badgeLabel];
    }
    
    
}

- (void)easyInEasyOutView:(UIView *)view
{
    [UIView animateWithDuration:0.25f animations:^{
        view.transform = CGAffineTransformMakeScale(1.2,1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15f animations:^{
            view.transform = CGAffineTransformMakeScale(0.85, 0.85);
        } completion:^(BOOL finished) {
            view.transform = CGAffineTransformIdentity;
        }];
    }];
}


- (void)hideBadgeOnItemIndex:(int)index{
    
    //移除小红点
    [self removeBadgeOnItemIndex:index];
    
}

- (void)removeBadgeOnItemIndex:(int)index{
    
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}
@end
