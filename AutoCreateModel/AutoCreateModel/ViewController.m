//
//  ViewController.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/20.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "ViewController.h"
#import "AutoModelPCH.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textView.backgroundColor = [UIColor yellowColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnTouchup:(id)sender {
    
    NSDictionary *dic = [JsonManage jsonStringToDic:self.textView.text];
    NodeModel *nodeModel = [NodeModel nodeModelWithDictionary:dic modelName:self.textField.text level:0];
    NodeModelViewController1 *nodeVC = [[NodeModelViewController1 alloc]init];
    nodeVC.nodeModel = nodeModel;
    [self.navigationController pushViewController:nodeVC animated:YES];
}
- (IBAction)modelBtnTouchup:(id)sender {
    
    NSDictionary *dic = [JsonManage jsonStringToDic:self.textView.text];
    NodeModelViewController *nodeVC = [[NodeModelViewController alloc]init];
    NodeModel *nodeModel = [NodeModel nodeModelWithDictionary:dic modelName:self.textField.text level:0];
    nodeVC.nodeModel = nodeModel;
    [self.navigationController pushViewController:nodeVC animated:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textView resignFirstResponder];
}
@end
