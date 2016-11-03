#import "UIImage+imageNamed_bundle_.h"
#import <SSZipArchive.h>

@implementation UIImage (imageNamed_bundle_)

+ (NSString *)yf_sourcePatchKey{
    return @"SOURCE_PATCH";
}



+ (NSString *)yf_relativeCachePathFor:(NSString *)md5
{
    return [@"patch" stringByAppendingPathComponent:md5];
}

+ (void )yf_reset:(void (^)(BOOL success, NSError * error))completionHandler
{
    if ( ! completionHandler) {
        completionHandler = ^(BOOL success, NSError * error){
            // nothing to do...
        };
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey: [self yf_sourcePatchKey]];
    completionHandler(YES, nil);
}


+ (UIImage *)yf_imageNamed:(NSString *)imgName{
    NSString * bundleName = @"main";
    
    /* cache dir */
    NSString * md5 = [[[NSUserDefaults standardUserDefaults] objectForKey: [self yf_sourcePatchKey]] objectForKey:@"md5"];
    
    NSString * relativeCachePath = [self yf_relativeCachePathFor: md5];
    
    return [self yf_imageNamed: imgName bundle:bundleName cacheDir: relativeCachePath];
}

+ (UIImage *)yf_imageNamed:(NSString *)imgName bundle:(NSString *)bundleName cacheDir:(NSString *)cacheDir
{
    NSArray * LibraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    bundleName = [NSString stringWithFormat:@"%@.bundle",bundleName];
    
    NSString * ipaBundleDir = [NSBundle mainBundle].resourcePath;
    NSString * cacheBundleDir = ipaBundleDir;
    
    if (cacheDir) {
        cacheBundleDir = [[[LibraryPaths objectAtIndex:0] stringByAppendingFormat:@"/Caches"] stringByAppendingPathComponent:cacheDir];
    }
    
    imgName = [NSString stringWithFormat:@"%@@3x",imgName];
    
    NSString * bundlePath = [cacheBundleDir stringByAppendingPathComponent: bundleName];
    NSBundle * mainBundle = [NSBundle bundleWithPath:bundlePath];
    NSString * imgPath = [mainBundle pathForResource:imgName ofType:@"png"];
    
    /* try load from ipa! */
    if ( ! imgPath && ! [ipaBundleDir isEqualToString: cacheBundleDir]) {
        bundlePath = [ipaBundleDir stringByAppendingPathComponent: bundleName];
        mainBundle = [NSBundle bundleWithPath:bundlePath];
        imgPath = [mainBundle pathForResource:imgName ofType:@"png"];
    }
    
    UIImage * image;
    static NSString * model;
    
    if (!model) {
        model = [[UIDevice currentDevice]model];
    }
    
    if ([model isEqualToString:@"iPad"]) {
        NSData * imageData = [NSData dataWithContentsOfFile: imgPath];
        image = [UIImage imageWithData:imageData scale:2.0];
    }else{
        image = [UIImage imageWithContentsOfFile: imgPath];
    }
    return  image;
}





@end
