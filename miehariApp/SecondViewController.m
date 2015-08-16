//
//  SecondViewController.m
//  miehariApp
//
//  Created by Marina Ito on 2015/08/13.
//  Copyright (c) 2015年 Marina Ito. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController (){
 AppDelegate *_appDelegate; //定義
    NSDictionary *_testDict;
    NSDictionary *_carsDict;
    NSMutableArray *_nationalCarsKeyAry;
    NSDictionary *_nationalCarsDict;
    NSArray *_nCarsAry;
    NSDictionary  *_nCarsDict;
    NSDictionary *_watchDict;
    NSArray *_watchKeyAry;
    NSArray *_companyKeyAry;
    
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _secondTableView.dataSource = self;
    _secondTableView.delegate = self;
    _appDelegate = [[UIApplication sharedApplication] delegate];//初期化
    
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    //NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    NSString *testPath = [bundle pathForResource:@"test" ofType:@"plist"];
    
    //プロパティリストの中身データを取得
    //_allAry = [NSArray arrayWithContentsOfFile:path];
    _testDict = [NSDictionary dictionaryWithContentsOfFile:testPath];
    //NSLog(@"_textDict = %@", _testDict);
    
    _carsDict = _testDict[@"自動車"];
    //NSLog(@"carsDict = %@", _carsDict);
    
    
    
    NSArray *carsKeyAryFake =[_carsDict allKeys];
    NSLog(@"fake =%@", carsKeyAryFake);
    
    _nationalCarsKeyAry =[carsKeyAryFake mutableCopy];
    
    //_carsKeyAry = [NSMutableArray arrayWithArray:carsKeyAryFake];
    
    //    _carsKeyAry = carsKeyAryFake[4];
    //    NSLog(@"carsKeyAry =%@", _carsKeyAry);
    
    [_nationalCarsKeyAry exchangeObjectAtIndex:0
                     withObjectAtIndex:4];
    [_nationalCarsKeyAry exchangeObjectAtIndex:1
                     withObjectAtIndex:5];
    [_nationalCarsKeyAry exchangeObjectAtIndex:1
                     withObjectAtIndex:4];
    
    
    
    
    NSLog(@"natianalCarsKeyAry =%@", _nationalCarsKeyAry);
    
    // 配列の中身(日本語文字)を見るコツ
    //for (int i  = 0; i < _carsKeyAry.count; i++) {
    //   NSLog(@"carsKeyAry : %i = %@",i,_carsKeyAry[i]);
    //}
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // セクション数を設定
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        i = [_nationalCarsKeyAry count];
    } else if (_appDelegate.iPath == 1){
        i = 1;
    }
    
    return i;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 各セクションにおける行数(rows)を設定
    
    
    
    NSInteger i;
    if (_appDelegate.iPath == 0) {
        _nationalCarsDict = _carsDict[_nationalCarsKeyAry[section]];
        NSLog(@"nationalCarsDict = %@",_nationalCarsDict);
        NSArray *_companyKeyAry = [_nationalCarsDict allKeys];
        NSLog(@"_companyKeyAry %@", _companyKeyAry);
        i = [_companyKeyAry count];
    } else if (_appDelegate.iPath == 1){
        i = [_testDict[@"時計"] count];
    }
    
    return i;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // セクションタイトルの文字列変数を宣言
    NSString *title;
    //NSLog(@"carskeyAry = %@",_carsKeyAry);
    //NSLog(@"carsKeyAryのsection =%@" ,_carsKeyAry[section]);
    
    
    // 表示しているセクションのタイトルをplistに登録しているものと合致させる
    
    if (_appDelegate.iPath == 0) {
        title = _nationalCarsKeyAry[section];
        
    } else if (_appDelegate.iPath == 1){
        
        title = @"時計ブランド";
    }
    return title;
}
//行に表示するデータを表示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
   
    // numberOfRowsInSectionで設定した各セクションのrows分だけindexPath.rowがループする
    if (_appDelegate.iPath == 0) {
        
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        
        _nCarsDict  = _carsDict[_nationalCarsKeyAry[indexPath.section]];
        NSLog(@"nCarsDict = %@",_nCarsDict);
        _nCarsAry = [_nCarsDict allKeys];
        NSLog(@"nCarsAry = %@",_nCarsAry);
        
        NSString *carTitle = _nCarsDict[_nCarsAry[indexPath.row]][@"名前"];
        NSString *carImage = _nCarsDict[_nCarsAry[indexPath.row]][@"画像"];
        NSLog(@"cartitle = %@", carTitle);
        NSLog(@"carImage = %@", carImage);
        imageView.image = [UIImage imageNamed:carImage];
        label.text = carTitle;

        
        
    } else if (_appDelegate.iPath == 1){
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
        UILabel *label = (UILabel *)[cell viewWithTag:2];
        _watchDict =  _testDict[@"時計"];
        NSLog(@"watchDict = %@",_watchDict);
        _watchKeyAry = [_watchDict allKeys];
        NSString *watchImage = _watchDict[_watchKeyAry[indexPath.row]][@"画像"];
        NSString　*watchTitle = _watchKeyAry[indexPath.section];
        imageView.image = [UIImage imageNamed:watchImage];
        label.text = watchTitle;
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"セルがタップされた");
    NSLog(@"indexPath.row =%d : %d ",indexPath.section,indexPath.row);
    
    
    
    //時計
//    NSDictionary *detailWatchDict = _watchDict[_watchKeyAry[indexPath.row]];
//    NSLog(@"watchKeyAry =%@", _watchKeyAry);
//    NSLog(@"detailWatchDict　=%@",detailWatchDict);
//    NSArray *detailWatchAry = detailWatchDict[@"画像"];
//    NSLog(@"detailWatchAry =%@", detailWatchAry);
//    
//    //タップしたcellとリンクする配列の中身（名前）を取得
//    NSLog(@"リストの中身 = %@", _watchKeyAry[indexPath.row]);
//    NSLog(@"リストの画像　= %@", detailWatchAry[indexPath.row]);

    
   // NSLog(@"リストの中身 = %@", _carsKeyAry[indexPath.row][indexPath.row];
        //AppDelegateクラスのlistプロパティーに_ary配列のindexPath.rowで指定した名前を代入
//    NSLog(@"appDelegate.list = %@",_appDelegate.list);
    
    
    NSDictionary *sectionDict = _carsDict[_nationalCarsKeyAry[indexPath.section]];
    NSLog(@"sectionDict =%@", sectionDict);
    NSArray *sectionAry = [sectionDict  allKeys];
    NSLog(@"sectionAry =%@",sectionAry);
    

//    NSLog(@"nCarsAry = %@" ,_nCarsAry);
//    NSLog(@"nationalCarsDict =%@" ,_nationalCarsDict);
//    NSLog(@"_nationalCarsKeyAry =%@", _nationalCarsKeyAry);
    
    
    if (_appDelegate.iPath == 0) {
        
    
    
        _appDelegate.detailList= sectionDict[sectionAry[indexPath.row]][@"名前"];
        _appDelegate.detailListImage = sectionDict[sectionAry[indexPath.row]][@"画像"];
        _appDelegate.detailComment = sectionDict[sectionAry[indexPath.row]][@"コメント"];
//        
//        //_appDelegate.detailList= _nCarsDict[_nCarsAry[indexPath.section]][@"名前"];
//        //_appDelegate.detailListImage = _nCarsDict[_nCarsAry[indexPath.row]][@"画像"];
//        
//        NSLog(@"リストの中身 = %@",　_nCarsDict[_nCarsAry[indexPath.row]][@"名前"]);
    
   } else if (_appDelegate.iPath == 1){
        
        _appDelegate.detailList= _watchKeyAry[indexPath.row];
        //NSDictionary *detailWatchDict = _watchDict[_watchKeyAry[indexPath.section]];
        
        _appDelegate.detailListImage = _watchDict[_watchKeyAry[indexPath.row]][@"画像"];
       _appDelegate.detailComment = _watchDict[_watchKeyAry[indexPath.row]][@"コメント"];
         //NSLog(@"リストの中身 = %@",_watchDict[_watchKeyAry][@"名前"][indexPath.row]);
        
    }
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
