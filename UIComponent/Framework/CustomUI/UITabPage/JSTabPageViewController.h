//
//  JSTabPageViewController.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTMagic.h"
#import "MenuInfo.h"
#import "JSTabPageViewController.h"
#import "JSTabPageViewControllerDelegate.h"


//参考文章http://www.jianshu.com/p/cb2edb21055f

static NSString *const JSTabPageViewControllerIdentifier = @"JSTabPageViewControllerIdentifier";

@interface JSTabPageViewController : VTMagicController

- (instancetype)initWithMenu:(NSMutableArray<MenuInfo *> *)menuInfo vcs:(NSMutableArray<NSString*> *)vcs;



@property (nonatomic, strong)  NSMutableArray<MenuInfo *> *menuList;

@property (nonatomic , strong) NSMutableArray<NSString*> * vcs;




@end


/*------------------------------用法---------------------

 
 
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSMutableArray *menuList = [NSMutableArray array];
    for (int index = 0; index < 3; index++) {
        NSString *  title = [NSString stringWithFormat:@"省份%d", index];
        MenuInfo *menu = [MenuInfo menuInfoWithTitle:title];
        [menuList addObject:menu];
    }
    NSArray *vcs=@[@"FirstCtrl",@"secondCtrl",@"LeftViewController"];
    
    
    if (page ==0) {//第一种用法
        
        ctl=[[JSTabPageViewController alloc] init];
        ctl.menuList=menuList;
        ctl.vcs=vcs;
        [self.navigationController pushViewController:ctl animated:YES];
    }
    else if (page ==1)//第二种用法
    {
        
        
        
        ctl=[[JSTabPageViewController alloc] initWithMenu:menuList vcs:vcs];
        
        [self.navigationController pushViewController:ctl animated:YES];
        
        
    }
    else if (page==2){//第3种用法
        ctl=[[JSTabPageViewController alloc] init];
        ctl.menuList=menuList;
        ctl.vcs=vcs;
        ctl.view.frame=CGRectMake(0, 64, IPHONScreenWidth, IPHONScreenHeight-64);
        [self.view addSubview:ctl.view];
        [self addChildViewController:ctl];
        
    }
    
    
    page++;
    
}

 
 ------------------------------*/



