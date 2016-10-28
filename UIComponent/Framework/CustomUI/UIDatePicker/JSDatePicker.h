//
//  JSDatePicker.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSDatePicker;

typedef void(^datePickerCompleteBlock)(JSDatePicker *datePicker ,NSString *text);



@interface JSDatePicker : UIView

@property(nonatomic,strong)   UIDatePicker* datePkView;

//推荐使用
- (instancetype)initWithHeight:(CGFloat)height complete:(datePickerCompleteBlock)complete;

- (instancetype)initWithFrame:(CGRect)frame complete:(datePickerCompleteBlock)complete;

@end

/*------------------------------用法---------------------

 JSDatePicker *data=[[JSDatePicker alloc] initWithHeight:200 complete:^(JSDatePicker *datePicker, NSString *text) {
    
}];
[[UIWindow window] addSubview:data];

 ------------------------------*/