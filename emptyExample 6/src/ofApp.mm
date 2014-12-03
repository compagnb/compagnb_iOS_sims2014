#include "ofApp.h"
#include "MyGuiView.h"

MyGuiView *gui;

//--------------------------------------------------------------
void ofApp::setup(){
 	
	ofBackground( ofColor::grey );
	
	radius = 100;
	hasFill = true;
	
	gui = [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
	[ofxiPhoneGetGLView() addSubview:gui.view];
    
    water.loadImage("static_water.jpg");
    
    // pyramids base vertices
    ofPoint v0 = ofPoint( -200, -100, 0 );
	ofPoint v1 = ofPoint( 200, -100, 0 );
	ofPoint v2 = ofPoint(  0, 200, 0 );
    
    // pyramids top vertex
    ofPoint v3 = ofPoint( 0, 0, 100 );
    
    
    // Add triangles by its vertices
    myMesh.addVertex(v3); myMesh.addVertex(v2); myMesh.addVertex(v0);
    myMesh.addVertex(v3); myMesh.addVertex(v1); myMesh.addVertex(v2);
    myMesh.addVertex(v3); myMesh.addVertex(v0); myMesh.addVertex(v1);
    
    myMesh.setupIndicesAuto();	//Set up indices
    
    //set normals a function for the light to work
    setNormals(myMesh);
    
    //enable light source
    myLight.enable();
    
    
}


//--------------------------------------------------------------
void ofApp::update(){
    


}

//--------------------------------------------------------------
void ofApp::draw(){
    ofEnableDepthTest(); // enable z buffering
    
    ofBackgroundGradient(ofColor(255), ofColor(128));
    
    ofPushMatrix(); // str coordinate system
    
    ofTranslate(ofGetWidth()*0.5, ofGetHeight()*0.5, 0); // moove coordinates to the center of the screen
    
    time = ofGetElapsedTimef(); // get time in seconds
    angle = time * 30; // rotation angle
    ofRotate(angle, 0, 1, 1);
    
    ofSetColor(200, 0, 200);
    myMesh.draw();
    
    ofPopMatrix();
    
}



//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    // toggle gui view visibility
	gui.view.hidden = !gui.view.hidden;

}

//--------------------------------------------------------------
//Universal function which sets normals for the triangle mesh
void ofApp::setNormals(ofMesh &mesh){
    
	//The number of the vertices
	int nV = mesh.getNumVertices();
    
	//The number of the triangles
	int nT = mesh.getNumIndices() / 3;
    
	vector<ofPoint> norm( nV ); //Array for the normals
    
	//Scan all the triangles. For each triangle add its
	//normal to norm's vectors of triangle's vertices
	for (int t=0; t<nT; t++) {
        
		//Get indices of the triangle t
		int i1 = mesh.getIndex( 3 * t );
		int i2 = mesh.getIndex( 3 * t + 1 );
		int i3 = mesh.getIndex( 3 * t + 2 );
        
		//Get vertices of the triangle
		const ofPoint &v1 = mesh.getVertex( i1 );
		const ofPoint &v2 = mesh.getVertex( i2 );
		const ofPoint &v3 = mesh.getVertex( i3 );
        
		//Compute the triangle's normal
		ofPoint dir = ( (v2 - v1).crossed( v3 - v1 ) ).normalized();
        
		//Accumulate it to norm array for i1, i2, i3
		norm[ i1 ] += dir;
		norm[ i2 ] += dir;
		norm[ i3 ] += dir;
	}
    
	//Normalize the normal's length
	for (int i=0; i<nV; i++) {
		norm[i].normalize();
	}
    
	//Set the normals to mesh
	mesh.clearNormals();
	mesh.addNormals( norm );
}

