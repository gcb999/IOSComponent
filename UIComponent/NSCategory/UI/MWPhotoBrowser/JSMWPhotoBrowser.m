//
//  JSMWPhotoBrowser.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSMWPhotoBrowser.h"

@interface JSMWPhotoBrowser ()
{
    
}

@property(nonatomic,strong)NSMutableArray<MWPhoto *> *JSPhotos;//保存所有的大图路径

@property(nonatomic,strong)NSMutableArray<MWPhoto *> *JSThums;//保存所有缩略图的路径

@property(nonatomic,strong)NSMutableArray *selections;


@property(nonatomic,weak)id<JSMWPhotoBrowserDelegate> JSDelegate;




@end

@implementation JSMWPhotoBrowser


-(instancetype)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles{
    if (self =[super init]) {
        
        self.delegate=self;
        
        self.JSDelegate=delegate;
        

        
        //头部分享按钮，默认是
        self.displayActionButton =NO;//YES 是显示  NO是隐藏

        //底部是否分页切换导航，默认否
        self.displayNavArrows =NO;


        //导航栏是否显示,默认否
        self.alwaysShowControls =YES;

        //自动适用大小,默认是
        self.zoomPhotosToFill =YES;

        self.zoomPhotosToFill = NO;//是否全屏,默认是


        self.enableSwipeToDismiss = NO;
        
        
        [self setCurrentPhotoIndex:0];

        
        
        self.JSPhotos=[NSMutableArray array];
        for (int i =0 ;i<photos.count;i++) {
            
            NSString *photo_url=photos[i];
            MWPhoto *photo= nil;
            
            if ([photo_url hasPrefix:@"http"])  {//网络
                
                photo=  [MWPhoto photoWithURL:[NSURL URLWithString:photo_url]];
                
            }
            
            else {
              
                UIImage *image=[UIImage imageNamed:photo_url];
                if (image) {
                    photo=  [MWPhoto photoWithImage:image];
                }
                else{
                    
                    NSString *path=[[NSBundle mainBundle] pathForResource:photo_url ofType:nil];
                    photo=  [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:path]];
                    
                }
                
            }
            if (i<titles.count) {
                photo.caption =titles[i];
            }
            
            [self.JSPhotos addObject:photo];
            
            
            
            
        }

        
        
    }
    return self;
}



#pragma mark - MWPhotoBrowserDelegate


//返回图片个数
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.JSPhotos.count;
}

//返回图片模型
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.JSPhotos.count)
        return [self.JSPhotos objectAtIndex:index];
    return nil;
}





//自定义标题

- (NSString *)photoBrowser:(MWPhotoBrowser *)photoBrowser

      titleForPhotoAtIndex:(NSUInteger)index {



    if (self.JSDelegate && [self.JSDelegate respondsToSelector:@selector(MWPhotoBrowser:titleForPhotoAtIndex:)]) {
        return  [self.JSDelegate MWPhotoBrowser:photoBrowser titleForPhotoAtIndex:index];
    }


    return [NSString stringWithFormat:@"%lu/%lu", (unsigned long)index,

            (unsigned long)self.JSPhotos.count];

}



//自定义底部视图，继承MWCaptionView这个类，在子类中重写-setupCaption和 -sizeThatFits:，或者加视图。

- (MWCaptionView *)photoBrowser:(MWPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index{

    MWPhoto *photo = [self.JSPhotos objectAtIndex:index];

    MWCaptionView *captionView = [[MWCaptionView alloc]initWithPhoto:photo];

    //    captionView.

    return captionView;


}


//将displayActionButton（分享按钮）设置为YES时，这个方法才会触发。之前的分享动作就不会出现。

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index{

    NSLog(@"content %lu",(unsigned long)index);

}





@end
