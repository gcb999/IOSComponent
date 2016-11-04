//
//  JSDatePicker.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSDatePicker.h"

@interface JSDatePicker ()

@property(nonatomic,copy)datePickerCompleteBlock block;

@end

@implementation JSDatePicker


- (instancetype)initWithHeight:(CGFloat)height complete:(datePickerCompleteBlock)complete
{
    CGRect rect=CGRectMake(0, IPHONScreenHeight-height, IPHONScreenWidth, height);
    
    return [self initWithFrame:rect complete:complete];
    
    
}


- (instancetype)initWithFrame:(CGRect)frame complete:(datePickerCompleteBlock)complete;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.block=complete;
        
        
        CGFloat x=0;
        CGFloat y=0;
        CGFloat width=IPHONScreenWidth;
        CGFloat height=44;
        
#pragma mark -导航栏
        
        //背景图片
        UIImageView *tpBarImgView = [UIImageView imageViewImageName:@"" frame:CGRectMake(x, y, width, height)];
        tpBarImgView.image = [UIImage ImageWithColor:rgb(34, 34, 34) frame:tpBarImgView.bounds];
        [self addSubview:tpBarImgView];
        
        //cancel
        CGRect hRec = CGRectMake(0, 0, 70, height);
        UIButton *btn = [UIButton ButtonWithSystemImage:hRec title:@"Cancel" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(cancelAction)];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        [self addSubview:btn];
        
        
        //OK
        hRec =  CGRectMake(width-70, 0, 70, height);
        btn = [UIButton ButtonWithSystemImage:hRec title:@"OK" titleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(doneAction)];
        [self addSubview:btn];
        
#pragma mark -DatePicker
        
        x=0;
        y=44;
        width=IPHONScreenWidth;
        height=self.bounds.size.height-44;
        self.datePkView = [[UIDatePicker alloc] initWithFrame:CGRectMake(x, y, width, height)];
        self.datePkView.backgroundColor = [UIColor whiteColor];
        self.datePkView.datePickerMode = UIDatePickerModeDate;
        //    datePkView.maximumDate = [NSDate date];
        [self setBG:self.datePkView];
        [self addSubview:self.datePkView];

        
        
    }
    return self;
}

-(void)setBG:(UIDatePicker *)datePicker{
    
    //0-大背景的UIview;0-0各个小格子的UIview；0-1控件选中框上方那条横线；0-2控件选中框下方那条横线
    UIView *pickerView = [[datePicker subviews] objectAtIndex:0];//获取控件的子视图
    //将自己定义UIView 加在 控件的子视图上
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
    colorView.backgroundColor = [UIColor blueColor];
    colorView.alpha = 0.2f;
    colorView.center = pickerView.center;
    [pickerView addSubview:colorView];
    
}




-(void)cancelAction{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame=CGRectMake(0, IPHONScreenHeight+10, IPHONScreenWidth, IPHONScreenHeight);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}

-(void)doneAction{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [df stringFromDate:self.datePkView.date];
    
    self.block(self,dateStr);
  
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame=CGRectMake(0, IPHONScreenHeight+10, IPHONScreenWidth, IPHONScreenHeight);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}



@end
