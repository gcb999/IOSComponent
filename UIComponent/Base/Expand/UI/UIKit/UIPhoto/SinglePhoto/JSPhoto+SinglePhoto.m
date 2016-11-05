//
//  JSPhoto+SinglePhoto.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/5.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPhoto+SinglePhoto.h"

@implementation JSPhoto (SinglePhoto)


-(void)singlePhoto:(UIViewController *)viewController completion:(JSPhotoCompletion)completion{
    
    if (![cameraHelper checkPhotoLibraryAuthorizationStatus]) {
        return;
    }
    self.viewController=viewController;
    self.photoCompletion=completion;

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [viewController presentViewController:picker animated:YES completion:nil];
}


#pragma mark UIImagePickerControllerDelegate


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    // 获取图片
    UIImage *pickerImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (pickerImage && [pickerImage isKindOfClass:[UIImage class]]) {
        
        //保持相册
//        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
//        [assetsLibrary writeImageToSavedPhotosAlbum:[pickerImage CGImage] orientation:(ALAssetOrientation)pickerImage.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
//            
//        }];
        
        NSMutableArray<UIImage *> *images=[NSMutableArray array];
        [images addObject:pickerImage];
        self.photoCompletion(JSPhotoOK,images);
    }
    
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    self.photoCompletion(JSPhotoCancel,nil);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}




@end
