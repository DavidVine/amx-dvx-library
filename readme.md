amx-dvx-library
===============


Files
-----
+ amx-dvx-api.axi
+ amx-dvx-control.axi
+ amx-dvx-listener.axi


Overview
--------
The **amx-dvx-library** NetLinx library is intended as a tool to make things easier for anyone tasked with programming an AMX system containing an AMX Enova DVX Switcher:

+ DVX-2150HD-SP
+ DVX-2150HD-T
+ DVX-2155-SP
+ DVX-2155-T
+ DVX-3150-SP
+ DVX-3150-T
+ DVX-3155-SP
+ DVX-3156-T

The built-in structures, constants, control functions, callback functions, and events assist you by simplifying control and feedback.

Everything is a function!

Consistent, descriptive control function names within **amx-dvx-control** make it easy for you to control the different aspects of the DVX (video inputs/outputs, audio inputs/outputs, mic inputs, etc...) and request information. E.g:

	/*
	 * Function:	dvxSetVideoOutputScaleMode
	 *
	 * Arguments:	dev dvxVideoOutputPort - video output port on the DVX
	 * 				char scaleMode[] - scaling mode
	 *                                 	Values:
	 *                                      	DVX_SCALE_MODE_AUTO
	 *                                      	DVX_SCALE_MODE_BYPASS
	 *                                      	DVX_SCALE_MODE_MANUAL
	 *
	 * Description:	Sets the scaling mode on the video output port.
	 */
	define_function dvxSetVideoOutputScaleMode (dev dvxVideoOutputPort, char scaleMode[])
	{
	    switch (scaleMode)
	    {
			case DVX_SCALE_MODE_AUTO:
			case DVX_SCALE_MODE_BYPASS:
			case DVX_SCALE_MODE_MANUAL:
			{
				amxSendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_SCALE_MODE,scaleMode")
			}
	    }
	}

No longer are you required to refer to the DVX manual to work out what command headers are required or how to build a control string containing all the required values. This process was time consuming and often involved converting numeric data to string form and building string expressions which were long and complex.

With the control functions defined within **amx-dvx-control** values for DVX commands are simply passed through as arguments in the appropriate data types (constants defined within **amx-dvx-api** can be used where required) and the control functions do the hard work.

Similarly, you no longer have to build events (data/channel/level, etc...) to capture returning information from the DVX and parse the incoming string/command (coverting data types where required) to obtain the required information in the correct format. **amx-dvx-listener**, listens for all types of responses from the DVX and triggers pre-written callback functions which you can copy to the main program, uncomment and fill in. E.g:

	#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
	define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
	{
	    // dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	    // volume is the volume value (range: 0 to 100)
	}

Functions also assist to neaten up the programming and provide added readability to the code and the auto-prompter within the NetLinx Studio editor makes it easy to find the function you're looking for.

Extremely flexible!

All control and callback functions have a DEV parameter. This makes **amx-dvx-library** extremely flexible as you can use the same control/callback functions for different AV ports on a DVX or even multiple DVX's. For the control functions you simply pass through the dev for the DVX component you want to control and the dev parameter of the callback functions allows you to check to see which device triggered the notification.


amx-dvx-api
-----------
#####Dependencies:
+ none

#####Description:
Contains structure definitions which you can use to store information about an AMX Enova DVX switcher.

Contains constants for DVX NetLinx command headers and parameter values. These are used extensively by the accompanying library files **amx-dvx-control** and **amx-dvx-listener**. The constants defined within **amx-dvx-api** can also be referenced when passing values to control functions (where function parameters have a limited allowable set of values for one or more parameters) or checking to see the values of the callback function parameters.

#####Usage:
Include **amx-dvx-api** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-dvx-api'

NOTE: If the main program file includes **amx-dvx-control** and/or **amx-dvx-listener** it is not neccessary to include **amx-dvx-api** in the main program file as well as each of them already includes **amx-dvx-api** but doing so will not cause any issues.


amx-dvx-control
---------------
#####Dependencies:
+ amx-dvx-api
+ amx-device-control (*see readme for amx-device-library for info*)

#####Description: 
Contains functions for controlling the various components of an AMX Enova DVX switcher and requesting information from the DVX.

Some functions defined within **amx-dvx-control** have an limited allowable set of values for one or more parameters. In these instances the allowable values will be printed within the accompanying commenting as constants defined within **amx-dvx-api**.

#####Usage:
Include **amx-dvx-control** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-dvx-control'

and call the function(s) defined within **amx-dvx-control** from the main program file,. E.g:

	button_event [dvTp,btnMuteAudio]
	{
		push:
		{
			dvxEnableAudioOutputMute (dvDvxAudioOutputMainSpeakers)
		}
	}

	button_event [dvTp,btnSelectPcVideoOnly]
	{
		push:
		{
			dvxSwitch (dvDvxMainPort, cSIGNAL_TYPE_VIDEO, dvDvxVideoInputPc.port, dvDvxVideoOutputProjector.port)
		}
	}


amx-dvx-listener
----------------
#####Dependencies:
+ amx-dvx-api

#####Description:
Contains dev arrays for listening to traffic returned from the AMX DVX switcher.

You should copy the required dev arrays to their main program and instantiate them with dev values corresponding to the DVX switcher components they wish to listen to.

Contains commented out callback functions and events required to capture information from the AMX Enova DVX switcher. The events (data_events, channel_events, & level_events) will parse the information returned from the DVX and call the associated callback functions passing the information through as arguments to the call back functions' parameter list.

Callback functions may be triggered from both unprompted data and responses to requests for information.

#####Usage:
Include **amx-dvx-listener** into the main program using the `#include` compiler directive. E.g:

	#include 'amx-dvx-listener'

Copy the required DEV arrays from **amx-dvx-listener**:

	define_variable

	#if_not_defined dvDvxVidOutPorts
	dev dvDvxVidOutPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0 }
	#end_if

to the main program file and populate the contents of the DEV arrays with only the ports of the DVX that you want to listen to. E.g:

	define_device

	dvDvxVideoOutputMonitorLeft = 5002:1:0
	dvDvxVideoOutputMonitorRight = 5002:2:0
	dvDvxVideoOutputProjector = 5002:3:0

	define_variable

	// DEV array for DVX video output ports copied from amx-dvx-listener
	dev dvDvxVidOutPorts[] = { dvDvxVideoOutputMonitorLeft, dvDvxVideoOutputMonitorRight, dvDvxVideoOutputProjector }

NOTE: The order of the devices within the DEV arrays does not matter. You can also have device ports from multiple DVX's within the same DEV array. You can have as few (1) or as many devices defined within the DEV array as you want to listen to.

Copy whichever callback functions you would like to use to monitor changes on the DVX or capture responses to requests for information in your main program file. The callback function should then be uncommented and the contents of the statement block filled in appropriately. The callback functions should not be uncommented within **amx-dvx-listener**. E.g:

Copy an empty, commented out callback function from **amx-dvx-listener** and the associated `#define` statement:

	/*
	#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
	define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
	{
	    // dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	    // volume is the volume value (range: 0 to 100)
	}
	*/

paste the callback function and `#define` statement into the main program file, uncomment, and add any code statements you want:

	#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
	define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
	{
	    // dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	    // volume is the volume value (range: 0 to 100)

	    // update the variable keeping track of volume for the speakers if the audio output port is the one connected to the main speakers
	    if (dvxAudioOutput == dvDvxSpeakers)
	    {
	    	speakerVolume = volume
	    }
	}

The callback function will be automatically triggered whenever a change occurs on the DVX (that initiates an unsolicted feedback response) or a response to a request for information is received.

###IMPORTANT!
1. The `#define` compiler directive found directly above the callback function within **amx-dvx-listener** must also be copied to the main program and uncommented along with the callback function itself.

2. Due to the way the NetLinx compiler scans the program for `#define` staments **amx-dvx-listener** must be included in the main program file underneath any callback functions and associated `#define` statements or the callback functions will will not trigger.

E.g:

		#program_name='main program'
			
		define_device
			
		dvDvxMain = 5002:1:0
		dvDvxVideoOutputProjector = 5002:1:0
		dvDvxAudioOutputSpeakers = 5002:1:0
			
		define_variable
			
		// DEV arrays for amx-dvx-listener to use
		dev dvDvxMainPorts[] = { dvDvxMain }
		dev dvDvxVidOutPorts[] = { dvDvxVideoOutputProjector }
		dvDvxAudOutPorts[] = { dvDvxAudioOutputSpeakers }
			
		#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
		define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
		{
		}
		
		#define INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
		define_function dvxNotifyInternalTemperature (dev dvxPort1, integer tempCelcius)
		{
		}
		
		#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
		define_function dvxNotifyVideoOutputAspectRatio (dev dvxVideoOutput, char aspectRatio[])
		{
		}
		
		#include 'amx-dvx-listener'

---------------------------------------------------------------

Author: David Vine - AMX Australia  
Readme formatted with markdown  
Any questions, email <support@amxaustralia.com.au> or phone +61 (7) 5531 3103.
