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

//wave variables -------------------------

-(IBAction)waveSliderHandler:(id)sender {
	UISlider *sliderObj = sender;
	myApp->waveSpeed = [sliderObj value];
}

- (IBAction)htSliderHandler:(id)sender {
    UISlider *sliderObj = sender;
	myApp->waveHt = [sliderObj value];
}

- (IBAction)waveResSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->waveFreq = [sliderObj value];
}


//view options -------------------------------

- (IBAction)viewAngleXSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->viewAngleX = [sliderObj value];
}

- (IBAction)viewAngleYSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->viewAngleY = [sliderObj value];
}

- (IBAction)viewAngleZSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->viewAngleZ = [sliderObj value];
}


- (IBAction)xPosSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->xPos = [sliderObj value];
}


- (IBAction)yPosSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->yPos = [sliderObj value];
}


- (IBAction)zPosSlider:(id)sender {
    UISlider *sliderObj = sender;
	myApp->zPos = [sliderObj value];
}



//sound options ------------------------------

-(IBAction)waveSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->waveSound = [switchObj isOn];
}
-(IBAction)rainSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->rainSound = [switchObj isOn];
}
- (IBAction)textureSwitchHandler:(id)sender {
    UISwitch *switchObj = sender;
	myApp->textureView = [switchObj isOn];
}

- (void)dealloc {
    [_viewAngleYSlider release];
    [_viewAngleZSlider release];
    [_waveResSlider release];
    [_xPosSlider release];
    [_yPosSlider release];
    [_xPosSlider release];
    [super dealloc];
}
@end