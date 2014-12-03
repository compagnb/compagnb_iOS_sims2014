#include "ofApp.h"
#include "ofAppiOSWindow.h"
#import "ActionSheetDelegateForOF.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(60);
	ofBackground(0);
    
    
    //ORIENTATION ---------------------------------------------------------
    //ofSetOrientation(OF_ORIENTATION_90_LEFT);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);//Set iOS to Orientation Landscape Right
    
    bAuto = false;
    
    
    //2d Ocean ------------------------------------------------------------
    counter = 0.0;
	spin = 0.0;
	spinPct = 0.0;
	mouseX = 263;
	mouseY = 267;
	bFirstMouseMove = true;
	ofSetCircleResolution(40);
    
    //graphic sky ---------------------------------------------------------
    sky.loadImage("sky.png");
}

//--------------------------------------------------------------
void ofApp::update(){
    
    //2d Ocean ------------------------------------------------------------
    
    //add 0.029 to our counter
	counter += 0.029f;
    
	//reduce the spinPct by a small amount so that the spinning eventually stops
	spinPct	*= 0.99f;
    
	//update the spin -which is storing the total rotation- by spinPct
	spin += spinPct;
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    ofSetColor(255);
    
    //graphic sky ---------------------------------------------------------
    sky.draw(0, 0);
    
    ofSetColor(255, 255, 255, 70);
    ofRect(0, 0, ofGetWidth(), ofGetHeight());
    
    
    //2D Ocean ------------------------------------------------------------
    //back darker color
	ofSetColor(0, 90, 170, 200);
	float k = 0.0;
	for(int i = -1; i < ofGetWidth(); i+= 1){
        
		//Lets get a unique height for our 'wave' using sine
		float height = sin(counter + k);
        
		//sine produces -1 to 1 values lets add 1 to make sure the height is always positive
		height += 1.0;
        
		//Now it is going from 0 to 2 but we want it to be taller than that. Lets make it go from 0 - 100 by multiplying by 50
		height *= 30;
        
		//lets draw it!
		ofRect(i, ofGetHeight(), 1, -height);
        
		//this variable makes sure that each rect has a unique height otherwise they would all be moving up and down at the same time
		k += 0.007;
	}
    //front lighter color
	ofSetColor(0,120,190);
	k = 0;
	for(int i = -1; i < ofGetWidth(); i+= 1)
	{
		ofRect(i+1, ofGetHeight(), 1, -30 * (sin(1.4 * counter - k) + 1.0));
		k += 0.009;
	}
    
	//Lets stop the blending!
	ofDisableAlphaBlending();
    
	if(ofGetWidth() > 480){ // then we are running retina
		ofScale(2, 2, 0);
    }

    
    
    //ORIENTATION ---------------------------------------------------------
    
    ofSetColor(ofColor::white);
    
    string currentOrientation = "";
    string currentOrientationSyntax = "";
    
    switch (ofGetOrientation()) {
        case OF_ORIENTATION_DEFAULT:
            currentOrientation = "Portrait";
            currentOrientationSyntax = "OF_ORIENTATION_DEFAULT";
            break;
        case OF_ORIENTATION_180:
            currentOrientation = "Portrait Upside Down";
            currentOrientationSyntax = "OF_ORIENTATION_180";
            break;
        case OF_ORIENTATION_90_LEFT:
            currentOrientation = "Landscape Left";
            currentOrientationSyntax = "OF_ORIENTATION_90_LEFT";
            break;
        case OF_ORIENTATION_90_RIGHT:
            currentOrientation = "Landscape Right";
            currentOrientationSyntax = "OF_ORIENTATION_90_RIGHT";
            break;
        default:
            break;
    }
    
    string autoStr = (bAuto ? "ON" : "OFF");
    
    int x = ofGetWidth() * 0.05;
    int y = ofGetHeight() * 0.1;
    
    ofDrawBitmapString("current orientation is,", x, y);
    ofDrawBitmapString(" - " + currentOrientation, x, y+=20);
    ofDrawBitmapString(" - " + currentOrientationSyntax, x, y+=20);
    ofDrawBitmapString("auto rotation is " + autoStr + ".", x, y+=40);
    ofDrawBitmapString("tap screen to change orientation.", x, y+=40);
}

//--------------------------------------------------------------
void ofApp::exit(){
    //
}

//--------------------------------------------------------------
void ofApp::rotateToPortrait() {
    ofSetOrientation(OF_ORIENTATION_DEFAULT);
}

void ofApp::rotateToPortraitUpSideDown() {
    ofSetOrientation(OF_ORIENTATION_180);
}

void ofApp::rotateToLandscapeLeft() {
    ofSetOrientation(OF_ORIENTATION_90_LEFT);
}

void ofApp::rotateToLandscapeRight() {
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
}

void ofApp::toggleAutoRotation() {
    bAuto = !bAuto;
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch) {
    
    NSString * autoTitle;
    if(bAuto) {
        autoTitle = @"Turn Auto Rotation OFF";
    } else {
        autoTitle = @"Turn Auto Rotation ON";
    }
    
    UIActionSheet * actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Orientation"
                                              delegate:nil
                                     cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:nil
                                     otherButtonTitles:@"Portrait", @"Portrait Upside Down", @"Landscape Left", @"Landscape Right", autoTitle, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.delegate = [[ActionSheetDelegateForOF alloc] initWithApp:this];
    [actionSheet showInView:ofxiOSGetGLParentView()];
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    if( bAuto ) {
        ofSetOrientation((ofOrientation)newOrientation);
    }
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h) {
    //
}

