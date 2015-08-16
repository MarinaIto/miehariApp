//
//  SecondViewController.h
//  miehariApp
//
//  Created by Marina Ito on 2015/08/13.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;

@end
