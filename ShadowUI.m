#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShadowUI : NSObject
@end

@implementation ShadowUI

+ (void)load {
    // دالة load تعمل تلقائياً عند تحميل المكتبة
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self showStatus];
    });
}

+ (void)showStatus {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* scene in [UIApplication sharedApplication].connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                window = scene.windows.firstObject;
                break;
            }
        }
    }
    if (!window) window = [UIApplication sharedApplication].keyWindow;

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ShadowMaster UI"
                                 message:@"✅ UI Loaded Separately\n🛡️ Protection File Linked"
                                 preferredStyle:1];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:0 handler:nil]];
    
    UIViewController *root = window.rootViewController;
    while (root.presentedViewController) root = root.presentedViewController;
    [root presentViewController:alert animated:YES completion:nil];
}
@end
