#include "ofApp.h"
#include "ofAppiOSWindow.h"
#import "ActionSheetDelegateForOF.h"
#include "MyGuiView.h"

//declare gui --------------------------------------------------------

MyGuiView *gui;

//--------------------------------------------------------------------
void ofApp::setup(){
    
    // initialize the accelerometer ----------------------------------
	ofxAccelerometer.setup();
    
    //initial setup --------------------------------------------------
    ofSetFrameRate(60);
	ofBackground(191,239,245);
    
    
    //ORIENTATION ----------------------------------------------------
    //ofSetOrientation(OF_ORIENTATION_90_LEFT);
    //ofSetOrientation(OF_ORIENTATION_90_RIGHT);//Set iOS to Orientation Landscape Right
    ofSetOrientation(OF_ORIENTATION_UNKNOWN);
    
    //bAuto = false;

    //auto orientation
    bAuto = true;
    
    
//    //2d Ocean -------------------------------------------------------
//    counter = 0.0;
//    spin = 0.0;
//    spinPct = 0.0;
//    mouseX = 263;
//    mouseY = 267;
//    bFirstMouseMove = true;
//    ofSetCircleResolution(40);
//    
//    //graphic sky -----------------------
//    sky.loadImage("sky.png");
//    
//    //font setup ------------------------
//    //old OF default is 96 - but this results in fonts looking larger than in other programs.
//    ofTrueTypeFont::setGlobalDpi(72);
//    
//    helveticaNeue14.loadFont("HelveticaNeueMedium.ttf", 14, true, true);
//    helveticaNeue14.setLineHeight(18.0f);
//    helveticaNeue14.setLetterSpacing(1.037);
    
    //3d Ocean -------------------------------------------------------
    
    // GL_REPEAT for texture wrap only works with NON-ARB textures //
    ofDisableArbTex();
    texture.loadImage("of.png");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
    //booleans for switches
    bFill       = true;
    bWireframe  = false;
    bDrawNormals= true;
    bDrawLights = false;
    bInfoText   = true;
    
    //easier shortcut for writing out get w and h
    w = ofGetWidth();
    h = ofGetHeight();
    
    //setup plane size
    plane.set( h, h);
    
    //lighting ----------------------------
    //ofSetSmoothLighting(true);
    pointLight.setDiffuseColor( ofFloatColor(.85, .85, .55) );
    pointLight.setSpecularColor( ofFloatColor(1.f, 1.f, 1.f));
    
    pointLight2.setDiffuseColor( ofFloatColor( 238.f/255.f, 57.f/255.f, 135.f/255.f ));
    pointLight2.setSpecularColor(ofFloatColor(.8f, .8f, .9f));
    
    pointLight3.setDiffuseColor( ofFloatColor(19.f/255.f,94.f/255.f,77.f/255.f) );
    pointLight3.setSpecularColor( ofFloatColor(18.f/255.f,150.f/255.f,135.f/255.f) );
    
    // shininess is a value between 0 - 128, 128 being the most shiny //
	material.setShininess( 120 );
    // the light highlight of the material //
	material.setSpecularColor(ofColor(255, 255, 255, 255));
    
    ofSetSphereResolution(24);
    
    //GUI setup ------------------------------
    
    //wave variables
    waveFreq = 4;
    waveSpeed = 0;
    waveHt = 0;
    
    //view rotations
    viewAngleX = 0;
    viewAngleY = 0;
    viewAngleZ = 0;
    
    
	
    bkgdOp = 0;
    
    //booleans for buttons
	waveSound = false;
    rainSound = false;
    textureView = false;
	
    
//    //my gui
//	gui = [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
//	[ofxiPhoneGetGLView() addSubview:gui.view];
//    
    //sounds
    wave.loadSound("beachambience.mp3"); // compressed mp3 format.
    wave.setVolume(0.75);
    
    rain.loadSound("beachambience.mp3"); // compressed mp3 format.
    rain.setVolume(0.75);
    
    //skys
    clear.loadImage("clear.jpg");
    stormy.loadImage("stormy.jpg");
    
    
    
}

//--------------------------------------------------------------------
void ofApp::update(){
    
    //orientation fix only works with portrait and left landscape
    
        if(ofxiOSGetGLView().frame.origin.x != 0
           || ofxiOSGetGLView().frame.size.width != [[UIScreen mainScreen] bounds].size.width){
    
            ofxiOSGetGLView().frame = CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);
        }
    
//    //2d Ocean -------------------------------------------------------
//    
//    //add 0.029 to our counter
//    counter += 0.029f;
//    
//    //reduce the spinPct by a small amount so that the spinning eventually stops
//    spinPct	*= 0.99f;
//    
//    //update the spin -which is storing the total rotation- by spinPct
//    spin += spinPct;
    
    //light updates
    pointLight.setPosition((w *.5)+ cos(ofGetElapsedTimef()*.5)*(w*.3), h/2, 500);
    pointLight2.setPosition((w*.5)+ cos(ofGetElapsedTimef()*.15)*(w*.3),
                            h *.5 + sin(ofGetElapsedTimef()*.7)*(h), -300);
    
    pointLight3.setPosition(
                            cos(ofGetElapsedTimef()*1.5) * w*.5,
                            sin(ofGetElapsedTimef()*1.5f) * w*.5,
                            cos(ofGetElapsedTimef()*.2) * w);
    
//	//ofSetWindowTitle("Framerate: "+ofToString(ofGetFrameRate(), 0));
    
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    ofSetColor(255);
    
    //graphic sky ----------------------------------------------------
    sky.draw(0, 0);
    
//    ofSetColor(255, 255, 255, 70);
//    ofRect(0, 0, ofGetWidth(), ofGetHeight());
//    
//    
//    //title bar
//    //ofSetColor(145, 230, 255);
//    ofSetColor(72, 205, 255, 150);
//    ofRect(0, 0, ofGetWidth(), 30);
//    
//    ofSetColor(255);
//    helveticaNeue14.drawString("sessions", 20, 20);
//    
//    //2D Ocean -------------------------------------------------------
//    float k = 0.0;
//    
//    //front lighter color
//    ofSetColor(0, 90, 170, 150);
//    k = 0;
//    for(int i = -1; i < ofGetWidth(); i+= 1){
//        ofRect(i, ofGetHeight(), 1, -20 * (sin(1.0 * counter - k) + 2.0));
//        k += 0.009;
//    }
//    
//    //back darker color
//    ofSetColor(0, 90, 170);
//    
//    for(int i = -1; i < ofGetWidth(); i+= 1){
//    
//        //Lets get a unique height for our 'wave' using sine
//        height = sin(counter + k);
//    
//        //sine produces -1 to 1 values lets add 1 to make sure the height is always positive
//        height += 1.0;
//    
//        //Now it is going from 0 to 2 but we want it to be taller than that. Lets make it go from 0 - 100 by multiplying by 50
//        height *= 30;
//    
//        //lets draw it!
//        ofRect(i, ofGetHeight(), 1, -height);
//    
//        //this variable makes sure that each rect has a unique height otherwise they would all be moving up and down at the same time
//        k += 0.007;
//    }
//    //front lighter color
//    ofSetColor(0,120,190);
//    k = 0;
//    for(int i = -1; i < ofGetWidth(); i+= 1){
//        ofRect(i+1, ofGetHeight(), 1, -30 * (sin(1.4 * counter - k) + 1.0));
//        k += 0.009;
//    }
    
    
    //3d water -------------------------------------------------------------------------------------------
    
    
    //lights -----------------------------------------
    ofEnableDepthTest();
    
//    ofEnableLighting();
//    pointLight.enable();
//    pointLight2.enable();
//    pointLight3.enable();
    
//    material.begin();
    
//    ofSetColor(180);
//    ofNoFill();
//    ofDrawSphere(ofGetWidth()/2, ofGetHeight()/2, ofGetWidth());
    
    if(mode == 1 || mode == 2) texture.getTextureReference().bind();
    
    
    // Plane //
    //plane.setPosition(160, ofGetHeight()*.5, 0);
    plane.setPosition(xPos, yPos, zPos);
    
    //how many divisions there are in the plane for movement
    //more = smoother
    plane.setResolution(waveFreq,waveFreq);
    
    //how to build the mesh
    plane.setMode( OF_PRIMITIVE_TRIANGLE_STRIP );
    plane.mapTexCoords(0, 0, 2, 2);
    
    ofMesh deformPlane;
    if(mode == 2) {
    deformPlane = plane.getMesh();
    // x = columns, y = rows //
    ofVec3f planeDims = plane.getResolution();
    
    float planeAngleX = ofGetElapsedTimef() * waveSpeed;
    float planeAngleInc = 3.f/(float)planeDims.x;
    ofVec3f vert;
    for(int i = 0; i < deformPlane.getNumIndices(); i++ ) {
        planeAngleX += planeAngleInc;
        int ii = deformPlane.getIndex( i );
        vert = deformPlane.getVertex( ii );
        vert.z += cos(planeAngleX) * waveHt;
        deformPlane.setVertex( ii, vert );
    }
    }
    
    if(bFill) {
        ofFill();
        ofSetColor(255);
        if(mode == 2) {
            plane.transformGL();
            deformPlane.draw();
            plane.restoreTransformGL();
        } else {
            plane.draw();
        }
    }
    if(bWireframe) {
        ofNoFill();
        ofSetColor(0, 0, 0);
        if(!bFill) ofSetColor(255);
        plane.setPosition(plane.getPosition().x, plane.getPosition().y, plane.getPosition().z+1);
        //if(bFill) {
        if( mode == 2 ) {
            ofSetColor(255);
        }
        plane.drawWireframe();
        //}
        plane.setPosition(plane.getPosition().x, plane.getPosition().y, plane.getPosition().z-2);
        
    }
    
    
//    ofPushMatrix();
//    //ofTranslate(ofGetWidth()*.5, ofGetHeight()*0.75, 0);
//    ofRotate(viewAngleX, 1, 0, 0);
//    ofRotate(viewAngleY, 0, 1, 0);
//    ofRotate(viewAngleZ, 0, 0, 1);
//    
//    
//    
//    plane.transformGL();
//    deformPlane.draw();
//    plane.restoreTransformGL();
//    
//    ofPopMatrix();
    
    if (waveSound){
        wave.play();
    }else if (rainSound){
        rain.play();
    }
    
    
    //redo orientation positions for 3d wave
    switch (ofGetOrientation()) {
        case OF_ORIENTATION_DEFAULT:
            //Portrait
//            xPos = 138;
//            yPos = -138;
//            zPos = 453;
//            viewAngleX = 244;
//            viewAngleY = 0;
//            viewAngleZ = 0;
//            
            
            break;
        case OF_ORIENTATION_180:
            //Portrait Upside Down
            xPos = 138;
            yPos = -138;
            zPos = 453;
            viewAngleX = 244;
            viewAngleY = 0;
            viewAngleZ = 0;
            
            
            break;
        case OF_ORIENTATION_90_LEFT:
            //Landscape Left
            xPos = 277;
            yPos = 4;
            zPos = 101;
            viewAngleX = 300;
            viewAngleY = 0;
            viewAngleZ = 0;
            
            
            
            
            break;
        case OF_ORIENTATION_90_RIGHT:
            //Landscape Right
            xPos = 281;
            yPos = -126;
            zPos = 216;
            viewAngleX = 244;
            viewAngleY = 0;
            viewAngleZ = 0;
            
            break;
        default:
            break;
    }
    
    if(mode == 1 || mode == 2) texture.getTextureReference().unbind();
    
    material.end();
    ofDisableLighting();
    
    if(bDrawLights) {
        ofFill();
        ofSetColor(pointLight.getDiffuseColor());
        pointLight.draw();
        ofSetColor(pointLight2.getDiffuseColor());
        pointLight2.draw();
        ofSetColor(pointLight3.getDiffuseColor());
        pointLight3.draw();
    }
    
    if(bDrawNormals) {
        ofSetColor(225, 0, 255);
        plane.drawNormals(20);
    }
    
    ofDisableDepthTest();
    
    ofFill();
    ofSetColor(255, 255, 255);
    
    if(bInfoText) {
        stringstream ss;
        ss << "Framerate: " << ofToString(ofGetFrameRate(),0) << "\n";
        ss << "(touch id 2): Draw Normals"<<endl;
        ss << "(tap): Set Resolutions = "<<numTouches <<endl;
        ss << "(DoubleTap): Set Mode "<<ofToString(mode,0)<<endl;
        
        ofDrawBitmapString(ss.str().c_str(), 20, 20);
    }

    
    cout << "mode: " << mode << endl;
    
    
//        cout << "x rotation: " << viewAngleX << "y rotation: " << viewAngleY << "z rotation: " << viewAngleZ << endl;
//    
//        cout << "x pos: " << xPos << "y pos: " << yPos << "z pos: " << zPos << endl;
}

//--------------------------------------------------------------
void ofApp::exit(){
    
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
    //
    //    NSString * autoTitle;
    //    if(bAuto) {
    //        autoTitle = @"Turn Auto Rotation OFF";
    //    } else {
    //        autoTitle = @"Turn Auto Rotation ON";
    //    }
    //
    //    UIActionSheet * actionSheet;
    //    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Orientation"
    //                                              delegate:nil
    //                                     cancelButtonTitle:@"Cancel"
    //                                destructiveButtonTitle:nil
    //                                     otherButtonTitles:@"Portrait", @"Portrait Upside Down", @"Landscape Left", @"Landscape Right", autoTitle, nil];
    //    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    //    actionSheet.delegate = [[ActionSheetDelegateForOF alloc] initWithApp:this];
    //    [actionSheet showInView:ofxiOSGetGLParentView()];
    
    if(touch.id==0) {
        numTouches++;
        if(numTouches > 2) numTouches=0;
        if(numTouches== 0) {
            plane.setResolution(3, 2);
        } else if (numTouches == 1) {
            plane.setResolution(6, 4);
        } else if(numTouches == 2) {
            plane.setResolution(8,5);
        }
    } else if (touch.id == 1) {
        bDrawNormals = !bDrawNormals;
    } else if (touch.id == 2) {
        bInfoText = !bInfoText;
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
//    // toggle gui view visibility
//	gui.view.hidden = !gui.view.hidden;
    
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

