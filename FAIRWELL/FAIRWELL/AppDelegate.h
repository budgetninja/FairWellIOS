//
//  AppDelegate.h
//  FAIRWELL
//
//  Created by Winnie Liang on 10/28/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MMDrawerController *drawerContainer;
-(void) buildUserInterface;


@end

