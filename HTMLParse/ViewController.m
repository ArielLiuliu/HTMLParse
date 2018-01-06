//
//  ViewController.m
//  HTMLParse
//
//  Created by lx on 2018/1/6.
//  Copyright © 2018年 lx. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取html的NSData数据
    NSString *urlString = @"http://www.cnblogs.com/YouXianMing/";
    
    NSData *htmlData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    //解析hmtl数据
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    
    //根据标签来进行过滤
    NSArray *dataArray = [xpathParser searchWithXPathQuery:@"//title"];
    
    //开始整理数据
    for (TFHppleElement *httpElement in dataArray) {
        //打印出该节点所有内容（包含标签）
        NSLog(@"%@", httpElement.raw);
        
        //打印出该节点所有内容(不包含标签)
        NSLog(@"%@", httpElement.text);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
