#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
	ofSetOrientation(OF_ORIENTATION_90_RIGHT);//Set iOS to Orientation Landscape Right

	counter = 0.0;
	spin = 0.0;
	spinPct = 0.0;
	mouseX = 263;
	mouseY = 267;
	bFirstMouseMove = true;
	ofSetCircleResolution(40);
	ofBackground(0, 0, 0);
	ofSetFrameRate(60);
}


//--------------------------------------------------------------
void ofApp::update(){
	
	//add 0.029 to our counter
	counter = counter + 0.029f;

	//the quick way to write
	//the same thing would be:
	//counter += 0.029f;

	//reduce the spinPct by a small amount
	//so that the spinning eventually stops
	//this is the same as writing:
	//spinPct = spinPct * 0.99;
	spinPct	*= 0.99f;

	//update the spin -which is storing the
	//total rotation- by spinPct
	spin += spinPct;
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    //ofRect(50, 50, 100, 200);

	//---------------------------------
	//PIXEL OCEAN

	//Lets make some 8bit looking waves
	//out of rectangles
	ofSetColor(0, 90, 170);
	float k = 0.0;
	for(int i = 0; i < ofGetWidth(); i+= 1){

		//Lets get a unique height for our 'wave'
		//using sine
		float height = sin(counter + k);

		//sine produces -1 to 1 values
		//lets add 1 to make sure the height
		//is always positive
		height += 1.0;

		//Now it is going from 0 to 2
		//but we want it to be taller than that.
		//Lets make it go from 0 - 100 by
		//multiplying 50
		height *= 50;

		//lets draw it!
		ofRect(0, i, height, 1 );

		//this variable makes sure that each
		//rect has a unique height otherwise
		//they would all be moving up and down
		//at the same time
		k += 0.004;
	}

	//This is doing it again but for a different color
	ofSetColor(0, 120, 190);
	k = 0;
	for(int i = -1; i < ofGetWidth(); i+= 1)
	{
		ofRect( 0, i+1, -50 * (sin(1.0 * counter - k) - 1.0), 1);
		k += 0.004;
	}

	//Lets stop the blending!
	ofDisableAlphaBlending();

	if(ofGetWidth() > 480){ // then we are running retina
		ofScale(2, 2, 0);
    }

//	//---------------------------
//	// a bunch of lines
//
//	for (int i = 0; i < 100; i++){
//		//Lets make a cheesy sunset
//		ofSetColor(255 - i * 10, 255 - i * 20, 0);
//		ofLine(i * 4, 0, i * 4, ofGetHeight() );
//	}
//
//	ofScale(0.5, 0.5, 1);
//	
//	//enable blending!
//	//We are going to use a blend mode that adds
//	//all the colors to white.
//	ofEnableAlphaBlending();
//	glBlendFunc(GL_ONE, GL_ONE);
//

}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
	
	if( touch.id ==  0){
        //update spinPct by the distance the mouse
        //moved in x and y. We use abs so it always
        //spins in the same direction

        // we use the "bFirstMouseMove" flag so that we calculate only
        // after we have the first prevMY and prevMX stored;

        if (bFirstMouseMove == false){
            spinPct += (float)fabs(touch.y - prevMY) * 0.03;
            spinPct += (float)fabs(touch.x - prevMX) * 0.03;
        }else{
            bFirstMouseMove = false;
            //turn the flag off
        }

        //store the x and y
        //so we can get the prev value
        //next time the mouse is moved
        prevMY = touch.y;
        prevMX = touch.x;
	}
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
    
}
