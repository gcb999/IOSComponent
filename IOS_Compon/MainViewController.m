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
#import "SearchDAO.h"
#import "JSMWPhotoBrowser.h"
#import "JSParallaxEffectViewController.h"
#import "UIImage+imageNamed_bundle_.h"
#import "JSHotUpdate.h"
#import "JSPhoto.h"
#import "JSNewFeature.h"
#import "JSDetailsPageImageView.h"
#import <QuickLook/QuickLook.h>  

@interface MainViewController ()<JSTableViewDelegate,JSGroupTableViewDelegate,JSCollectionViewDelegate>
{
    NSInteger page;
    JSTabPageViewController *ctl;
    
    UIImageView *imageView;
    
}

@property(nonatomic,strong) NSMutableArray *photos;

@property(nonatomic,strong) NSMutableArray *details;

@property(nonatomic,strong)JSDetailsPageImageView * imageDetail;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    [self.view addSubview:self.imageDetail];

    [self.view addSubview:imageView];
 

}





-(JSDetailsPageImageView *)imageDetail{
    if (_imageDetail==nil) {
        _imageDetail=[[JSDetailsPageImageView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 300) orignUrl: @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png"];

    }
    return _imageDetail;
}



//_imageDetail.smallImgUrls=model.bannerSmallUrls;
//_imageDetail.bigImgUrls=model.bannerBigUrls;

//弹出选择框
-(void)showActionForPhoto
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"从相册选择",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)modalView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        JSPhoto *photo=[[JSPhoto alloc] init];
        [photo camera:self completion:^(BOOL isSucess, NSMutableArray<UIImage *> *image) {
            if (isSucess) {
                
            }
            else{
                
            }
            
        }];
    }else if (buttonIndex == 1){
          JSPhoto *photo=[[JSPhoto alloc] init];
        [photo PhotoAlbum:self maximumNumberOfSelection:2 completion:^(BOOL isSucess, NSMutableArray<UIImage *> *image) {
            imageView.image=[image lastObject];
            
        }];
    }
}

#pragma mark UINavigationControllerDelegate, QBImagePickerControllerDelegate

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets{
    
    
}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *urls1=@[
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
                     @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png"
                    ];
      self.imageDetail.smallImgUrls=urls1;
    self.imageDetail.bigImgUrls=urls1;
    return;
    
    
    JSHotUpdate *update=[[JSHotUpdate alloc] init];
    [update updateCompletion:^(BOOL isSuccess, NSDictionary *backDic, NSError *error) {
        UIImage * image = [UIImage yf_imageNamed:@"sub/sample"];
        imageView.image = image;
    }];;
    
    
    
    return;
    
    
    JSParallaxEffectViewController *ctlr=[[JSParallaxEffectViewController alloc] init];
    [self.navigationController pushViewController:ctlr animated:YES];
    
    return;
    
   
    // Browser
    self.photos = [NSMutableArray array];
    
    self.details=[NSMutableArray array];
    
    
    
    
//     Add photos
    NSArray *urls=@[
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
                    @"header.JPG"
                    ];
    
    
    NSArray *titles=@[@"test1",@"test2"];
    
    JSMWPhotoBrowser *brower=[[JSMWPhotoBrowser alloc] initWithDelegate:self photos:urls  titles:titles];


//    brower.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
   //  [self presentViewController:brower animated:YES completion:nil];

   [self.navigationController pushViewController:brower animated:YES];
    
    // Manipulate
//    [browser showNextPhotoAnimated:YES];
//    [browser showPreviousPhotoAnimated:YES];
//    [browser setCurrentPhotoIndex:10];
    
    return;
    
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
        ctl.pageViewStyle=pageviewDivide;
         [self.navigationController pushViewController:ctl animated:YES];
    }
    else if (page ==1)//第二种用法
    {

    
 
        ctl=[[JSTabPageViewController alloc] initWithMenu:menuList vcs:vcs];
        ctl.pageViewStyle=pageviewBubble;
        [self.navigationController pushViewController:ctl animated:YES];
        
    
    }
    else if (page==2){//第3种用法
        ctl=[[JSTabPageViewController alloc] init];
        ctl.menuList=menuList;
        ctl.vcs=vcs;
        ctl.pageViewStyle=pageviewMiddle;
        ctl.view.frame=CGRectMake(0, 64, IPHONScreenWidth, IPHONScreenHeight-64);
        [self.view addSubview:ctl.view];
        [self addChildViewController:ctl];
        
    }
 

    page++;

}




-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [[JSTabBarControllerConfig shareInstance] showBadgeOnItemIndex:0 badge:@"3" animation:YES];
}

#pragma mark -collectionView
-(void)collectioinView{
    
    JSCollectionViewWaterfallLayout *layount=[[JSCollectionViewWaterfallLayout alloc] init];
    layount.sectionInset=UIEdgeInsetsMake(2, 2, 2, 2);
    JSCollectionView *collectionView=[[JSCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layount delegate:self state:JSCollectionViewHeaderFooter cellClass:[JSCollectionViewCell class]];
       [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
    [self.view addSubview:collectionView];
    
}

-(CGSize)JSCollectionView:(JSCollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

-(void)JSCollectionView:(JSCollectionView *)collectionView LoadRequestCurrentPage:(NSInteger)currentPage{
    if (currentPage==1) {
        [collectionView.dataArray removeAllObjects];
        [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
    
        [collectionView reloadHeader];
    }
    else{
        [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
        [collectionView reloadFooter];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"---%@",scrollView);
}


-(void)JSCollectionView:(JSCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--%d",indexPath.row);
}

#pragma mark -tableview

-(void)groupTableviwe{
    JSGroupTableView *tableview=[[JSGroupTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];

    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    tableview.rightSwipeModel=rights;
    
    
    [self.view addSubview:tableview];
    
}

-(void)JSGroupTableView:(JSGroupTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage{
    
    if (currentPage==1) {
        [tableview.sections removeAllObjects];
        [tableview.rowsOfSectionDic removeAllObjects];
        
        //section
        NSString *key=[NSString stringWithFormat:@"%d",currentPage];
        NSMutableArray *temps=[NSMutableArray array];
        for (int i=0; i<2; i++) {
            NSString *str=[NSString stringWithFormat:@"--%d",i];
            [temps addObject:str];
        }
        [tableview.sections addObject:key];
        [tableview.rowsOfSectionDic addEntriesFromDictionary:@{key:temps}];
        [tableview reloadHeader];
        
    }
    else{
   
        NSString *key=[NSString stringWithFormat:@"%d",currentPage];
        NSMutableArray *temps=[NSMutableArray array];
        for (int i=0; i<2; i++) {
            NSString *str=[NSString stringWithFormat:@"--%d",i];
            [temps addObject:str];
        }
        [tableview.sections addObject:key];
        [tableview.rowsOfSectionDic addEntriesFromDictionary:@{key:temps}];
        [tableview reloadFooter];
    }
}



#pragma mark -tableview

-(void)tableviwe{
    JSTableView *tableview=[[JSTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];
    [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    tableview.rightSwipeModel=rights;
    
    
    [self.view addSubview:tableview];
    
}

-(void)JSTableView:(JSTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage{
 
//    JSGroupTableView *table
    if (currentPage==1) {
        [tableview.dataArray removeAllObjects];
        [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
        NSLog(@"---%@",tableview.dataArray);
        [tableview reloadHeader];
    }
    else{
        [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
        NSLog(@"---%@",tableview.dataArray);
        [tableview reloadFooter];
    }
  

    
}

@end
