#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class ofApp : public ofxiOSApp{
    
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
    void windowResized(int w, int h);
    
    void rotateToPortrait();
    void rotateToPortraitUpSideDown();
    void rotateToLandscapeLeft();
    void rotateToLandscapeRight();
    void toggleAutoRotation();
    
    bool bAuto;
    
    //2d Version ----------------------------------
    
    ofImage sky;
    
    float counter;
    float spin;
    float spinPct;
    
    int prevMX;
    int prevMY;
    
    bool bFirstMouseMove;
    bool retina;
    
    //font for title bar
    ofTrueTypeFont helveticaNeue14;
};
