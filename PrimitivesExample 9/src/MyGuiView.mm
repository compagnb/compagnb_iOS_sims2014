//
//  MyGuiView.cpp
//  emptyExample
//
//  Created by compagnb on 10/25/14.
//
//

#include "MyGuiView.h"
#include "ofxiPhoneExtras.h"
#include "ofApp.h"

@implementation MyGuiView

ofApp *myApp;

-(void)viewDidLoad {
	myApp = (ofApp*)ofGetAppPtr();
}

-(IBAction)waveSliderHandler:(id)sender {
	UISlider *sliderObj = sender;
	myApp->waveHeight = [sliderObj value];
}

-(IBAction)bkgdSliderHandler:(id)sender {
	UISlider *sliderObj = sender;
	myApp->bkgdOp = [sliderObj value];
}

-(IBAction)waveSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->waveSound = [switchObj isOn];
}
-(IBAction)rainSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->rainSound = [switchObj isOn];
}

@end