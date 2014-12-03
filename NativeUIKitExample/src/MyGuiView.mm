#include "MyGuiView.h"
#include "ofxiPhoneExtras.h"
#include "testApp.h"

@implementation MyGuiView

testApp *myApp;

-(void)viewDidLoad {
	myApp = (testApp*)ofGetAppPtr();
}

-(IBAction)radiusSliderHandler:(id)sender {
	UISlider *sliderObj = sender;
	myApp->radius = [sliderObj value];
}

-(IBAction)fillSwitchHandler:(id)sender {
	UISwitch *switchObj = sender;
	myApp->hasFill = [switchObj isOn];
}

@end