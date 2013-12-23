//
//  ViewController.m
//  JSONQuery
//
//  Created by Chauster Kung on 2013/10/23.
//  Copyright (c) 2013年 Chauster Kung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    [self wsLooking];
}

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1

//抓取playList中的vidoe 遞迴取值
- (void)wsLooking{
    dispatch_async(kBgQueue, ^{

        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"url"]];
        [self performSelectorOnMainThread:@selector(fetchedDataFromPlayList:) withObject:data waitUntilDone:YES];
    });
}

-(void)fetchedDataFromPlayList:(NSData*)responseData {
    
    if (responseData) {
        
        NSError *error     = nil;
        NSDictionary *json = [NSJSONSerialization
                              JSONObjectWithData:responseData
                              options:kNilOptions
                              error:&error];
        NSLog(@"%@",json);
//        NSArray *catalogs_ = [[json objectForKey:@"feed"] objectForKey:@"entry"];
//        for (int i = 0; i<[catalogs_ count]; i++) {
//            NSDictionary *catalogItem = [catalogs_ objectAtIndex:i];
//            NSString *name = [[(NSDictionary*)[[catalogItem objectForKey:@"author"] objectAtIndex:0] objectForKey:@"name"] objectForKey:@"$t"];
//            NSLog(@"title = %@",name);
//            NSLog(@"content = %@",[[(NSDictionary*)catalogItem objectForKey:@"content"]objectForKey:@"$t"]);
//        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
