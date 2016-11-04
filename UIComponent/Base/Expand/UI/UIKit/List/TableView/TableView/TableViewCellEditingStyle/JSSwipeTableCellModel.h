//
//  JSSwipeTableCellModel.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSSwipeTableCellModel : NSObject

//标题
@property (nonatomic , copy) NSString * title;

//背景色
@property (nonatomic , strong) UIColor * color;

//图片
@property (nonatomic , copy) NSString * iconUrl;


- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color icon:(NSString *)icon;



@end
