//
//  ViewController.m
//  DemoForStr
//
//  Created by Rickie_Lambert on 2017/11/17.
//  Copyright © 2017年 RickieLambert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *str = @"我一个人看H完了《七月与安生》，在电影的开头男H主角偶遇几年未见H的安生，他问安生：七月怎样？安生说：我不知道，我们已经很久没有联系了。";
    
    UILabel *lblA = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 300, 30)];
    lblA.backgroundColor = [UIColor cyanColor];
    lblA.text = @"目标";
    lblA.textColor = [UIColor blackColor];
    [self.view addSubview:lblA];
    
    UILabel *lblTarget = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    lblTarget.backgroundColor = [UIColor orangeColor];
    lblTarget.text = str;
    lblTarget.numberOfLines = 0;
    lblTarget.textColor = [UIColor blackColor];
    [self.view addSubview:lblTarget];
    
    
    NSString *strResult = [self subStringComponentsSeparatedByStrContent:str strPoint:@"H" firstFlag:1 secondFlag:3];
    
    
    UILabel *lblB = [[UILabel alloc] initWithFrame:CGRectMake(20, 330, 300, 30)];
    lblB.backgroundColor = [UIColor cyanColor];
    lblB.text = @"截取的结果";
    lblB.textColor = [UIColor blackColor];
    [self.view addSubview:lblB];
    
    UILabel *lblResult = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 300, 100)];
    lblResult.backgroundColor = [UIColor yellowColor];
    lblResult.text = strResult;
    lblResult.numberOfLines = 0;
    lblResult.textColor = [UIColor blackColor];
    [self.view addSubview:lblResult];
    
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(30, 460, 100, 50)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
}

#pragma mark - 封装一个截取字符串中同一个字符之间的字符串
/**
 参数说明：
 1.strContent:传入的目标字符串
 2.strPoint:标记位的字符
 3.firstFlag:从第几个目标字符开始截取
 4.secondFlag:从第几个目标字符结束截取
 */
- (NSString *)subStringComponentsSeparatedByStrContent:(NSString *)strContent strPoint:(NSString *)strPoint firstFlag:(int)firstFlag secondFlag:(int)secondFlag
{
    /** 例如字符串如下：
     "A小草166 邀请你为好友A#testmm#*小草166*Dhttp://duoroux.com/chat/avatar/6.jpgD"
     */
    // 初始化一个起始位置和结束位置
    NSRange startRange = NSMakeRange(0, 1);
    NSRange endRange = NSMakeRange(0, 1);
    
    // 获取传入的字符串的长度
    NSInteger strLength = [strContent length];
    // 初始化一个临时字符串变量
    NSString *temp = nil;
    // 标记一下找到的同一个字符的次数
    int count = 0;
    // 开始循环遍历传入的字符串，找寻和传入的 strPoint 一样的字符
    for(int i = 0; i < strLength; i++)
    {
        // 截取字符串中的每一个字符,赋值给临时变量字符串
        temp = [strContent substringWithRange:NSMakeRange(i, 1)];
        // 判断临时字符串和传入的参数字符串是否一样
        if ([temp isEqualToString:strPoint]) {
            // 遍历到的相同字符引用计数+1
            count++;
            if (firstFlag == count)
            {
                // 遍历字符串，第一次遍历到和传入的字符一样的字符
                NSLog(@"第%d个字是:%@", i, temp);
                // 将第一次遍历到的相同字符的位置，赋值给起始截取的位置
                startRange = NSMakeRange(i, 1);
            }
            else if (secondFlag == count)
            {
                // 遍历字符串，第二次遍历到和传入的字符一样的字符
                NSLog(@"第%d个字是:%@", i, temp);
                // 将第二次遍历到的相同字符的位置，赋值给结束截取的位置
                endRange = NSMakeRange(i, i);
            }
        }
    }
    // 根据起始位置和结束位置，截取相同字符之间的字符串的范围
    NSRange rangeMessage = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    // 根据得到的截取范围，截取想要的字符串，赋值给结果字符串
    NSString *result = [strContent substringWithRange:rangeMessage];
    // 打印一下截取到的字符串，看看是否是想要的结果
    NSLog(@"截取到的 strResult = %@", result);
    // 最后将结果返回出去
    return result;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
