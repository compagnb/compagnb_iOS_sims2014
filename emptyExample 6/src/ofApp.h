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
    
        //variables & functions for mesh and lighting
        ofMesh myMesh;
        ofLight myLight;
    
        void setNormals(ofMesh &mesh);
    
        // grid variables
        int gridWidth;
        int gridHeight;
    
        // variables for movement
        float time;
        float angle;
    
        int numVert;
        int numTri;
    
        ofPoint dir;
    
        int i1;
        int i2;
        int i3;
        int i4;
	
        ofImage water;
    

};


