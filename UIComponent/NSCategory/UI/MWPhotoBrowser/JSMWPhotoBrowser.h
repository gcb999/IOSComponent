//
//  JSMWPhotoBrowser.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface JSMWPhotoBrowser : MWPhotoBrowser<MWPhotoBrowserDelegate>

-(instancetype)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles;


@end


@protocol JSMWPhotoBrowserDelegate <NSObject>




//标题
-(NSString *)MWPhotoBrowser:(MWPhotoBrowser*)browser titleForPhotoAtIndex:(NSUInteger)index;

@end


/*----------------------------------------------------

NSArray *urls=@[
                @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png",
                @"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg",
                @"header.JPG"
                ];
NSArray *titles=@[@"test1",@"test2"];

JSMWPhotoBrowser *brower=[[JSMWPhotoBrowser alloc] initWithDelegate:self photos:urls titles:titles];


//    brower.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

//    [self presentViewController:brower animated:YES completion:nil];
 

[self.navigationController pushViewController:brower animated:YES];

----------------------------------------------------*/