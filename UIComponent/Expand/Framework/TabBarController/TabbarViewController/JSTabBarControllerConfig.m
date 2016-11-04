//
//  JSTabBarControllerConfig.m
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabBarControllerConfig.h"




@interface CYLBaseNavigationController : UINavigationController
@end

@implementation CYLBaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // fix strange animate when use `-[UIViewController cyl_jumpToOtherTabBarControllerItem:(Class)ClassType performSelector:arguments:returnValue:]` ,like this http://i63.tinypic.com/bg766g.jpg . If you have not used this method delete this line blow.
    [(CYLTabBarController *)self.tabBarController rootWindow].backgroundColor = [UIColor whiteColor];
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end




#import "JSTabbarItemHelpModel.h"
@interface JSTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation JSTabBarControllerConfig

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        
        //1:控制器集合
        NSMutableArray *viewControllers=[NSMutableArray array];
        
        //2: 设置TabBarItem的属性几何  （包括 title、Image、selectedImage）
        NSMutableArray<NSDictionary *> *tabBarItemsAttributes=[NSMutableArray array];
        
        //3:读取配置文件
        for (JSTabbarItemModel *model in [JSTabbarItemHelpModel shareInstance].tabbarItemModels) {
            
            
     
            //1:获取控制器集合
            UIViewController * vc=(UIViewController *)[[NSClassFromString(model.ctrl) alloc] init];
            vc.navigationItem.title=model.title;
            UIViewController *nav = [[CYLBaseNavigationController alloc] initWithRootViewController:vc];
            [viewControllers addObject:nav];
            //2获取items属性集合
            [tabBarItemsAttributes addObject:@{
                                               CYLTabBarItemTitle : model.title,
                                               CYLTabBarItemImage : model.normal,
                                               CYLTabBarItemSelectedImage : model.highlighted
                                               }];
            
        }
        
        
            //4: 初始化Tabbar
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    
        
        // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
        tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
        
        [tabBarController setViewControllers:viewControllers];
        // 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
#warning IF YOU NEED CUSTOMIZE TABBAR APPEARANCE, REMOVE THE COMMENT '//'
        [[self class] customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}



/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    NSUInteger allItemsInTabBarCount = [CYLTabBarController allItemsInTabBarCount];
    [[UITabBar appearance] setSelectionIndicatorImage:[self imageFromColor:[UIColor yellowColor] forSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / allItemsInTabBarCount, 49.f) withCornerRadius:0]];
    
    // set the bar background color
    // 设置背景图片
    //    UITabBar *tabBarAppearance = [UITabBar appearance];
    //   [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background_ios7"]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    return image;
}


@end
