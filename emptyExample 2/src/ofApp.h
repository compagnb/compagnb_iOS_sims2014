#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class ofApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
	
        void touchDoubleTap(ofTouchEventArgs & touch);
	
        float radius;
	
        bool hasFill;
    
    //particles
    vector <ofPoint> vertices;
    vector <ofColor> colors;
    
    int nTri;// the number of triangles
    int nVert; // the number of vertices needed to make the triangles (ntri * 3)
    
    float sphereRad; // spheres radius
    float triRad; // triangle radius  maxium diviation of the triangle's center
    
    ofPoint center;
    float time;
    float angle;
	

};


