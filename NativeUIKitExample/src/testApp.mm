#include "testApp.h"
#include "MyGuiView.h"

MyGuiView *gui;


void testApp::setup() {
	
	ofBackground( ofColor::red );
	
	radius = 100;
	hasFill = true;
	
	gui = [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
	[ofxiPhoneGetGLView() addSubview:gui.view];
}


void testApp::update() {

}


void testApp::draw() {
	if ( hasFill ) {
		ofFill();
	}
	else {
		ofNoFill();
	}
	ofSetColor( ofColor::white );
	ofCircle( ofGetWidth() / 2, ofGetHeight() / 2, radius );
}


void testApp::touchDoubleTap(ofTouchEventArgs & touch) {
	gui.view.hidden = !gui.view.hidden;
}
