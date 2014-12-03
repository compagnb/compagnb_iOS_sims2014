//
//  MyGuiView.h
//  emptyExample
//
//  Created by compagnb on 10/25/14.
//
//

#import <UIKit/UIKit.h>

@interface MyGuiView : UIViewController

@property(retain, nonatomic) IBOutlet UISlider *waveSlider;
@property(retain, nonatomic) IBOutlet UISlider *bkgdSlider;
@property(retain, nonatomic) IBOutlet UISwitch *waveSwitch;
@property(retain, nonatomic) IBOutlet UISwitch *rainSwitch;

@end