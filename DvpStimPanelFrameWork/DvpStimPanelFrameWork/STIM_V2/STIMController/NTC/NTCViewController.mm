//
//  NTCViewController.m
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//


#import "NTCViewController.h"
#import "ExtensionConst.h"
@interface NTCViewController ()
@property (assign) IBOutlet NSButton *bit120_btn;
@property (assign) IBOutlet NSButton *bit121_btn;

@property (assign) IBOutlet NSButton *bit122_btn;


@property (copy) NSArray *switchBtns;
@end


@implementation NTCViewController


+(instancetype)createViewController{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    NTCViewController *vc = [[NTCViewController alloc] initWithNibName:@"NTCViewController" bundle:bundle];
    return vc;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.switchBtns = @[_bit120_btn,_bit121_btn,_bit122_btn];
     self.allSwitchs = @[@[_bit120_btn,_bit121_btn,_bit122_btn]];
}
-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    if (btn.title.length) {
        
    }else{
        if (tag == 120) {
            btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
        }else if (tag == 121){
            btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
        }else if (tag == 122){
            btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
        }
        
    }
    
    return btnName;
}
- (IBAction)bitBtnsClick:(NSButton *)switchBtn {
    
    [self mutexSwitchsStateWithCurrentSelectedBtn1:switchBtn WithSwitchsArray:self.switchBtns];
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:switchBtn] switchBtn:switchBtn];
 
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
#endif

}




@end
