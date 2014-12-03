//
//  rectangle class
//  Wk1_HwA_RectInterpolate
//
//  Created by compagnb on 8/31/14.
//
//
#pragma once

#include "ofMain.h"

class rectangle { // declare class and name
    public: //publicly visible variables and functions

        rectangle(); // constructor - takes the place of set-up
    
        // functions
        void draw(); //what we draw in the view
        void interpolateByPct(float myPct); // the movement of the shape

        //variables
        ofPoint pos; //position
    
        ofPoint posa; //where we are coming from
        ofPoint posb; //where we are going to

        float pct; //what percentage we are between a and b

    private:

};