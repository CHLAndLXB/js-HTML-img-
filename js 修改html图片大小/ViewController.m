//
//  ViewController.m
//  js 修改html图片大小
//
//  Created by huochaihy on 16/10/12.
//  Copyright © 2016年 CHL. All rights reserved.
//

#import "ViewController.h"

#define HTMLString @"<div id=\"webview_content_wrapper\"><p>美女美女美女美女美女美女美女美女美女美女美女美女</p><p><img alt=\"代步车\" src=\"http://img5.duitang.com/uploads/item/201504/23/20150423H4645_idmEA.thumb.700_0.jpeg\"></p><p>美女美女美女美女美女美女美女美女美女美女</p></div>"  // 注意不能带style属性

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:webView];
    [webView loadHTMLString:HTMLString baseURL:nil];
    webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
   
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:
     @"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     
     "script.text = \"function ResizeImages(){"
     "var imgArr = document.getElementsByTagName('img');"
     "for(var i = 0; i<imgArr.length; i++){"// 图片宽度
     "imgArr[i].style.width = document.documentElement.clientWidth + 'px';"
     "imgArr[i].style.height = 'auto';"
     "}"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    
}
@end
