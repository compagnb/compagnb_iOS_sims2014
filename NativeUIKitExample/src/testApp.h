#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	
	void touchDoubleTap(ofTouchEventArgs & touch);
	
	float radius;
	
	bool hasFill;
	
};


