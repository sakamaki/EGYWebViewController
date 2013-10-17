//
//  EGYModalWebViewController.h
//
//  Created by Mokhles Hussien on 29.08.2013.
//  Copyright 2013 iMokhles. All rights reserved.
//
//  https://github.com/iMokhles/EGYWebViewController

#import <UIKit/UIKit.h>
#import "EGYWebViewController.h"


@class EGYWebViewController;

@interface EGYModalWebViewController : UINavigationController <EGYWebViewControllerDelegate>

- (id)initWithAddress:(NSString*)urlString;
- (id)initWithURL:(NSURL *)URL;

@property (nonatomic, strong) UIColor *barsTintColor;

@end
