#include "ofApp.h"

void ofApp::setup()
{
    
    
    
    // setup //
    
    //ofSetFrameRate(60);
    ofSetVerticalSync(true);
    ofEnableAlphaBlending();
    ofEnableSmoothing();
    ofSetFullscreen(TRUE);
    ofBackground(0, 0, 0);
    ofSetCircleResolution(32);
    ofSetBackgroundAuto(FALSE);
    
    
    
    
    
    
    // thinkgear setup //
    
    
    thinkGear.setup("/dev/tty.MindWaveMobile-DevA");
    ofAddListener(thinkGear.attentionChangeEvent, this, &ofApp::attentionListener);
    ofAddListener(thinkGear.meditationChangeEvent, this, &ofApp::meditationListener);
    
    
    
    
    
    font.loadFont("font/DroidSansMono.ttf", 20);
    
    distAw = 0.0;
    prevAw = 0.0;
    currAw = 0.0;
    distMw = 0.0;
    prevMw = 0.0;
    currMw = 0.0;
    
    atChangeTime = 0.0;
    attention = 0.0;
    meChangeTime = 0.0;
    meditation = 0.0;
}


// thinkgear update //


void ofApp::update()
{
    thinkGear.update();
    
    float cur = ofGetElapsedTimef();
    float progress = cur - atChangeTime;
    progress = ofClamp(progress, 0.0, 1.0);
    if (progress == 0.0) prevAw = currAw;
    currAw = ofxTweenLite::tween(prevAw, distAw, progress, OF_EASE_SINE_INOUT);
    
    progress = cur - meChangeTime;
    progress = ofClamp(progress, 0.0, 1.0);
    if (progress == 0.0) prevMw = currMw;
    currMw = ofxTweenLite::tween(prevMw, distMw, progress, OF_EASE_SINE_INOUT);
}

void ofApp::draw()
{
    ofBackgroundGradient(ofColor::white, ofColor::gray);
    
    ofPushStyle();
    ofSetColor(ofColor::black);
    string qStr = "";
    if (thinkGear.getSignalQuality() == 0.0)
    {
        qStr = "good";
    }
    else
    {
        qStr = "poor (" + ofToString(thinkGear.getSignalQuality()) + ")";
    }
    font.drawString("signal quality = " + qStr, 10, 40);
    ofPopStyle();
    
    
    ofPushMatrix();
    ofTranslate(0, 30);
    ofPushStyle();
    ofSetColor(ofColor::black);
    font.drawString("Attention", 10, ofGetHeight()/4 - 10);
    ofNoFill();
    ofRect(1, ofGetHeight()/4, ofGetWidth() - 2, 60);
    ofSetColor(ofColor::magenta, ofMap(currAw, 0.0, ofGetWidth(), 50, 255));
    ofFill();
    ofRect(0, ofGetHeight()/4, currAw, 59);
    if (attention > 0.0)
    {
        ofSetColor(ofColor::black, ofMap(currAw, 0.0, ofGetWidth(), 50, 255));
        font.drawString(ofToString(attention), 10, ofGetHeight()/4 + 40);
    }
    ofPopStyle();
    ofPopMatrix();
    
    ofPushMatrix();
    ofTranslate(0, -30);
    ofPushStyle();
    ofSetColor(ofColor::black);
    font.drawString("Meditation", 10, ofGetHeight()-(ofGetHeight()/4) - 10);
    ofNoFill();
    ofRect(1, ofGetHeight()-(ofGetHeight()/4), ofGetWidth() - 2, 60);
    ofSetColor(ofColor::cyan, ofMap(currMw, 0.0, ofGetWidth(), 50, 255));
    ofFill();
    ofRect(0, ofGetHeight()-(ofGetHeight()/4), currMw, 59);
    if (meditation > 0.0)
    {
        ofSetColor(ofColor::black, ofMap(currMw, 0.0, ofGetWidth(), 50, 255));
        font.drawString(ofToString(meditation), 10, ofGetHeight()-(ofGetHeight()/4) + 40);
    }
    ofPopStyle();
    ofPopMatrix();
    
    ofSetWindowTitle("fps = " + ofToString(ofGetFrameRate()));
}

void ofApp::attentionListener(float &param)
{
    attention = param;
    distAw = ofMap(attention, 0.0, 100.0, 0, ofGetWidth());
    atChangeTime = ofGetElapsedTimef();
}

void ofApp::meditationListener(float &param)
{
    meditation = param;
    distMw = ofMap(meditation, 0.0, 100.0, 0, ofGetWidth());
    meChangeTime = ofGetElapsedTimef();
}
