//
//  JSPhoto.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QBImagePickerController.h"
#import "cameraHelper.h"

typedef NS_ENUM (NSInteger,JSPhotoState) {
    /** 成功 */
    JSPhotoOK = 1,
    /** 取消 */
    JSPhotoCancel=2,

};



typedef void (^JSPhotoCompletion)(BOOL isSucess,NSMutableArray<UIImage *> * image);

@interface JSPhoto : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate,QBImagePickerControllerDelegate>


#pragma mark -只读
@property (nonatomic , strong) UIViewController * viewController;

//block
@property(nonatomic,copy)JSPhotoCompletion photoCompletion;


#pragma mark -拍照

-(void)camera:(UIViewController *)viewController completion:(JSPhotoCompletion)completion;

#pragma mark -相册

-(void)PhotoAlbum:(UIViewController *)viewController maximumNumberOfSelection:(NSInteger)maximumNumberOfSelection completion:(JSPhotoCompletion)completion;

@end
