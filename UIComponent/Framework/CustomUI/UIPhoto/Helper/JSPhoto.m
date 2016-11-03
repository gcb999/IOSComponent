//
//  JSPhoto.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPhoto.h"



@implementation JSPhoto

#pragma mark -拍照

-(void)camera:(UIViewController *)viewController completion:(JSPhotoCompletion)completion{
    
    if (![cameraHelper checkCameraAuthorizationStatus]) {
        return;
    }
    self.viewController=viewController;
    self.photoCompletion=completion;
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;//设置可编辑
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [viewController presentViewController:picker animated:YES completion:nil];//进入照相界面

}



#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
   
    // 获取图片
    UIImage *pickerImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //保持相册
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary writeImageToSavedPhotosAlbum:[pickerImage CGImage] orientation:(ALAssetOrientation)pickerImage.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
    
    }];
    
    self.photoCompletion(JSPhotoOK,@[pickerImage]);
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    self.photoCompletion(JSPhotoCancel,nil);

    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end
