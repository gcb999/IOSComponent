//
//  NSObject+UICateGory.h
//  HGMobile
//
//  Created by zy on 13-2-20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>






@interface NSObject (UICateGory)

@end

@interface UILabel (ext)

+(UILabel*)LabWithFrame:(CGRect)_rect text:(NSString*)aText textColor:(UIColor*)aColor textAlign:(NSTextAlignment)aAlign font:(UIFont*)aFont;

@end

#pragma mark ********** UIButton *************

@interface UIButton (ext)

+ (UIButton *)ButtonWithImageName:(NSString*)aImageName hImageName:(NSString*)aHImageName frame:(CGRect)aFrame title:(NSString *)aTitle titleColor:(UIColor *)aColor font:(UIFont *)aFont target:(id)aTarget action:(SEL)aAction;

+ (UIButton *)ButtonWithSystemImage:(CGRect)aFrame title:(NSString *)aTitle titleColor:(UIColor *)aColor font:(UIFont *)aFont target:(id)aTarget action:(SEL)aAction;
@end

#pragma mark ********** UIImageView *************
@interface UIImageView (ext)

+ (UIImageView *)ImageViewImageName:(NSString*)aImageName frame:(CGRect)aRect;



@end


#pragma mark ********** UITableView *************
@interface UITableView (ext)

+ (UITableView *)TableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor delegate:(id)delegate separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;


@end

#pragma mark ********** UITextField *************

@interface UITextField (ext)

+(UITextField*)TextFieldWithFrame:(CGRect)_rect target:(id)target textColor:(UIColor*)aTextColor textAlign:(NSTextAlignment)aAlign placeHolder:(NSString*)holder clearMode:(UITextFieldViewMode)aViewMode returnKey:(UIReturnKeyType)returnKeyType keyBord:(UIKeyboardType)keyBord;

@end


#pragma mark ********** UIImage *************

@interface UIImage (ext)

+ (UIImage *) ImageWithColor: (UIColor *) color frame:(CGRect)aFrame;

+ (UIImage*)ImageViewImageName:(NSString*)aImageName ;
@end




