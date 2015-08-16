//
//  AppDelegate.h
//  miehariApp
//
//  Created by Marina Ito on 2015/08/13.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    int iPath;
    NSString *list;
}

@property(nonatomic,strong) NSString *list;

@property(nonatomic,assign) int iPath;
@property(nonatomic,assign) int detailPath;


@property(nonatomic,strong) NSString *detailList;
@property(nonatomic,strong) NSString *detailListImage;
@property(nonatomic,strong) NSString *detailComment;



@property (strong, nonatomic) UIWindow *window;


@end

