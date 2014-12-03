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

-(IBAction)radiusSliderHandler:(id)sender {
	UISlider *sliderObj = sender;
	myApp->waveHeight = [sliderObj value];
}

-(IBAction)fillSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->hasFill = [switchObj isOn];
}

@end