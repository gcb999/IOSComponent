//
//  JSTabbarItemHelpModel.h
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSTabbarItemModel.h"

@interface JSTabbarItemHelpModel : NSObject

@property (nonatomic, strong,readonly)NSArray< JSTabbarItemModel*> *tabbarItemModels;

+(instancetype) shareInstance;

@end
