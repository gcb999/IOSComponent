//
//  JSTabPageViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTabPageViewController.h"

@interface JSTabPageViewController ()
{
    
}





@end



@implementation JSTabPageViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuList=[NSMutableArray array];
        self.vcs=[NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithMenu:(NSMutableArray<MenuInfo *> *)menuInfo vcs:(NSMutableArray<NSString*> *)vcs
{
    self = [self init];
    if (self) {
        
        if (IS_NSArray(menuInfo) && IS_NSArray(vcs) && menuInfo.count==vcs.count) {

                [self.menuList addObjectsFromArray:menuInfo];
                [self.vcs addObjectsFromArray:vcs];
        }
        else{
           
            NSLog(@"___标题的数目与控制的集合不一致，请检查");
          
            
        }
        
      

    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    if (self.pageViewStyle==pageviewBubble) {
        
        [self setupBubble];
    }
    else if (self.pageViewStyle==pageviewMiddle)
    {
        [self setupMiddle];
    }
    else if (self.pageViewStyle==pageviewDivide)
    {
        [self setupDivide];
    }
    else
    {
        [self setupNomal];
    }

}

#pragma mark - VTMagicViewDelegate

#pragma mark -  当子页面显示或消失时，会触发viewDidAppeare:和viewDidDisappeare:
- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    //    NSLog(@"index:%ld viewDidAppear:%@", (long)pageIndex, viewController.view);
}

- (void)magicView:(VTMagicView *)magicView viewDidDisappear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    //    NSLog(@"index:%ld viewDidDisappear:%@", (long)pageIndex, viewController.view);
}

#pragma mark - 当menuItem被点击时，会触发didSelectItemAtIndex:方法

- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    //    NSLog(@"didSelectItemAtIndex:%ld", (long)itemIndex);
}



#pragma mark - VTMagicViewDataSource

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    NSMutableArray *titleList = [NSMutableArray array];
    for (MenuInfo *menu in self.menuList) {
        [titleList addObject:menu.title];
    }
    return titleList;
}


- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{

    //缓存
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:JSTabPageViewControllerIdentifier];
    
    if (!menuItem) {
        
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    }
    return menuItem;
}


/*
 添加控制器,根据数组的个数来添加
 */

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    MenuInfo *menuInfo = self.menuList[pageIndex];
    
    NSString *vcStr=self.vcs[pageIndex];

    
       NSString *identifier = [NSString stringWithFormat:@"%@.identifier.%i",vcStr,pageIndex];
    
        UIViewController *ctrl = [magicView dequeueReusablePageWithIdentifier:JSTabPageViewControllerIdentifier];
        
    
        if (!ctrl) {
            ctrl = [[NSClassFromString(vcStr) alloc] init];
        }
        
        if ([ctrl conformsToProtocol:@protocol(JSTabPageViewControllerDelegate)]) {
            id<JSTabPageViewControllerDelegate> pageViewDelegate=(UIViewController *)ctrl;
            if (pageViewDelegate && [pageViewDelegate respondsToSelector:@selector(pageViewController:menuInfo:)]) {
                [pageViewDelegate pageViewController:ctrl menuInfo:menuInfo];
            }
        }
        
        return ctrl;


    
}



@end
