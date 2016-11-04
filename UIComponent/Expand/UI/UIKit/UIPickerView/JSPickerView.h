//
//  JSPickerView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JSPickerView;

typedef void(^pickerViewCompleteBlock)(JSPickerView *pickerView ,NSString *text);



@interface JSPickerView : UIView

@property(nonatomic,strong)   UIPickerView* pickerView;
//推荐使用
- (instancetype)initWithHeight:(CGFloat)height data:(NSArray *)dataArray complete:(pickerViewCompleteBlock)complete;

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *)dataArray complete:(pickerViewCompleteBlock)complete;

@end

/*------------------------------用法---------------------

JSPickerView *picker=[[JSPickerView alloc] initWithHeight:200 data:@[@"1",@"2"] complete:^(JSPickerView *pickerView, NSString *text) {
    
}];
[[UIWindow window] addSubview:picker];

------------------------------*/