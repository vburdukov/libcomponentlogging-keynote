//
//  ViewController.m
//  log
//
//  Created by Vladimir Burdukov on 11/13/12.
//  Copyright (c) 2012 Vladimir Burdukov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    lcl_log(lcl_cUI, lcl_vCritical, @"should implement viewDidAppear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
