//
//  ViewController.h
//  JSONQuery
//
//  Created by Chauster Kung on 2013/10/23.
//  Copyright (c) 2013年 Chauster Kung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
@property (nonatomic, strong) NSMutableData *responseData;

@end
