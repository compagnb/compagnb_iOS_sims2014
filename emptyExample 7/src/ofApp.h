#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class ofApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
    
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    //booleans
        bool bFill;
        bool bWireframe;
        bool bDrawNormals;
        bool bDrawLights;
        bool bInfoText;
    
    // texture
        ofImage texture;
        int mode;
        int numTouches;
    
    //Shapes
        ofSpherePrimitive sphere;
        ofIcoSpherePrimitive icoSphere;
        ofPlanePrimitive plane;
        ofCylinderPrimitive cylinder;
        ofConePrimitive cone;
        ofBoxPrimitive box;
    
    //Lighting effects
        ofLight pointLight;
        ofLight pointLight2;
        ofLight pointLight3;
        ofMaterial material;
    
    // place to store the sides of the box //
        ofMesh boxSides[ofBoxPrimitive::SIDES_TOTAL];
	
    // GUI
        float radius;
        bool hasFill;
    

    
    
    

};


