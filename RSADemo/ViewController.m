//
//  ViewController.m
//  RSADemo
//
//  Created by hank on 2021/4/12.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // !!!: - 将p12和der替换为自己生成的文件
    
    //1.加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    
    //2.加载私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //加密
    NSData *result = [[RSACryptor sharedRSACryptor] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *base64 = [result base64EncodedStringWithOptions:0];
    NSLog(@"%@",base64);
    
    //解密
    NSData *jiemi = [[RSACryptor sharedRSACryptor] decryptData:result];
    NSLog(@"解密:%@",[[NSString alloc] initWithData:jiemi encoding:NSUTF8StringEncoding]);
}


@end
