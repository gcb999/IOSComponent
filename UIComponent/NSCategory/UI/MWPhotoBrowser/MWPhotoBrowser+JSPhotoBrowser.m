//
//  MWPhotoBrowser+JSPhotoBrowser.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/31.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "MWPhotoBrowser+JSPhotoBrowser.h"

@interface MWPhotoBrowser ()
{
    
}

@property(nonatomic,copy)NSArray *MPhotos;

@property(nonatomic,copy)NSArray *MThumbs;

@property(nonatomic,weak)id<JSMWPhotoBrowserDelegate> jsDelegate;


@end

static void *MPhoto = &MPhoto;

static void *MThumb = &MThumb;

static void *jsDelegate = &jsDelegate;


@implementation MWPhotoBrowser (JSPhotoBrowser)


#pragma mark -集合
-(void)setMPhotos:(NSMutableArray *)MPhotos{
    
      objc_setAssociatedObject(self, &MPhoto, MPhotos, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSMutableArray *)MPhotos{
    
     return objc_getAssociatedObject(self, &MPhoto);
    
}

-(void)setMThumbs:(NSMutableArray *)MThumbs{
    
       objc_setAssociatedObject(self, &MThumb, MThumbs, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSMutableArray *)MThumbs{
    return objc_getAssociatedObject(self, &MThumb);
}

#pragma mark -代理
-(void)setJsDelegate:(id<JSMWPhotoBrowserDelegate>)jsDelegate{
    
    objc_setAssociatedObject(self, &jsDelegate, jsDelegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<JSMWPhotoBrowserDelegate>)jsDelegate{
    
    return objc_getAssociatedObject(self, &jsDelegate);
    
}


#pragma mark -展示作用

-(id)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles{
    
    if (self=[super init]) {
        
        self.delegate=self;
        self.jsDelegate=delegate;
//        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"Operate" style:UIBarButtonItemStyleDone target:self action:@selector(addPhoto)];
//        self.navigationItem.rightBarButtonItem = rightItem;
//        
        
        
        NSMutableArray *photosArray=[NSMutableArray array];
        for (int i =0 ;i<photos.count;i++) {
            
            NSString *photo_url=photos[i];
            MWPhoto *photo= nil;
            //网络
            if ([photo_url hasPrefix:@"http"])  photo=  [MWPhoto photoWithURL:[NSURL URLWithString:photo_url]];
 
            //本地
            
            else {
//                photo = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:photo_url ofType:nil]]];
                UIImage *image=[UIImage imageNamed:photo_url];
                if (!image) {
                    NSString *path=[[NSBundle mainBundle] pathForResource:photo_url ofType:nil];
                    photo=  [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:path]];
                }
                else{
                     photo=  [MWPhoto photoWithImage:image];
                 
                }
               
            }

            photo.caption =titles[i];
            [photosArray addObject:photo];
            

            
            
        }
        self.MPhotos=photosArray;
   
        
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
        
        
    }
    return self;
    
}



#pragma mark -初始化方法

-(id)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate  thumbs:(NSArray<NSString *> *)thumbs photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles{
    
    if (self =[self initWithDelegate:self photos:photos titles:titles]) {
        
    
        if (!IS_NSArray(thumbs) || !IS_NSArray(photos) || !(thumbs.count==photos.count)) {
            
            return self ;
        }
      
        NSMutableArray *thumbArray=[NSMutableArray array];
        
        for (int i =0 ;i<thumbs.count;i++) {
         

            NSString *thumb_url=thumbs[i];
            MWPhoto *thumb=nil;
            
            if ([thumb_url hasPrefix:@"http"]){//网络
               
                thumb=  [MWPhoto photoWithURL:[NSURL URLWithString:thumb_url]];
            }
            else   //本地
            {
            
             thumb= [MWPhoto photoWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:thumb_url ofType:nil]]];;
            [thumbArray addObject:thumbs];
            
            }
    
        }
        
    
       self.MThumbs=thumbArray;
        
        
        //启用选择
        
        self.displaySelectionButtons = YES;
        self.enableGrid=YES;
        self.startOnGrid=YES;
   
        
        
    }
    return self;
    
}

#pragma mark - MWPhotoBrowserDelegate
//有多少个图片要显示

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    
    return self.MPhotos.count;
    
}


//在具体的index中，显示网络加载或者本地的某一个图片

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser

               photoAtIndex:(NSUInteger)index {
    
    if (index <self.MPhotos.count) {
        
        return [self.MPhotos objectAtIndex:index];
        
    }
    
    return nil;
    
}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected {
//    [_selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
//    NSLog(@"Photo at index %lu selected %@", (unsigned long)index, selected ? @"YES" : @"NO");
}

//加载多张网络缩略图（enableGrid＝ YES）时，才可以实现该委托方法

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index{
    
    if (index <self.MThumbs.count) {
        
        return [self.MThumbs objectAtIndex:index];
        
    }
    
    return nil;
    
}



/*****************************可选实现的代理方法********************************/

//自定义标题

- (NSString *)photoBrowser:(MWPhotoBrowser *)photoBrowser

      titleForPhotoAtIndex:(NSUInteger)index {
    
    
    
    if (self.jsDelegate && [self.jsDelegate respondsToSelector:@selector(MWPhotoBrowser:titleForPhotoAtIndex:)]) {
        return  [self.jsDelegate MWPhotoBrowser:photoBrowser titleForPhotoAtIndex:index];
    }
    
    
    return [NSString stringWithFormat:@"%lu/%lu", (unsigned long)index,
            
            (unsigned long)self.MPhotos.count];
    
}



//自定义底部视图，继承MWCaptionView这个类，在子类中重写-setupCaption和 -sizeThatFits:，或者加视图。

- (MWCaptionView *)photoBrowser:(MWPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index{
    
    MWPhoto *photo = [self.MPhotos objectAtIndex:index];
    
    MWCaptionView *captionView = [[MWCaptionView alloc]initWithPhoto:photo];
    
    //    captionView.
    
    return captionView;
    
    
}


//将displayActionButton（分享按钮）设置为YES时，这个方法才会触发。之前的分享动作就不会出现。

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index{
    
    NSLog(@"content %lu",(unsigned long)index);
    
}




@end
