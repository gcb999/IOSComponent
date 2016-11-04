//
//  JSPhoto+PhotoAlbum.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPhoto+PhotoAlbum.h"

@implementation JSPhoto (PhotoAlbum)

-(void)PhotoAlbum:(UIViewController *)viewController maximumNumberOfSelection:(NSInteger)maximumNumberOfSelection completion:(JSPhotoCompletion)completion{
    
    //相册
    if (![cameraHelper checkPhotoLibraryAuthorizationStatus]) {
        return;
    }
    self.viewController=viewController;
    self.photoCompletion=completion;
    
    QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];

    imagePickerController.filterType = QBImagePickerControllerFilterTypePhotos;
    imagePickerController.delegate = self;
    imagePickerController.maximumNumberOfSelection = maximumNumberOfSelection;
    imagePickerController.allowsMultipleSelection = YES;
      imagePickerController.showsNumberOfSelectedAssets = YES;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:imagePickerController];
    [viewController presentViewController:navigationController animated:YES completion:NULL];

}

#pragma mark UINavigationControllerDelegate, QBImagePickerControllerDelegate

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets{
    
    NSLog(@"%@",assets);
    NSMutableArray<UIImage *> *imageMutableArray = [NSMutableArray array];
    for (ALAsset * asset in assets) {
        
        ALAssetRepresentation *assetRep = [asset defaultRepresentation];
        CGImageRef imgRef = [assetRep fullResolutionImage];   //获取高清图片
        UIImage *img = [UIImage imageWithCGImage:imgRef
                                           scale:assetRep.scale
                                     orientation:(UIImageOrientation)assetRep.orientation];
        CGImageRef ref = [asset thumbnail];    //获取缩略图
        UIImage *thumbnailImg = [[UIImage alloc]initWithCGImage:ref];
        [imageMutableArray addObject:thumbnailImg];
    }

    self.photoCompletion(JSPhotoOK,imageMutableArray);
 
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController{
    
        self.photoCompletion(JSPhotoCancel,nil);
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}


@end
