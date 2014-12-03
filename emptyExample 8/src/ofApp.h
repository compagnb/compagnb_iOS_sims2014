#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

#include "ofxThinkGear.h"
#include "ofxTweenLite.h"

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
    
private:
    ofxThinkGear thinkGear;
    void attentionListener(float &param);
    void meditationListener(float &param);
    
    ofTrueTypeFont font;
    
    float atChangeTime;
    float meChangeTime;
    float attention;
    float meditation;
    float distAw;
    float prevAw;
    float currAw;
    float distMw;
    float prevMw;
    float currMw;


};


