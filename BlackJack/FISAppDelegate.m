//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISBlackjackPlayer *game = [[FISBlackjackPlayer alloc]init];
    NSLog(@"%@", game.description);
    return YES;
}

@end
