//
//  JSPickerView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPickerView.h"

@interface JSPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
       NSInteger selectIndex;
}
@property(nonatomic,copy)pickerViewCompleteBlock block;
@property(nonatomic,strong)NSArray *dataArray;

@end


@implementation JSPickerView


-(instancetype)initWithHeight:(CGFloat)height data:(NSArray *)dataArray complete:(pickerViewCompleteBlock)complete{
   
    CGRect rect=CGRectMake(0, IPHONScreenHeight-height, IPHONScreenWidth, height);
    
    return [self initWithFrame:rect data:dataArray complete:complete];
}


- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArray complete:(pickerViewCompleteBlock)complete;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.block=complete;
        self.dataArray=dataArray;
        
        
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
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(x, y, width, height)];
        self.pickerView.backgroundColor=[UIColor whiteColor];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self.pickerView setShowsSelectionIndicator:YES];
        [self addSubview:self.pickerView];
        
        
        
    }
    return self;
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectIndex = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
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
     NSString *dateStr = [df stringFromDate:self.dataArray];
    
    self.block(self,self.dataArray[selectIndex]);
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.frame=CGRectMake(0, IPHONScreenHeight+10, IPHONScreenWidth, IPHONScreenHeight);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}







@end
