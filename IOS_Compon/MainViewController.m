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

@interface MainViewController ()<JSTableViewDelegate,JSGroupTableViewDelegate,JSCollectionViewDelegate>
{

    
    UIImageView *imageView;
    UIImagePickerController *picker;
    
}



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    imageView=[UIImageView imageViewImageName:@"" frame:CGRectMake(200, 200, 50, 50)];
    [self.view addSubview:imageView];
    
    
    //先插入
    NSArray *titleArr=@[@"test1",@"test2"];
    
    NSString *sql=[JSFmdb buildInsertTableName:@"HistorySearch" keyArray:@[@"title"] valueArrary:titleArr];
                    
              
  BOOL flag=  [JSFmdb insertTablewithSql:sql];
    
    if (flag) {
        
    [JSFmdb executeQuery:@"select * from HistorySearch " queryResBlock:^(FMResultSet *set) {
       
        while ([set next]) {

            NSLog(@"%@",[set stringForColumn:@"title"]);
        }
        
    }];
        
    }

 

}







-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   

    
    JSPhoto *photo=[[JSPhoto alloc] init];
    
    [photo singlePhoto:self completion:^(BOOL isSucess, NSMutableArray<UIImage *> *image) {
       
        if (isSucess) {
            NSLog(@"---imag=%@",image);
            imageView.image=[image lastObject];
        }
        
        
    }];
    
    return;
    
    
}






@end
