//
//  ViewController.m
//  funyCamera
//
//  Created by Đỗ Hữu Điển on 12/18/13.
//  Copyright (c) 2013 Đỗ Hữu Điển. All rights reserved.
//

#import "ViewController.h"
#import "CamAndPhoto.h"

@interface ViewController (){
    BOOL isCamera;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Camera:(id)sender {
    isCamera = true;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (IBAction)CameraFBack:(id)sender {
}

- (IBAction)Album:(id)sender {
    isCamera = false;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [popover presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.album.frame.origin.y, 200, 100) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        self.popOver = popover;
    } else {
        [self presentViewController:picker animated:YES completion:NULL];
    }

}
- (IBAction)info:(id)sender {
}
- (IBAction)w:(id)sender {
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *choseImage;
    CamAndPhoto *camphoto = [[CamAndPhoto alloc] init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad && !isCamera) {
        choseImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self presentViewController:camphoto animated:YES completion:^{
            camphoto.imageview.image = choseImage;
        }];
    }else{
        choseImage = info[UIImagePickerControllerOriginalImage];
        [picker dismissViewControllerAnimated:YES completion:^{
            [self presentViewController:camphoto animated:YES completion:^{
                camphoto.imageview.image = choseImage;
            }];
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

@end
