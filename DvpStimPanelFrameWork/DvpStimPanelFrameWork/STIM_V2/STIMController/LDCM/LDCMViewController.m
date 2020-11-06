//
//  LDCMViewController.m
//  DUT_Tool
//
//  Created by ciwei luo on 2020/8/24.
//  Copyright © 2020 ___Intelligent Automation___. All rights reserved.
//

#import "LDCMViewController.h"
#import "ExtensionConst.h"
#define kNotificationOnLoadProfile            @"On_ReloadProfileByRecMsg"
@interface LDCMViewController ()

@property (assign) IBOutlet NSButton *imagBtn1;

@property (assign) IBOutlet NSButton *imagBtn2;

@property (assign) IBOutlet NSButton *imagBtn3;
@property (assign) IBOutlet NSImageView *image1;
@property (assign) IBOutlet NSImageView *image2;

@property (assign) IBOutlet NSButton *btnTrace1;
@property (assign) IBOutlet NSButton *btnTrace2;
@property (assign) IBOutlet NSTextField *powerBoardView;
@property (assign) IBOutlet NSTextField *vauleDisplay;
@property (assign) IBOutlet NSTextField *descLabel;

@end

@implementation LDCMViewController
//+(instancetype)allocInit{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    
//    LDCMViewController *vc = [[self alloc] initWithNibName:NSStringFromClass([LDCMViewController class]) bundle:bundle];
//    return vc;
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
//    NSInteger state = self.imagBtn1.state;
    NSLog(@"111");
    NSString *path = [[NSBundle mainBundle]pathForResource:@"information.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *desc = [dic objectForKey:@"LDCM_Desc"];
    if (desc.length) {
        self.descLabel.stringValue = desc;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector
                                                     :@selector(vauleDisplay:) name
                                                     :@"getMeasurementValue" object
                                                     :nil] ;
}

-(void)vauleDisplay:(NSNotification*)nf{
    NSDictionary *userInfo = [nf userInfo];
    
    if ([userInfo objectForKey:@"measurement"]) {
      //  coefficient =[[userInfo objectForKey:@"coefficient"] intValue];
        
        self.vauleDisplay.stringValue =[userInfo objectForKey:@"measurement"];
    }
}

- (IBAction)pbSetClick:(NSButton *)btn {

#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:btn] switchBtn:btn];
    
#else //suncode


    if ([btn.title.lowercaseString containsString:@"set"]) {
        NSString *textVaule =self.powerBoardView.stringValue;
        if (textVaule.length) {
            [CommandHandler generateCommandWithSwitchBtn:btn text:textVaule];
        }
    }else{
        self.btnTrace2.state =0;

        [self setSwitchImage:@"switch3_on" switchBtn:self.btnTrace2];
        [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    }
    
#endif

}


-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    if (btn.title.length) {
        if (tag ==1017) {
            NSString *textName = [NSString stringWithFormat:@"%@",self.powerBoardView.stringValue];
            btnName = [self joinSwitchBtnAndTextName:@"Set_PowerBoard_VBUS" textName:textName];
            
        }else if (tag==1018){
            NSString *textName = [NSString stringWithFormat:@"%@",self.powerBoardView.stringValue];
            btnName = [self joinSwitchBtnAndTextName:@"Off_PowerBoard_VBUS" textName:textName];
        }
        
    }else{
        
        btnName = [self joinSwitchBtnAndTextName:[NSString stringWithFormat:@"S%ld",tag] textName:@""];
    }
    
    return btnName;
}


- (IBAction)traceClick:(NSButton *)btn {
    [self setSwitch3BtnImage:btn];
    
    
#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:btn] switchBtn:btn];
    
#else //suncode
      [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
#endif
  
}



- (IBAction)imagBtnsClick:(NSButton *)btn {
    
    
    [self setSwitch4BtnImage:btn];
#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:btn] switchBtn:btn];
    
#else //suncode
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
#endif
    
}

-(void)setSwitch4BtnImage:(NSButton *)switchBtn{
    NSInteger state = switchBtn.state;
    self.imagBtn1.state = state;
    self.imagBtn2.state = state;
    self.imagBtn3.state = state;
    if (state) {
        [self setSwitchImage:@"Canvas 4.jpg" switchBtn:self.imagBtn1];
        [self setSwitchImage:@"Canvas 4.jpg" switchBtn:self.imagBtn2];
        [self setSwitchImage:@"Canvas 4.jpg" switchBtn:self.imagBtn3];
    }else{
 
        [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn1];
        [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn2];
        [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn3];
    }
}


- (IBAction)btnsClick:(NSButton *)btn {
    
    NSInteger btn_tag = btn.tag;
    if (btn_tag==1001) {

        [self setImageView:self.image1 imageName:@"image1.jpg"];
    }else if (btn_tag==1002){
        [self setImageView:self.image1 imageName:@"image2.jpg"];

    }else if (btn_tag==1003){
        [self setImageView:self.image1 imageName:@"image3.jpg"];

    }else if (btn_tag==1004){
        [self setImageView:self.image1 imageName:@"image4.jpg"];

    }else if (btn_tag==1005){
        [self setImageView:self.image1 imageName:@"image5.jpg"];

    }else if (btn_tag==1006){
        [self setImageView:self.image1 imageName:@"image6.jpg"];

    }else if (btn_tag==1007){
        [self setImageView:self.image1 imageName:@"image7.jpg"];

    }else if (btn_tag==1008){
        [self setImageView:self.image1 imageName:@"image8.jpg"];

    }else if (btn_tag==1009){
        [self setImageView:self.image2 imageName:@"image9.jpg"];

    }else if (btn_tag==1010){
        [self setImageView:self.image2 imageName:@"image10.jpg"];

    }else if (btn_tag==1011){
        [self setImageView:self.image2 imageName:@"image11.jpg"];

    }else if (btn_tag==1012){
        [self setImageView:self.image2 imageName:@"image12.jpg"];

    }else if (btn_tag==1013){
        [self setImageView:self.image2 imageName:@"image13.jpg"];

    }else if (btn_tag==1014){
        [self setImageView:self.image2 imageName:@"image14.jpg"];

    }else if (btn_tag==1015){
        [self setImageView:self.image2 imageName:@"image15.jpg"];

    }else if (btn_tag==1016){
        [self setImageView:self.image2 imageName:@"image16.jpg"];

    }
    
    
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:btn] switchBtn:btn];
#else //suncode
    
  
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    
     
#endif
    
}

-(void)dealloc{
//    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)resetRelays{
    self.imagBtn1.state = 0;
    self.imagBtn2.state = 0;
    self.imagBtn3.state = 0;
    self.btnTrace1.state =0;
    self.btnTrace2.state =0;
    
    [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn1];
    [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn2];
    [self setSwitchImage:@"Canvas 1.jpg" switchBtn:self.imagBtn3];
    

    [self setImageView:self.image1 imageName:@"image1.jpg"];
    [self setImageView:self.image2 imageName:@"image9.jpg"];
    
    [self setSwitchImage:@"switch3_on.jpg" switchBtn:self.btnTrace1];
    [self setSwitchImage:@"switch3_on.jpg" switchBtn:self.btnTrace2];
//    [self.btnTrace1 setImage:[NSImage imageNamed:@"switch3_on"]];
//    [self.btnTrace2 setImage:[NSImage imageNamed:@"switch3_on"]];
}

@end
