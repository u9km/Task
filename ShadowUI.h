#import <UIKit/UIKit.h>

@interface ShadowUI : NSObject
+ (void)alert:(NSString *)title msg:(NSString *)msg;
@end

@implementation ShadowUI
+ (void)alert:(NSString *)title msg:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *a = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:1];
        [a addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:a animated:YES completion:nil];
    });
}
@end
