//
//  ViewController.m
//  log
//
//  Created by Vladimir Burdukov on 11/13/12.
//  Copyright (c) 2012 Vladimir Burdukov. All rights reserved.
//

#import "ViewController.h"
#import "Network.h"
#undef ql_component
#define ql_component lcl_cNT

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    lcl_log(lcl_cUI, lcl_vInfo, @"View did load");
    qlinfo_c(lcl_cUI, @"View did load");
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    lcl_log(lcl_cUI, lcl_vInfo, @"View did appear");
    qlinfo(@"View did appear");
    [self.activity startAnimating];
    [[Network sharedInstance] addDownloadingBlock:^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ipecho.net/plain"]];
        
        NSError *error;
        NSHTTPURLResponse *response;
//        lcl_log(lcl_cNT, lcl_vTrace, @"start downloading");
        qltrace(@"start downloading");
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        lcl_log(lcl_cNT, lcl_vTrace, @"finish downloading");
        qltrace(@"finish downloading");
//        lcl_log(lcl_cNT, lcl_vTrace, @"process errors, status codes and response string");
        qltrace(@"process errors, status codes and response string");
//        lcl_log(lcl_cNT, lcl_vTrace, @"process error");
        qltrace(@"process error");
        if (error)
        {
//            lcl_log(lcl_cNT, lcl_vError, @"%@", [error userInfo]);
            qlerror(@"%@", [error userInfo]);
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Request failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.activity stopAnimating];
            });
        }
        else
        {
//            lcl_log(lcl_cNT, lcl_vTrace, @"process status code");
            qltrace(@"process status code");
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (response.statusCode < 200 || response.statusCode >= 300)
            {
//                lcl_log(lcl_cNT, lcl_vWarning, @"response code: %d", response.statusCode);
                qlwarning(@"response code: %d", response.statusCode);
//                lcl_log(lcl_cNT, lcl_vWarning, @"response string: %@", responseString);
                qlwarning(@"response string: %@", responseString);
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Request failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    [self.activity stopAnimating];
                });
            }
            else
            {
//                lcl_log(lcl_cNT, lcl_vTrace, @"process response string");
                qltrace(@"process response string");
//                lcl_log(lcl_cNT, lcl_vInfo, @"status OK");
                qlinfo(@"status OK");
//                lcl_log(lcl_cNT, lcl_vInfo, @"response string: %@", responseString);
                qlinfo(@"response string: %@", responseString);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.label.text = responseString;
                    [self.activity stopAnimating];
                });
            }
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
