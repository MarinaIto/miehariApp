//
//  ThirdViewController.m
//  miehariApp
//
//  Created by Marina Ito on 2015/08/13.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController (){
    AppDelegate *_appDelegate;
}


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _appDelegate = [[UIApplication sharedApplication]delegate];
    
    self.title = _appDelegate.detailList;
    NSLog(@"%@",_appDelegate.detailList);
    
    self.thirdImage.image = [UIImage imageNamed:_appDelegate.detailListImage];
    self.commentLabel.text = _appDelegate.detailComment;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
