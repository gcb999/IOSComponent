//
//  JSParallaxEffectViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSParallaxEffectViewController.h"
#import "ParallaxEffectTableViewCell.h"
#import "JSNetWork.h"


@interface JSParallaxEffectViewController ()<JSTableViewDelegate>
{
    
}
@property(nonatomic,strong)JSTableView *tableView;

@property(nonatomic,strong)NSMutableArray *indexCaches;

@end

@implementation JSParallaxEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indexCaches=[NSMutableArray array];
    
    self.tableView=[[JSTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain state:JSTableViewNormal cellClass:[ParallaxEffectTableViewCell class] delegate:self];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight=250;
    NSMutableArray *rights=[NSMutableArray array];
    NSArray *data=@[
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://img.kaiyanapp.com/27dfd1d62de596185a501be6acd0d2b6.jpeg?imageMogr2/quality/60",
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://img.kaiyanapp.com/27dfd1d62de596185a501be6acd0d2b6.jpeg?imageMogr2/quality/60",
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://img.kaiyanapp.com/27dfd1d62de596185a501be6acd0d2b6.jpeg?imageMogr2/quality/60",
                    @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                    @"http://img.kaiyanapp.com/27dfd1d62de596185a501be6acd0d2b6.jpeg?imageMogr2/quality/60"
                    
                    
                    ];
    for (int i=0; i<data.count; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        ParallaxEffectModel *model=[[ParallaxEffectModel alloc] init];
        model.title=title;
        model.url=data[i];
        [self.tableView.dataArray addObject:model];
    }

    
    [self.view addSubview:self.tableView];
   

    
}




-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSString *index=[NSString stringWithFormat:@"%i",indexPath.row];
    if ([self.indexCaches containsObject:index]) {
        
    }
    else{
        

        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
        
        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
        
        scaleAnimation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
        
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
      
        
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [cell.layer addAnimation:scaleAnimation forKey:@"transform"];
        

        
        [self.indexCaches addObject:index];
    }

    ParallaxEffectTableViewCell *pcell=cell;
    [pcell cellOffset];

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

        NSArray<ParallaxEffectTableViewCell *> *array = [self.tableView visibleCells];
        
        [array enumerateObjectsUsingBlock:^(ParallaxEffectTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [obj cellOffset];
        }];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}


@end
