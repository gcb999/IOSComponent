//
//  NSObject+UICateGory.m
//  HGMobile
//
//  Created by zy on 13-2-20.
//
//

#import "NSObject+UICateGory.h"

@implementation NSObject (UICateGory)

@end


@implementation UILabel (ext)

+(UILabel*)LabWithFrame:(CGRect)_rect text:(NSString*)aText textColor:(UIColor*)aColor textAlign:(NSTextAlignment)aAlign font:(UIFont*)aFont{
    UILabel *lab = [[UILabel alloc] initWithFrame:_rect] ;
    lab.backgroundColor = [UIColor clearColor];
    if ([aText length] > 0)
        lab.text = aText;
    if (aColor)
        lab.textColor = aColor;
    if(aAlign)
        lab.textAlignment = aAlign;
    if (aFont)
        lab.font = aFont;
    return lab;
}
@end

@implementation UIButton (ext)

+ (UIButton *)ButtonWithImageName:(NSString*)aImageName hImageName:(NSString*)aHImageName frame:(CGRect)aFrame title:(NSString *)aTitle titleColor:(UIColor *)aColor font:(UIFont *)aFont target:(id)aTarget action:(SEL)aAction{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = aFrame;
    if ([aImageName length] > 0) {
        UIImage *bgImg = [UIImage imageWithContentsOfFile:BUNDLE_PATH_IMAGENAME(aImageName)];
        if (bgImg==nil) {
            bgImg=[UIImage imageNamed:aImageName];
        }
        if ([bgImg respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
            [button setBackgroundImage:[bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(bgImg.size.height/2, bgImg.size.width/2, bgImg.size.height/2, bgImg.size.width/2)] forState:UIControlStateNormal];
        }else {
            [button setBackgroundImage:[bgImg stretchableImageWithLeftCapWidth:bgImg.size.width/2 topCapHeight:bgImg.size.height/2] forState:UIControlStateNormal];
        }
    }
    if ([aHImageName length] > 0)
    {
        UIImage *bgImg = [UIImage imageWithContentsOfFile:BUNDLE_PATH_IMAGENAME(aHImageName)];
        if (bgImg==nil) {
            bgImg=[UIImage imageNamed:aHImageName];
        }
        
        if ([bgImg respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
            [button setBackgroundImage:[bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(bgImg.size.height/2, bgImg.size.width/2, bgImg.size.height/2, bgImg.size.width/2)] forState:UIControlStateHighlighted];
        }else {
            [button	setBackgroundImage:[bgImg stretchableImageWithLeftCapWidth:bgImg.size.width/2 topCapHeight:bgImg.size.height/2] forState:UIControlStateHighlighted];
        }
    }

    if ([aTitle length] > 0)
        [button setTitle:aTitle forState:UIControlStateNormal];
    if (aColor)
        [button setTitleColor:aColor forState:UIControlStateNormal];
    if (aFont)
        button.titleLabel.font = aFont;
    [button addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
+ (UIButton *)ButtonWithSystemImage:(CGRect)aFrame title:(NSString *)aTitle titleColor:(UIColor *)aColor font:(UIFont *)aFont target:(id)aTarget action:(SEL)aAction{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = aFrame;
    if ([aTitle length] > 0)
        [button setTitle:aTitle forState:UIControlStateNormal];
    if (aColor)
        [button setTitleColor:aColor forState:UIControlStateNormal];
    if (aFont)
        button.titleLabel.font = aFont;
    [button addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


@end

@implementation UIImageView (ext)

+ (UIImageView *)ImageViewImageName:(NSString*)aImageName frame:(CGRect)aRect{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:aRect];
    imageView.userInteractionEnabled = YES;
    if(aImageName ==nil || [aImageName isEqualToString:@""] || aImageName.length==0){
        return imageView;
    }
    else{
        UIImage *aImage = [UIImage imageWithContentsOfFile:BUNDLE_PATH_IMAGENAME(aImageName)];
        if (aImage==nil) {
            aImage=[UIImage imageNamed:aImageName];
        }
        if ([aImage respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
            imageView.image = [aImage resizableImageWithCapInsets:UIEdgeInsetsMake(aImage.size.height/2, aImage.size.width/2, aImage.size.height/2, aImage.size.width/2)];
        } else {
            imageView.image = [aImage stretchableImageWithLeftCapWidth:aImage.size.width/2 topCapHeight:aImage.size.height/2];
        }
    }
    return imageView;
}

@end


@implementation UITableView (ext)

+ (UITableView *)TableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor delegate:(id)delegate separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView setBackgroundColor:backgroundColor];
    [tableView setDelegate:delegate];
    [tableView setDataSource:delegate];
    [tableView setSeparatorStyle:separatorStyle];
    
    return tableView;
}

@end

@implementation UITextField (ext)

+(UITextField*)TextFieldWithFrame:(CGRect)_rect target:(id)target textColor:(UIColor*)aTextColor textAlign:(NSTextAlignment)aAlign placeHolder:(NSString*)holder clearMode:(UITextFieldViewMode)aViewMode returnKey:(UIReturnKeyType)returnKeyType keyBord:(UIKeyboardType)keyBord{
    UITextField *textField = [[UITextField alloc] initWithFrame:_rect];
    textField.backgroundColor = [UIColor clearColor];
    textField.delegate = target;
    textField.returnKeyType = returnKeyType;
    textField.keyboardType = keyBord;
    if (aAlign)
        textField.textAlignment = aAlign;
    if (aTextColor)
        textField.textColor = aTextColor;
    if (aViewMode)
        textField.clearButtonMode = aViewMode;
    if ([holder length] > 0)
        textField.placeholder = holder;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    return textField;
}

@end

#pragma mark ********** UIImage *************

@implementation UIImage (ext)

+ (UIImage *) ImageWithColor: (UIColor *) color frame:(CGRect)aFrame
{
    aFrame = CGRectMake(0, 0, aFrame.size.width, aFrame.size.height);
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, aFrame);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}




+ (UIImage*)ImageViewImageName:(NSString*)aImageName {
    
    UIImage *aImage = [UIImage imageNamed:aImageName];
    if ([aImage respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        aImage = [aImage resizableImageWithCapInsets:UIEdgeInsetsMake(aImage.size.height/2, aImage.size.width/2, aImage.size.height/2, aImage.size.width/2)];
    } else {
        aImage = [aImage stretchableImageWithLeftCapWidth:aImage.size.width/2 topCapHeight:aImage.size.height/2];
    }
    return aImage;
}

@end


