//
//  MyGuiView.h
//  emptyExample
//
//  Created by compagnb on 10/25/14.
//
//

#import <UIKit/UIKit.h>

@interface MyGuiView : UIViewController

//wave variables -------------------------------

@property(retain, nonatomic) IBOutlet UISlider *waveSlider;

@property(retain, nonatomic) IBOutlet UISlider *htSlider;

@property (retain, nonatomic) IBOutlet UISlider *waveResSlider;

//view options -------------------------------

@property(retain, nonatomic) IBOutlet UISlider *viewAngleXSlider;

@property (retain, nonatomic) IBOutlet UISlider *viewAngleYSlider;

@property (retain, nonatomic) IBOutlet UISlider *viewAngleZSlider;

@property (retain, nonatomic) IBOutlet UISlider *xPosSlider;

@property (retain, nonatomic) IBOutlet UISlider *yPosSlider;

@property (retain, nonatomic) IBOutlet UISlider *zPosSlider;

//sound options -------------------------------

@property(retain, nonatomic) IBOutlet UISwitch *waveSwitch;

@property(retain, nonatomic) IBOutlet UISwitch *rainSwitch;

@end