//
//  JSTabbarItemModel.h
//  kit
//
//  Created by gcb999 on 16/6/8.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTabbarItemModel : NSObject

@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy) NSString *normal; //默认图标
@property (nonatomic, copy) NSString *highlighted; // 高亮图标
@property (nonatomic, copy) NSString *ctrl; // 对应控制器


@end

