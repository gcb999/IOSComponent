
//
//  MacroHeader.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h






#pragma mark -------------------UIView的坐标坐标-------------------------




//获取RGB颜色


#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define rgb(r,g,b) rgba(r,g,b,1.0f)

//大写
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];


//边框色
#define KCOLOR_BORDER     [UIColor colorWithHexColorString:@"#cbbbb3"]

#define KBORDER_WIDTH    0.5 //cell layer边框宽度,线


//主色
#define KCOLOR_MAIN   [UIColor colorWithHexColorString:@"#967867"]

//黑色
#define KCOLOR_BLACK  [UIColor blackColor]

//白色
#define KCOLOR_WHITE  [UIColor whiteColor]

//红色
#define KCOLOR_RED    [UIColor redColor]

//清除背景色
#define KCOLOR_CLEAR [UIColor clearColor]

//背景色
#define KCOLOR_BACKGROUND [UIColor colorWithHexColorString:@"#1b1513" alpha:0.8]


//列表图片比例 width:height  3:4
#define KImage3x4percent   4/3
//详情图片比例 1:1
#define KImage1x1percent    1

//首页bannnner width :height 3:2
#define KImage3x2percent    2/3

//左侧栏宽度
#define leftWidth  IPHONScreenWidth * [JSSideSlippingControllerConfig shareInstance].leftGapPercentage




#pragma mark ----------------SDWebImage中背景图片和错误图片定制----------------


//错误背景图片
#define KBANNER_ERROR_IMGURL  @""

#define KBIGPRODUCT_ERROR_IMGURL  @""

#define KMIDDLEPRODUCT_ERROR_IMGURL  @""

#define KSMALLPRODUCT_ERROR_IMGURL  @""



//默认背景图片
#define KBANNER_DEAFAULT_IMGURL  @"failed_to_load_pic"

#define KLoadingImageView_1X1  @"failed_to_load_pic"

#define KLoadingImageView_3X4  @"failed_to_load_pic"

#define KNotWorkImagview @"fgure_cracked_load_pic"





#pragma mark ---------------UI上的宏----------------



//获取UIImage  (建议使用前两种宏定义,性能高于后者)

#define IMAGE_CONTENT_FILE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]//读取本地图片


#define IMAGE_CONTENT_FILES(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]//定义UIImage对象


#define IMAGE_NAME(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]//定义UIImage对象


//获取delegate
#define APPDELEGATE (AppDelegate*)[[UIApplication sharedApplication] delegate]


//获取根控制器
#define ROOT_NAV_VC (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]



#pragma mark ---------------字符串---------------

#define STRING_WITH_FORMAT_INT(interger)       [NSString stringWithFormat:@"%ld",(long)(interger)]
#define STRING_WITH_FORMAT_FLOAT(float)        [NSString stringWithFormat:@"%f",(float)]



#pragma mark ---------------校验相关---------------

#define STRINGHASVALUE(str)  (str && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

//字符串
#define IS_NSString(str)     (str &&  [str isKindOfClass:[NSString class]] && [str length] > 0 )

//数组
#define IS_NSArray(arr)      ( arr && (arr != nil) && [arr isKindOfClass:[NSArray class]] && arr.count>0 )

//字典
#define IS_NSDictionary(dic)        ( dic && (dic != nil) && [dic isKindOfClass:[NSDictionary class]] )

//NSNull
#define IS_NSNull(class)      [class isKindOfClass:[NSNull class]





#pragma mark ---------------获取沙盒的信息----------------

#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define USER_DEFAULT_SetObject(key,vaule) [[NSUserDefaults standardUserDefaults] setObject:vaule forKey:key] ; [[NSUserDefaults standardUserDefaults] synchronize]

#define USER_DEFAULT_ValueForKey(key)  [[NSUserDefaults standardUserDefaults] valueForKey:key]

//读取bundle

#define BUNDLE_PATH_IMAGENAME(c) [[NSBundle mainBundle] pathForResource:c ofType:nil]





//-------------------打印日志-------------------------
//重写NSLog,Debug模式下打印日志和当前行数

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif






#endif /* MacroHeader_h */



#define ALLLANGUAGEARRY [[NSMutableArray alloc]initWithObjects:@"en",@"ru",@"fr",@"es",@"de",@"cs",@"pl",@"pt", nil]

//#define CURLANGUAGE [[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"]

#define CURLANGUAGE   [[[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"] isEqualToString:@"cz"]?@"cs":[[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"]

#define JSLocalizedString(key, comment)     [[NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:CURLANGUAGE ofType:@"lproj"]]localizedStringForKey:key value:nil table:@"language"]==nil?key:[[NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:CURLANGUAGE ofType:@"lproj"]]localizedStringForKey:key value:nil table:@"language"]





