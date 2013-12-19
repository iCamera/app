//
//  CamAndPhoto.m
//  funyCamera
//
//  Created by Đỗ Hữu Điển on 12/18/13.
//  Copyright (c) 2013 Đỗ Hữu Điển. All rights reserved.
//

#import "CamAndPhoto.h"
#import "AppDelegate.h"
@interface CamAndPhoto ()

@end

@implementation CamAndPhoto

@synthesize imageview,image1;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGSize size = image1.size;
    float scale = size.width/[AppDelegate W];
    float hight = size.height / scale;
    [self.imageview setFrame:CGRectMake(0, 0, [AppDelegate W], hight)];
    [self.imageview setCenter:CGPointMake([AppDelegate W]/2, [AppDelegate H]/2)];
    [imageview setImage:image1];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"MainView"]) {
        // Get destination view
        [self setImage1:nil];
        [self setImageview:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setting:(id)sender {
        if ([self.scrollview isHidden]) {
            [self showFrame];
            [self.scrollview setHidden:NO];
            [self.viewbutton setHidden:NO];
            [sender setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        }
        else{
            [self.viewbutton setHidden:YES];
            [self.scrollview setHidden:YES];
            [sender setImage:[UIImage imageNamed:@"Setting.png"] forState:UIControlStateNormal];
        }
}

-(void)showFrame{
    int rect,rect1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        rect = 41;//iphone
    rect1 = 60;
    }
    else {rect = 71;//ipad
        rect1 = 100;
    }
    
    for (int i = 0; i <= 31; i++) {
        UIButton* btl_frame = [[UIButton alloc] init];
        btl_frame.frame = CGRectMake(rect * i, 0, rect-1, rect1);
        btl_frame.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        btl_frame.tag = i;
        [btl_frame addTarget:self action:@selector(btl_setframe:) forControlEvents:UIControlEventTouchUpInside];
        [btl_frame setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"Frame/frame%i.png",i]] forState:UIControlStateNormal];
        [self.scrollview addSubview:btl_frame];
        btl_frame = nil;
    }
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    [self.scrollview setContentSize:CGSizeMake(rect * 32, rect1)];//iphone
    else [self.scrollview setContentSize:CGSizeMake(rect * 32, rect1)];//ipad
}

- (IBAction)btl_setframe:(id)sender{
    if ([sender tag] == 0) {
        [self.imageFrame setHidden:YES];
    }
    else{
        [self.imageFrame setHidden:NO];
        self.imageFrame.image = [sender currentBackgroundImage];
    }
}

- (IBAction)tollimage:(id)sender {
    
}
@end
