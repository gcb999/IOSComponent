//
//  JSSimpleNotMoreDataView.h
//  DressLink
//
//  Created by gcb999 on 16/6/28.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSSimpleNotMoreDataView : UIView

//图片
@property(nonatomic,strong) UIImageView *imageView;

//标题
@property(nonatomic,strong)UILabel *titleLabel;

//详情
@property(nonatomic,strong)UILabel *detailLable;

//详情说明
@property(nonatomic,strong)UILabel *detailMultipleLable;

//按钮
@property(nonatomic,strong)UIButton *reloadButton;

@end
