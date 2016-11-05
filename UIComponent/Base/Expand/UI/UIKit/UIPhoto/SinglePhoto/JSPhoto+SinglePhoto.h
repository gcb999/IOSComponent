//
//  JSPhoto+SinglePhoto.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/5.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPhoto.h"

@interface JSPhoto (SinglePhoto)

#pragma mark -单张相册

-(void)singlePhoto:(UIViewController *)viewController completion:(JSPhotoCompletion)completion;
@end
