//
//  EGYModalWebViewController.m
//
//  Created by Mokhles Hussien on 29.08.2013.
//  Copyright 2013 iMokhles. All rights reserved.
//
//  https://github.com/iMokhles/EGYWebViewController

#import "EGYModalWebViewController.h"
#import "EGYWebViewController.h"

@interface EGYModalWebViewController ()

@property (nonatomic, strong) EGYWebViewController *webViewController;

@end


@implementation EGYModalWebViewController {
    UIActivityIndicatorView *indicatorView;
}

@synthesize barsTintColor, webViewController;

#pragma mark - Initialization


- (id)initWithAddress:(NSString*)urlString {
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
- (id)initWithURL:(NSURL *)URL {
    self.webViewController = [[EGYWebViewController alloc] initWithURL:URL];
    self.webViewController.delegate = self;
    if (self = [super initWithRootViewController:self.webViewController]) {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        }
        else {
            indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        }
        self.webViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:webViewController action:@selector(doneButtonClicked:)];
        UIBarButtonItem *activityButtonItem = [[UIBarButtonItem alloc] initWithCustomView:indicatorView];
        self.webViewController.navigationItem.rightBarButtonItem = activityButtonItem;

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    
    self.webViewController.title = self.title;
    self.navigationBar.tintColor = self.barsTintColor;
}

#pragma mark - EGYWebViewControllerDelegate

- (void)startAnimatingIndicator {
    [indicatorView startAnimating];
}

- (void)stopAnimatingIndicator {
    [indicatorView stopAnimating];
}

@end
