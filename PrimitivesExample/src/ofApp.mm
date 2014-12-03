#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation
    //ofSetOrientation(OF_ORIENTATION_90_RIGHT);
	ofSetFrameRate(60);
	ofBackground(20);
    
    // GL_REPEAT for texture wrap only works with NON-ARB textures //
    ofDisableArbTex();
    texture.loadImage("of.png");
    texture.getTextureReference().setTextureWrap( GL_REPEAT, GL_REPEAT );
    
    bFill       = true;
    bWireframe  = false;
    bDrawNormals= true;
    bDrawLights = false;
    bInfoText   = true;
    
    float width     = ofGetWidth();
    float height    = ofGetHeight();
    
    
    plane.set( width, height );
    
    mode        = 0;
    numTouches  = 0;
    
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
}

//--------------------------------------------------------------
void ofApp::update(){
    pointLight.setPosition((ofGetWidth()*.5)+ cos(ofGetElapsedTimef()*.5)*(ofGetWidth()*.3), ofGetHeight()/2, 500);
    pointLight2.setPosition((ofGetWidth()*.5)+ cos(ofGetElapsedTimef()*.15)*(ofGetWidth()*.3),
                            ofGetHeight()*.5 + sin(ofGetElapsedTimef()*.7)*(ofGetHeight()), -300);
    
    pointLight3.setPosition(
                            cos(ofGetElapsedTimef()*1.5) * ofGetWidth()*.5,
                            sin(ofGetElapsedTimef()*1.5f) * ofGetWidth()*.5,
                            cos(ofGetElapsedTimef()*.2) * ofGetWidth()
                            );
    
	ofSetWindowTitle("Framerate: "+ofToString(ofGetFrameRate(), 0));
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    ofEnableDepthTest();
    
    ofEnableLighting();
    pointLight.enable();
    pointLight2.enable();
    pointLight3.enable();
    
	material.begin();
    
    ofSetColor(180);
    ofNoFill();
    
    
    texture.getTextureReference().bind();
    
    //float rotx = sin(ofGetElapsedTimef()*.05f);
    
    
    // Plane //
    plane.setPosition(160, ofGetHeight()*.5, 0);
    
    //how many divisions there are in the plane for movement
    //more = smoother
    plane.setResolution(13,10);
    
    //how to build the mesh
    plane.setMode( OF_PRIMITIVE_TRIANGLE_STRIP );
    plane.mapTexCoords(0, 0, 2, 2);
    
    //plane.rotate(rotx, 0.1, 0.0, 0.0);
    
    
    
    ofMesh deformPlane;
    
        deformPlane = plane.getMesh();
        // x = columns, y = rows //
        ofVec3f planeDims = plane.getResolution();
        float planeAngleX = ofGetElapsedTimef() * 3.6;
        float planeAngleInc = 3.f/(float)planeDims.x;
        ofVec3f vert;
        for(int i = 0; i < deformPlane.getNumIndices(); i++ ) {
            planeAngleX += planeAngleInc;
            int ii = deformPlane.getIndex( i );
            vert = deformPlane.getVertex( ii );
            vert.z += cos(planeAngleX) * 30;
            deformPlane.setVertex( ii, vert );
        }

    

        ofFill();
        ofSetColor(255);
    
            plane.transformGL();
            deformPlane.draw();
            plane.restoreTransformGL();
    

//    if(bWireframe) {
//        ofNoFill();
//        ofSetColor(0, 0, 0);
//        if(!bFill) ofSetColor(255);
//        plane.setPosition(plane.getPosition().x, plane.getPosition().y, plane.getPosition().z+1);
//        //if(bFill) {
//        if( mode == 2 ) {
//            ofSetColor(255);
//        }
//        plane.drawWireframe();
//        //}
//        plane.setPosition(plane.getPosition().x, plane.getPosition().y, plane.getPosition().z-2);
    
//    }
    
    
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch) {
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

}

