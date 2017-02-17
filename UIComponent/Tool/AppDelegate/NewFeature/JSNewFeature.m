//
//  JSNewFeature.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNewFeature.h"
#import "DHLaunchAdPageHUD+Launch.h"
#import "DHGuidePageHUD.h"
#import "JSFmdb.h"

NSString *const KNewFeatureVersionKey = @"KNewFeatureVersionKey";


@implementation JSNewFeature


#pragma mark -展示新特性页面（第一次进入）

+(void)showNewFeature{
    
    
    
    if ([self isFirstEnterApp]) {//第一次
        
        //1：展示新特性
        NSArray *imageNameArray = @[@"header-1.jpg",@"header-1.jpg",@"header-1.jpg",@"header-1.jpg",@"header-1.jpg"];
        DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:[UIWindow window].bounds imageNameArray:imageNameArray buttonIsHidden:YES];
        guidePage.slideInto = YES;
        //    [self.navigationController.view addSubview:guidePage];
        [[UIWindow window] addSubview:guidePage];

        
        //2: 创建数据
        [JSFmdb createTable];
        
    
    }
    else{//第二次
        
        // 启动Lanch动画
        NSString *adimageGIFUrl = @"http://img.ui.cn/data/file/3/4/6/210643.gif";
        DHLaunchAdPageHUD *launchAd = [[DHLaunchAdPageHUD alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, DDScreenH-100) aDduration:6.0 aDImageUrl:adimageGIFUrl hideSkipButton:NO launchAdClickBlock:^{
            NSLog(@"[AppDelegate]:点了广告图片");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
        }];
        
        [self initDB];

        
    }
    
    //2：保持版本号
    NSString *systemVersion=[[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    [[NSUserDefaults standardUserDefaults] setObject:systemVersion forKey:KNewFeatureVersionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}






#pragma mark -是否第一次进入程序

+(BOOL)isFirstEnterApp{
    
    
    //1：系统直接读取的版本号
    NSString *systemVersion=[[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    
    //2：读取本地版本号
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:KNewFeatureVersionKey];
    
    if(IS_NSString(localVersion) && IS_NSString(systemVersion) && [systemVersion isEqualToString:localVersion]){//说明有本地版本记录，且和当前系统版本一致
        

    return NO;
        
    }else{//无本地版本记录或本地版本记录与当前系统版本不一致
        

  
    
        
        return YES;
    }
    
    

    
}


#pragma mark -配置数据库
+(void)initDB{
    
    //1：数据库
    NSString *isCreatTableOK=USER_DEFAULT_ValueForKey(@"isCreatTableOK");
    
    if (IS_NSString(isCreatTableOK) && [isCreatTableOK isEqualToString:@"yes"]) {
        
    }
    else{
        
        if ([JSFmdb createTable]) {
            
            USER_DEFAULT_SetObject(@"isCreatTableOK", @"yes");//创表成功
        }
        else{
            
            USER_DEFAULT_SetObject(@"isCreatTableOK", @"no");//创表失败
        }
        
    }

    
    
}


@end
