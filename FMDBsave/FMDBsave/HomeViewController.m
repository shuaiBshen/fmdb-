//
//  HomeViewController.m
//  FMDBsave
//
//  Created by 申帅 on 16/4/7.
//  Copyright © 2016年 申帅. All rights reserved.
//

#import "HomeViewController.h"
#import "DataModel.h"
#import "BookMerkDao.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [BookMerkDao saveBookmark:@{@"id":@"1",@"content":@"嘿嘿1",@"url":@"http://wap.baidu.com"}];
    [BookMerkDao saveBookmark:@{@"id":@"2",@"content":@"嘿嘿2",@"url":@"http://wap.baidu.com"}];
    [BookMerkDao saveBookmark:@{@"id":@"3",@"content":@"嘿嘿3",@"url":@"http://wap.baidu.com"}];
    [BookMerkDao saveBookmark:@{@"id":@"4",@"content":@"嘿嘿4",@"url":@"http://wap.baidu.com"}];
    [BookMerkDao saveBookmark:@{@"id":@"5",@"content":@"嘿嘿5",@"url":@"http://wap.baidu.com"}];
    [BookMerkDao saveBookmark:@{@"id":@"6",@"content":@"嘿嘿6",@"url":@"http://wap.baidu.com"}];
    NSLog(@"%@",[BookMerkDao findAllBookMark]);
    // Do any additional setup after loading the view.
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
