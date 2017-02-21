//
//  MainViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "MainViewController.h"
#import "JSSwipeTableCell.h"
#import "JSCollectionViewCell.h"
#import "JSPickerView.h"
#import "JSTabPageViewController.h"
#import "JSMWPhotoBrowser.h"
#import "JSParallaxEffectViewController.h"
#import "UIImage+imageNamed_bundle_.h"
#import "JSHotUpdate.h"
#import "JSPhoto.h"
#import "JSNewFeature.h"
#import "JSDetailsPageImageView.h"
#import "JSPhoto.h"
#import "JSFmdb.h"
#import "HomeView.h"
//#import "DBCameraContainerViewController.h"

@interface MainViewController ()<JSTableViewDelegate,JSGroupTableViewDelegate,JSCollectionViewDelegate>
{
    HomeView *homeView;
    
}



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    homeView=[[HomeView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:homeView];
    [homeView reload:@[@"",@""]];

}













@end
