//
//  TDFViewController.m
//  TDFModuleKit
//
//  Created by tripleCC on 10/23/2017.
//  Copyright (c) 2017 tripleCC. All rights reserved.
//

#import "TDFViewController.h"

@interface TDFViewController ()

@end

@implementation TDFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"resultA %d", [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"ftp://ggboy"] options:@{}]);
    NSLog(@"resultB %d", [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ggboy"] options:@{}]);
    
    NSLog(@"resultC %d", [[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] shouldAllowExtensionPointIdentifier:@"LALALA"]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
