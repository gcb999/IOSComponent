//
//  JSDetailsPageImageView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSDetailsPageImageView.h"
#import "JSMWPhotoBrowser.h"

@interface JSDetailsPageImageView ()<SDCycleScrollViewDelegate>
{
    
    
}

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;//滚动


@property (nonatomic , strong) UILabel *pageLabel;//页码



@end



@implementation JSDetailsPageImageView

- (instancetype)initWithFrame:(CGRect)frame orignUrl:(NSString *)orignUrl
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (IS_NSString(orignUrl) && [orignUrl hasPrefix:@"http"]) {
                    self.cycleScrollView.imageURLStringsGroup=@[orignUrl];
        }

        [self addSubview:self.cycleScrollView];
        [self addSubview:self.pageLabel];
        
        
        
    }
    return self;
}

-(void)setSmallImgUrls:(NSArray *)smallImgUrls{

    if(_smallImgUrls!=smallImgUrls){
   
    _smallImgUrls = smallImgUrls;
    self.cycleScrollView.imageURLStringsGroup = smallImgUrls;
    self.pageLabel.text = [NSString stringWithFormat:@"1 / %i",self.smallImgUrls.count];
    
    }
    
    
}




#pragma mark -getter

-(SDCycleScrollView *)cycleScrollView{
    if (_cycleScrollView==nil) {
        // 网络加载 --- 创建带标题的图片轮播器
        _cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"ItemDetailBannerFailToLoad"]];
        _cycleScrollView.backgroundColor=[UIColor whiteColor];
        _cycleScrollView.infiniteLoop = NO;
        _cycleScrollView.autoScroll = NO;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        
    }
    return _cycleScrollView;
}

- (UILabel *)pageLabel
{
    if (!_pageLabel) {
        _pageLabel = [UILabel LabWithFrame:CGRectMake(self.bounds.size.width-68, self.bounds.size.width - 23, 60, 15) text:@"" textColor:[UIColor colorWithHexColorString:@"#666666"] textAlign:NSTextAlignmentRight font:[UIFont systemFontOfSize:12]];
        //        _pageLabel.alpha = 0.8;
        //        _pageLabel.layer.cornerRadius = 20;
        //        _pageLabel.layer.masksToBounds = YES;
        //        _pageLabel.backgroundColor = rgb(153, 153, 153);
    }
    return _pageLabel;
}


#pragma mark -SDCycleScrollViewDelegate

/** 图片点击回调 */

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
    
    if (IS_NSArray(self.bigImgUrls)) {
        
        JSMWPhotoBrowser *brower=[[JSMWPhotoBrowser alloc] initWithDelegate:self photos:self.bigImgUrls titles:nil];
        brower.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        if (index<self.bigImgUrls.count) {
//            ctrl.lastPage=index;
        }
        
        [[self viewController] presentViewController:brower animated:YES completion:nil];
        
      
    }

    
    
    
    

    
}



/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"--------%i========%i",self.smallImgUrls.count,index);
    self.pageLabel.text = [NSString stringWithFormat:@"%i / %i",index + 1,self.smallImgUrls.count];
}


@end
