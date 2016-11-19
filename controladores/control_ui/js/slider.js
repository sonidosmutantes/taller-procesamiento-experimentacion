loadedInterfaceName = "White Slider";

interfaceOrientation = "portrait";

pages = [[
{
    "name": "tabButton",
    "type": "Button",
    "x": .0,
    "y": .7,
    "width": .5,
    "height": .2,
    "color": "#00ffff",
	"isLocal": true,
    "address": "/xypad",
    "ontouchstart": "control.showToolbar();",
},

{
    "name": "slider1",
    "type": "Slider",
    "x": 0,
    "y": 0,
    "width": 1,
    "height": .6,
    "startingValue": .5,
    "color": "#ffffff",
    "min": 0,
    "max": 127,
    "isInverted": false,
    "isVertical": false,
},

]

];