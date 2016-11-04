//
//  ParallaxEffectTableViewCell.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "ParallaxEffectTableViewCell.h"

@implementation ParallaxEffectTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, -(IPHONScreenHeight/1.7 -250)/2, IPHONScreenWidth, IPHONScreenHeight/1.7)];
        
        _picture.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView  addSubview:_picture];
        
        _coverview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 250)];
        _coverview.backgroundColor = [UIColor colorWithWhite:0 alpha:0.33];
        [self.contentView addSubview:_coverview];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250 / 2 - 30, IPHONScreenWidth, 30)];
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_titleLabel];
        
        _littleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250 / 2 + 30, IPHONScreenWidth, 30)];
        
        _littleLabel.font = [UIFont systemFontOfSize:14];
        
        _littleLabel.textAlignment = NSTextAlignmentCenter;
        
        _littleLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_littleLabel];
        
        
        
    }
    return self;
    
}





-(void)JSTableView:(JSTableView *)tableView originalData:(NSArray *)originalData content:(id)content indexPath:(NSIndexPath *)indexpath{
    
    ParallaxEffectModel *model=content;
    
    [self  loadingImageview:self.picture url:model.url placeholderImageName:nil failedImageName:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
   
    _titleLabel.text = model.title;
    
       
}

- (CGFloat)cellOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    CGPoint windowCenter = self.superview.center;
    
    CGFloat cellOffsetY = centerY - windowCenter.y;
    
    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height *2;
    
    CGFloat offset =  -offsetDig * (IPHONScreenHeight/1.7 - 250)/2;
    
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
//        self.titleLabel.transform = transY;
//        self.littleLabel.transform = transY;
    
    self.picture.transform = transY;
    
    return offset;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
//        NSArray<EveryDayTableViewCell *> *array = [self.tableView visibleCells];
//        
//        [array enumerateObjectsUsingBlock:^(EveryDayTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            
//            [obj cellOffset];
//        }];

    
}


@end
