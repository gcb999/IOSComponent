//
//  JSPhoto+Camera.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/5.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPhoto.h"

@interface JSPhoto (Camera)

#pragma mark -拍照

-(void)camera:(UIViewController *)viewController completion:(JSPhotoCompletion)completion;

@end
