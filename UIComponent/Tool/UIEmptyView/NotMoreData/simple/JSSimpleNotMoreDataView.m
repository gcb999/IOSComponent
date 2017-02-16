//
//  JSSimpleNotMoreDataView.m
//  DressLink
//
//  Created by gcb999 on 16/6/28.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "JSSimpleNotMoreDataView.h"
#import "UIImage+Color.h"

@implementation JSSimpleNotMoreDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLable];
        [self addSubview:self.detailMultipleLable];
        [self  addSubview:self.reloadButton];
        
    
    }
    return self;
}

-(CGRect)centerForParentViewFrame:(CGRect)rect subsize:(CGSize)size{
    
    
    CGFloat width=(rect.size.width-size.width)*0.5f;
    CGFloat heigth=(rect.size.height-size.height)*0.5f;
    return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(heigth, width, heigth, width));
}


#pragma mark -UI  getter/Users/gcb999/Desktop/IOS_Compon/IOS_Compon.xcodeproj

-(UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView =[UIImageView imageViewImageName:@"" frame:CGRectZero];
    }
    return _imageView;
}

-(UILabel *)titleLabel{
    if (_titleLabel==nil) {
        _titleLabel=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor blackColor] textAlign:NSTextAlignmentCenter font:KBigFontSize];
        _titleLabel.numberOfLines=2;
    }
    return _titleLabel;
}

-(UILabel *)detailLable{
    if (_detailLable==nil) {
        _detailLable=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor colorWithHexColorString:@"#666666"] textAlign:NSTextAlignmentCenter font:KBigFontSize];
        _detailLable.numberOfLines=0;

    }
    return _detailLable;
}

-(UILabel *)detailMultipleLable{
    if (_detailMultipleLable==nil) {
        _detailMultipleLable=[UILabel LabWithFrame:CGRectZero text:@"" textColor:[UIColor colorWithHexColorString:@"#666666"] textAlign:NSTextAlignmentCenter font:KBigFontSize];
        _detailMultipleLable.numberOfLines=0;
    }
    return _detailMultipleLable;
}

-(UIButton *)reloadButton{
    if (_reloadButton==nil) {
        _reloadButton=[UIButton ButtonWithImageName:@"" hImageName:@"" frame:CGRectZero title:@"" titleColor:[UIColor whiteColor] font:KBigFontSize target:nil action:nil];
        [_reloadButton setBackgroundColor:KCOLOR_MAIN];
        [_reloadButton setBackgroundImage:[UIImage imageFromContextWithColor:[UIColor colorWithHexColorString:@"#977966"]] forState:UIControlStateNormal];
         [_reloadButton setBackgroundImage:[UIImage imageFromContextWithColor:[UIColor colorWithHexColorString:@"#69534a"]] forState:UIControlStateHighlighted];

    }
    return _reloadButton;
}

#pragma mark -点击事件




-(void)layoutSubviews{
    [super layoutSubviews];

    
    //图片

    CGFloat x=15;
    CGFloat y=IPHONScreenHeight*0.35f-64;
    CGFloat width=IPHONScreenWidth-15-15;
    CGFloat height=50;
    
  
    if (self.imageView.image!=nil) {
        CGSize imagesize=self.imageView.image.size;
        self.imageView.frame=[self centerForParentViewFrame:CGRectMake(x, y, width, height) subsize:imagesize];
    }

  
    //标题
    y=CGRectGetMaxY(self.imageView.frame)+24;
    height=15;

    if(IS_NSString(self.titleLabel.text)){

        self.titleLabel.frame=CGRectMake(x, y, width, height);
        
    }
    else{
        
        self.titleLabel.frame=CGRectMake(x, y, width, 0);
    }
    
    //详情

    y=CGRectGetMaxY(self.titleLabel.frame)+12;
    CGRect rect = [self.detailLable.text boundingRectWithSize:CGSizeMake(IPHONScreenWidth - 24, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:KBigFontSize} context:nil];
    height=rect.size.height;
  
    if(IS_NSString(self.detailLable.text)){
    
        self.detailLable.frame=CGRectMake(x, y, width, height);
        
    }
    else{
        
        self.detailLable.frame=CGRectMake(x, y, width, 0);
    }
    
    //详情说明
   
    y=CGRectGetMaxY(self.detailLable.frame)+8;
    CGRect rect2 = [self.detailMultipleLable.text boundingRectWithSize:CGSizeMake(IPHONScreenWidth - 24, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:KBigFontSize} context:nil];
    height=rect2.size.height;

    
    if(IS_NSString(self.detailMultipleLable.text)){
        
        self.detailMultipleLable.frame=CGRectMake(x, y, width, height);
        
    }
    else{
        
        self.detailMultipleLable.frame=CGRectMake(x, y, width, 0);
    }
    
    
    //按钮
    
    x=80;
    y=CGRectGetMaxY(self.detailMultipleLable.frame)+24;
    width=IPHONScreenWidth-80-80;
    height=44;
    
    if (IS_NSString(self.reloadButton.titleLabel.text)) {
      
        self.reloadButton.frame=CGRectMake(x, y, width, height);
    }
    else{
        
      self.reloadButton.frame=CGRectMake(x, y, width, 0);
    }
    
    
  
    
    
    
    
    
}

@end
