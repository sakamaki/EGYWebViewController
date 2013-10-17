//
//  EGYWebViewController.h
//
//  Created by Mokhles Hussien on 29.08.2013.
//  Copyright 2013 iMokhles. All rights reserved.
//
//  https://github.com/iMokhles/EGYWebViewController

#import <MessageUI/MessageUI.h>

@protocol EGYWebViewControllerDelegate <NSObject>
- (void)startAnimatingIndicator;
- (void)stopAnimatingIndicator;
@end

@interface EGYWebViewController : UIViewController

@property (nonatomic, assign) id < EGYWebViewControllerDelegate > delegate;
- (id)initWithAddress:(NSString*)urlString;
- (id)initWithURL:(NSURL*)URL;

@end
