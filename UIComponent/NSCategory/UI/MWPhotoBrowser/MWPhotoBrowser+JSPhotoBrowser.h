//
//  MWPhotoBrowser+JSPhotoBrowser.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/31.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>
#import <objc/runtime.h>
@protocol JSMWPhotoBrowserDelegate;



@interface MWPhotoBrowser (JSPhotoBrowser)<MWPhotoBrowserDelegate>

-(id)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate   photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles;




-(id)initWithDelegate:(id<MWPhotoBrowserDelegate>)delegate  thumbs:(NSArray<NSString *> *)thumbs photos:(NSArray<NSString *> *)photos titles:(NSArray<NSString *> *)titles;

@end

@protocol JSMWPhotoBrowserDelegate <NSObject>

//标题
-(NSString *)MWPhotoBrowser:(MWPhotoBrowser*)browser titleForPhotoAtIndex:(NSUInteger)index;

@end