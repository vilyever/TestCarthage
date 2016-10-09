//
//  ViewController.m
//  TestCarthage
//
//  Created by Deng on 10/9/16.
//  Copyright © 2016 Deng. All rights reserved.
//

#import "ViewController.h"

@import objcHook;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self vd_hookSelector:@selector(test:) beforeBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        NSLog(@"start test");
    }];
    
    [self vd_hookSelector:@selector(test:) afterBlock:^(VDHookElement *element, VDHookInvocationInfo *info) {
        NSLog(@"end test");
    }];
    
    [self test:@"from viewDidLoad"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self test:@"from viewDidAppear"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Test
- (void)test:(NSString *)param {
    NSLog(@"test %@", param);
}


@end
