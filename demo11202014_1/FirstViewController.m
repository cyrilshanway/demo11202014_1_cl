//
//  ViewController.m
//  demo11202014_1
//
//  Created by Brian on 2014/11/20.
//  Copyright (c) 2014年 alphacamp. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
{
    BOOL isShow;
}

@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UIScrollView *backgroundScrollView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation FirstViewController

- (IBAction)show:(id)sender
{
    //一開始設定是隱藏，因為按鈕了，所以依照上一次的設定結果，去決定這次該出現的效果
    if (self.loginView.hidden == YES) {
        self.loginView.hidden = NO;
    }
    else {
        self.loginView.hidden = YES;
    }

//    if (self.infoView.hidden == YES) {
//        self.infoView.hidden = NO;
//    }
//    else {
//        self.infoView.hidden = YES;
//    }

}
- (IBAction)loginAction:(id)sender
{
    NSLog(@"Login Action");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //設定scrollView的長度
    self.backgroundScrollView.contentSize = CGSizeMake(320.0f, 900.0f);

    isShow = NO;

    UIButton *OKButton = [[UIButton alloc]initWithFrame:CGRectMake(16,700,30,30)];
    [OKButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [OKButton setTitle:@"OK" forState:UIControlStateNormal];
    [OKButton setBackgroundColor:[UIColor redColor]];
    [self.backgroundScrollView addSubview:OKButton];

    UIView *image1 = [[UIView alloc] initWithFrame:CGRectMake(10, 600, 140, 80)];
    image1.backgroundColor = [UIColor blackColor];

    UIView *image2 = [[UIView alloc] initWithFrame:CGRectMake(170, 600, 140, 80)];
    image2.backgroundColor = [UIColor blackColor];

    [self.backgroundScrollView addSubview:image1];
    [self.backgroundScrollView addSubview:image2];

    UIView *image3 = [[UIView alloc] initWithFrame:CGRectMake(10, 690, 140, 80)];
    image3.backgroundColor = [UIColor blackColor];

    UIView *image4 = [[UIView alloc] initWithFrame:CGRectMake(170, 690, 140, 80)];
    image4.backgroundColor = [UIColor blackColor];

    [self.backgroundScrollView addSubview:image3];
    [self.backgroundScrollView addSubview:image4];

    NSMutableArray *imageList = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray *buttonList= [NSMutableArray arrayWithCapacity:4];

    for (int i = 0 ; i < 6; i++) {
        
        NSInteger x = 10;
        NSInteger y1 = 200;
        NSInteger y = 0;
        NSInteger w = 140;
        NSInteger h = 80;
        NSInteger g = 20;//間隔
        
        if( (i % 2) == 0) {
            x = 10;
            y = y1 + 0.5*( h + g )* (i-1);
        }
        else {
            x = 170;
            y = y1 + 0.5*( h + g )* (i-2);
        }
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(x, y, 140, 80)];
        [bgView setBackgroundColor:[UIColor grayColor]];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 140, 80)];
        [imageView setImage:[UIImage imageNamed:@"1416508810_699004-icon-18-bookmark-512"]];
        
        [bgView addSubview:imageView];
        //image.backgroundColor = [UIColor grayColor];
        
        
        [imageList addObject:bgView];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(x+10, y+10, 120, 60)];
        button.backgroundColor = [UIColor blueColor];
        button.alpha = 0.5;
        [buttonList addObject:button];
        [button setTag:i];
        
        if (i == 0) {
            [button addTarget:self action:@selector(buttonPressed2VC:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        
        
        
        [self.backgroundScrollView addSubview:bgView];
        [self.backgroundScrollView addSubview:button];
    }}

// OKButton's callback
- (void)buttonPressed:(id)sender
{
    NSLog(@"buttonPressed");
    
}

-(void)buttonPressed2VC:(id)sebder{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
