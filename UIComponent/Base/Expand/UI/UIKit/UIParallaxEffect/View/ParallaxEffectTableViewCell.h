//
//  ParallaxEffectTableViewCell.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParallaxEffectModel.h"

@interface ParallaxEffectTableViewCell : UITableViewCell<JSTableViewCellDelegate>


@property (nonatomic, strong) UIImageView *picture;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *littleLabel;

@property (nonatomic, strong) UIView *coverview;


- (CGFloat)cellOffset ;


@end
