//
//  JSSwipeTableCellModel.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSSwipeTableCellModel.h"

@implementation JSSwipeTableCellModel

- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color icon:(NSString *)icon
{
    self = [super init];
    if (self) {
        self.title=title;
        self.color=color;
        self.iconUrl=icon;
        
    }
    return self;
}

@end
