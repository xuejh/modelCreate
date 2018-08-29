//
//  ViewController.m
//  AutoCreateModel
//
//  Created by 薛锦辉 on 2018/8/20.
//  Copyright © 2018年 薛锦辉. All rights reserved.
//

#import "ViewController.h"
#import "AutoModelPCH.h"
#import "CommonData.h"


@interface ViewController ()

@property (nonatomic,strong)NodeModel *nodeModel;
@property (nonatomic,strong)NSString * preText;
@property (nonatomic,assign)BOOL clickReview;
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

- (IBAction)reviewModelBtnTouchup:(id)sender {
    
    [self initModelData];
    self.preText = self.textView.text;
    self.clickReview = YES;
    NodeModelViewController *nodeVC = [[NodeModelViewController alloc]init];
    nodeVC.nodeModel = self.nodeModel;
    [self.navigationController pushViewController:nodeVC animated:YES];
}

- (void)initModelData{
    NSDictionary *dic = [JsonManage jsonStringToDic:self.textView.text];
    self.nodeModel = [NodeModel nodeModelWithDictionary:dic modelName:self.rootModeltextField.text level:0];
    NSString * preText = self.preTextField.text;
    preText = [preText stringByReplacingOccurrencesOfString:@" " withString:@""];
    [CommonData shareInstance].preText = preText;
    [CommonData shareInstance].nodeModel = self.nodeModel;
    [[CommonData shareInstance] convertNodeModel:self.nodeModel preText:preText];
}

- (IBAction)createModelFileBtnTouchup:(id)sender {
    
    if(self.clickReview && [self.preText isEqualToString:self.textView.text]){
        
        [[CommonData shareInstance]createModelFile];
    }else{
        [self initModelData];
        [[CommonData shareInstance]createModelFile];
    }
    
}


- (void)initFrameData{
    
    [CommonData shareInstance].preText = self.preTextField.text;
    [CommonData shareInstance].frameName = self.frameTextField.text;
    [CommonData shareInstance].modelInCellName = self.cellModelTextField.text;
}

- (IBAction)createFrameFileBtnTouchup:(id)sender {
    
    [self initFrameData];
    [[CommonData shareInstance]createFrameFile];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textView resignFirstResponder];
}
@end
