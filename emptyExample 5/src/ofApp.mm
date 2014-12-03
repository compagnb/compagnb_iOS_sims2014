#include "ofApp.h"
#include "MyGuiView.h"

MyGuiView *gui;

//--------------------------------------------------------------
void ofApp::setup(){
 	
	ofBackground( ofColor::red );
	
	radius = 100;
	hasFill = true;
	
	gui = [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
	[ofxiPhoneGetGLView() addSubview:gui.view];
    
    water.loadImage("static_water.jpg");
    
    // particles
    
    nTri = 1500;
    nVert = nTri * 3;
    
    sphereRad = 50;
    triRad = 25;
}


//--------------------------------------------------------------
void ofApp::update(){
    
    ///sphereRad = mouseX;
    triRad = radius;
    
    //fill the vericies array
    vertices.resize(nVert); // resise to the amount of vertices
    for (int i = 0; i < nTri; i++){
        // scan all the triangles and generate the center as a point on the sphere
        // take the random point from cube [-1, 1]x[-1, 1]x[-1, 1]
        center.set(ofRandom(-1, 1),ofRandom(-1, 1),ofRandom(-1, 1));
        center.normalize(); //normalize the vectors length to 1
        center *= sphereRad; // now we have the lenth of the spheres radius
        
        //geneate the triangles vertices as the center plus a random point from [-triRad,triRad]x[-triRad,triRad]x[-triRad,triRad]
        
        for (int j = 0; j < 3; j++) { // three because there are three sides to a triangle
            vertices[i*3 +j] = center + ofPoint (ofRandom( -triRad, triRad), ofRandom( -triRad, triRad), ofRandom( -triRad, triRad));
        }
    }
    //Fill the array of triangles colors
    colors.resize (nTri);
    for (int i = 0; i < nTri; i++){
        // take a random color from black to blue
        colors[i] = ofColor (0, 0, ofRandom(0, 255));
        
    }


}

//--------------------------------------------------------------
void ofApp::draw(){
	if ( hasFill ) {
		ofFill();
	}
	else {
		ofNoFill();
	}
	ofSetColor( ofColor::white );
//	ofCircle( ofGetWidth() / 2, ofGetHeight() / 2, radius );
    
    ofEnableDepthTest(); // enables z buffering
    
    ofBackgroundGradient(ofColor (255), ofColor (128)); // sets background color to a radial gradient
    
    ofPushMatrix(); // store the coordinate system
    
    ofTranslate(ofGetWidth()*0.5, ofGetHeight() *0.5, 0); // move the coordinate center to the screen's center
    
    // calculate the rotation angle
    time = ofGetElapsedTimef(); // get time in seconds
    angle   = time * 10; // compute angle at 10 degrees per second
    
    ofRotate(angle, 0, 1, 0); //rotate the coordinates along the Y axis
    
    //draw the triangles
    for (int i = 0; i<nTri; i++) {
        water.getTextureReference().bind(); // use image's texture for drawing
        ofTriangle(vertices[i * 3], vertices[i * 3 + 1], vertices[i * 3 + 2]);
        water.unbind(); // end using images texture
    }
    ofPopMatrix(); // Restre coordinate system
}


//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    // toggle gui view visibility
	gui.view.hidden = !gui.view.hidden;

}
