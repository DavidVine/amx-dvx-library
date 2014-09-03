program_name='amx-dvx-control'


#if_not_defined __AMX_DVX_CONTROL__
#define __AMX_DVX_CONTROL__

/*
 * --------------------
 * amx-dvx-control
 *
 * For usage, check out the readme for the amx-dvx-library.
 * --------------------
 */

define_constant

char VERSION_AMX_DVX_CONTROL[] = 'v1.0.0'

#include 'amx-dvx-api'
#include 'amx-device-control'
#include 'common'


/*
 * --------------------
 * Function Naming Format
 * 
 * dvxRequestXXXXXXXX
 *  - call the dvxRequest functions to request information from a DVX.
 * 
 * dvxSetXXXXXXX
 *  - call the dvxSet functions to set a value on a DVX (e.g., volume).
 * 
 * dvxEnableXXXXXXX
 *  - call the dvxEnable functions to enable a setting on the DVX which can be enabled or disabled.
 * 
 * dvxDisableXXXXXXX
 *  - call the dvxDisable functions to disable a setting on the DVX which can be enabled or disabled.
 * 
 * dvxCycleXXXXXX
 * - call the dvxCycle functions to toggle a setting on the DVX from enabled to disabled or vice versa.
 * --------------------
 */


/*
 * --------------------
 * Front panel functions
 * --------------------
 */

/*
 * Function:    dvxRequestFrontPanelLockout
 * 
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 * 
 * Description: Requests the status of the DVX front panel lockout.
 */
define_function dvxRequestFrontPanelLockout (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_LOCKOUT_REQUEST")
}

/*
 * Function:    dvxEnableFrontPanelLockout
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Enables front panel lockout on the DVX.
 */
define_function dvxEnableFrontPanelLockout (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_LOCKOUT,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableFrontPanelLockout
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Disables front panel lockout on the DVX.
 */
define_function dvxDisableFrontPanelLockout (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_LOCKOUT,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestFrontPanelLockoutType
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests the the type of lockout set for the DVX
 *              front panel.
 */
define_function dvxRequestFrontPanelLockoutType (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE_REQUEST")
}

/*
 * Function:    dvxSetFrontPanelLockoutType
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Sets the the type of lockout for the DVX front
 *              panel.
 */
define_function dvxSetFrontPanelLockoutType (dev dvxPort1, integer lockoutType)
{
	switch (lockoutType)
	{
		case DVX_LOCKTYPE_ALL_MENUS:
		case DVX_LOCKTYPE_RESERVED:
		case DVX_LOCKTYPE_CONFIGURE_MENUS_ONLY:
		{
			sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE,itoa(lockoutType)")
		}
	}
}

/*
 * Function:    dvxRequestFrontPanelIntensityLcd
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests LCD display light intensity.
 */
define_function dvxRequestFrontPanelIntensityLcd (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_INTENSITY_LCD_REQUEST")
}

/*
 * Function:    dvxSetFrontPanelIntensityLcd
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer intensity - light intensity
 *
 * Description: Sets the LCD display light intensity.
 */
define_function dvxSetFrontPanelIntensityLcd (dev dvxPort1, integer intensity)
{
	// range 0 to 100
	if(intensity > 100)
	intensity = 100
	
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_INTENSITY_LCD,itoa(intensity)")
}

/*
 * Function:    dvxRequestFrontPanelIntensityLeds
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests front panel button LED light intensity.
 */
define_function dvxRequestFrontPanelIntensityLeds (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS_REQUEST")
}

/*
 * Function:    dvxSetFrontPanelIntensityLeds
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer intensity - light intensity
 *              
 * Description: Sets the front panel button LED light intensity.
 */
define_function dvxSetFrontPanelIntensityLeds (dev dvxPort1, integer intensity)
{
	// range 0 to 100
	if(intensity > 100)
	intensity = 100
	
	sendCommand (dvxPort1, "DVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS,itoa(intensity)")
}


/*
 * --------------------
 * System functions
 * --------------------
 */


/*
 * Function:    dvxRequestDxlinkInputPortEthernetStatus
 *
 * Arguments:   dev dvxDxLinkInputPort - DXLink input port on DVX
 *
 * Description: Requests Ethernet status on DXLink input.
 */
define_function dvxRequestDxlinkInputPortEthernetStatus (dev dvxDxLinkInputPort)
{
	sendCommand (dvxDxLinkInputPort, "DVX_COMMAND_DXLINK_INPUT_ETHERNET_REQUEST")
}

/*
 * Function:    dvxEnableDxlinkInputPortEthernet
 *
 * Arguments:   dev dvxDxLinkInputPort - DXLink input port on DVX
 *
 * Description: Enables Ethernet status on DXLink input.
 */
define_function dvxEnableDxlinkInputPortEthernet (dev dvxDxLinkInputPort)
{
	sendCommand (dvxDxLinkInputPort, "DVX_COMMAND_DXLINK_INPUT_ETHERNET,DVX_DXLINK_ETHERNET_AUTO")
}

/*
 * Function:    dvxDisableDxlinkInputPortEthernet
 *
 * Arguments:   dev dvxDxLinkInputPort - DXLink input port on DVX
 *
 * Description: Disables Ethernet status on DXLink input.
 */
define_function dvxDisableDxlinkInputPortEthernet (dev dvxDxLinkInputPort)
{
	sendCommand (dvxDxLinkInputPort, "DVX_COMMAND_DXLINK_INPUT_ETHERNET,DVX_DXLINK_ETHERNET_OFF")
}

/*
 * Function:    dvxRequestDxlinkOutputPortEthernetStatus
 *
 * Arguments:   dev dvxDxLinkOutputPort - DXLink output port on DVX
 *
 * Description: Requests Ethernet status on DXLink output.
 */
define_function dvxRequestDxlinkOutputPortEthernetStatus (dev dvxDxLinkOutputPort)
{
	sendCommand (dvxDxLinkOutputPort, "DVX_COMMAND_DXLINK_OUTPUT_ETHERNET_REQUEST")
}

/*
 * Function:    dvxEnableDxlinkOutputPortEthernet
 *
 * Arguments:   dev dvxDxLinkOutputPort - DXLink output port on DVX
 *
 * Description: Enables Ethernet status on DXLink output.
 */
define_function dvxEnableDxlinkOutputPortEthernet (dev dvxDxLinkOutputPort)
{
	sendCommand (dvxDxLinkOutputPort, "DVX_COMMAND_DXLINK_OUTPUT_ETHERNET,DVX_DXLINK_ETHERNET_AUTO")
}

/*
 * Function:    dvxDisableDxlinkOutputPortEthernet
 *
 * Arguments:   dev dvxDxLinkOutputPort - DXLink output port on DVX
 *
 * Description: Disables Ethernet status on DXLink output.
 */
define_function dvxDisableDxlinkOutputPortEthernet (dev dvxDxLinkOutputPort)
{
	sendCommand (dvxDxLinkOutputPort, "DVX_COMMAND_DXLINK_OUTPUT_ETHERNET,DVX_DXLINK_ETHERNET_OFF")
}

/*
 * Function:    dvxRequestFanSpeed
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests DVX internal fan speed.
 */
define_function dvxRequestFanSpeed (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_FAN_SPEED_REQUEST")
}

/*
 * Function:    dvxRequestTemperature
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests DVX internal temperature.
 */
define_function dvxRequestTemperature (dev dvxPort1)
{
	sendCommand (dvxPort1, "DVX_COMMAND_TEMPERATURE_REQUEST")
}


/*
 * --------------------
 * Switching functions
 * --------------------
 */


/*
 * Function:    dvxSwitchVideoOnly
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - video source input to send
 *              integer output - video destination to send to
 *
 * Description: Perform a video route from a specified input to a
 *              specified output.
 */
define_function dvxSwitchVideoOnly(dev dvxPort1, integer input, integer output)
{
	sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_VIDEO_ONLY,itoa(input),'O',itoa(output)")
	//sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_VIDEO,itoa(input),'O',itoa(output)")
}

/*
 * Function:    dvxSwitchAudioOnly
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - audio source input to send
 *              integer output - audio destination to send to
 *
 * Description: Perform an audio route from a specified input to a
 *              specified output.
 */
define_function dvxSwitchAudioOnly(dev dvxPort1, integer input, integer output)
{
	sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_AUDIO_ONLY,itoa(input),'O',itoa(output)")
	//sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_AUDIO,itoa(input),'O',itoa(output)")
}

/*
 * Function:    dvxSwitchAll
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - source input to send
 *              integer output - destination to send to
 *
 * Description: Perform a route from a specified input to a
 *              specified output. Switches both audio and video.
 */
define_function dvxSwitchAll(dev dvxPort1, integer input, integer output)
{
	sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_ALL,itoa(input),'O',itoa(output)")
	//sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_AUDIO_AND_VIDEO,itoa(input),'O',itoa(output)")
}

/*
 * Function:    dvxSwitch
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              char cSignalType[] - signal type
 *                      Values:
 *                          SIGNAL_TYPE_VIDEO
 *                          SIGNAL_TYPE_AUDIO
 *                          SIGNAL_TYPE_ALL
 *              integer input - source input to send
 *              integer output - destination to send to
 *
 * Description: Perform a route from a specified input to a
 *              specified output. Signal type to switch dependent
 *              on value of cSignalType parameter passed through.
 */
define_function dvxSwitch (dev dvxPort1, char cSignalType[], integer input, integer output)
{
	switch (cSignalType)
	{
		case SIGNAL_TYPE_VIDEO:	sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_VIDEO_ONLY,itoa(input),'O',itoa(output)")
		case SIGNAL_TYPE_AUDIO:	sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_AUDIO_ONLY,itoa(input),'O',itoa(output)")
		case SIGNAL_TYPE_ALL:		sendCommand (dvxPort1, "DVX_COMMAND_SWITCH_ALL,itoa(input),'O',itoa(output)")
	}
}


/*
 * --------------------
 * Request functions
 * --------------------
 */


/*
 * Function:    dvxRequestInputVideo
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer output - video output
 *
 * Description: Requests the video input that is switched to the
 *              specified video output.
 */
define_function dvxRequestInputVideo (dev dvxPort1, integer output)
{
	sendCommand (dvxPort1, "DVX_COMMAND_INPUT_REQUEST,SIGNAL_TYPE_VIDEO,',',itoa(output)")
}

/*
 * Function:    dvxRequestOutputVideo
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - video input
 *
 * Description: Requests the video output that the specified video
 *              input is switched to.
 */
define_function dvxRequestOutputVideo (dev dvxPort1, integer input)
{
	sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_VIDEO,',',itoa(input)")
}

/*
 * Function:    dvxRequestInputAudio
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer output - audio output
 *
 * Description: Requests the audio input that is switched to the
 *              specified audio output.
 */
define_function dvxRequestInputAudio (dev dvxPort1, integer output)
{
	sendCommand (dvxPort1, "DVX_COMMAND_INPUT_REQUEST,SIGNAL_TYPE_AUDIO,',',itoa(output)")
}

/*
 * Function:    dvxRequestOutputAudio
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - audio input
 *
 * Description: Requests the audio output that the specified audio
 *              input is switched to.
 */
define_function dvxRequestOutputAudio (dev dvxPort1, integer input)
{
	sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_AUDIO,',',itoa(input)")
}

/*
 * Function:    dvxRequestOutputAll
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              integer input - audio input
 *
 * Description: Requests the audio output that the specified audio
 *              input is switched to.
 */
define_function dvxRequestOutputAll (dev dvxPort1, integer input)
{
	sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_ALL,',',itoa(input)")
}

/*
 * Function:    dvxRequestInput
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              char cSignalType[] - signal type
 *                      Values:
 *                          SIGNAL_TYPE_VIDEO
 *                          SIGNAL_TYPE_AUDIO
 *                          SIGNAL_TYPE_ALL
 *              integer output - audio output
 *
 * Description: Requests the input that is switched to the
 *              specified output. Signal type being requested is
 *              dependent on the value of the cSignalType parameter.
 */
define_function dvxRequestInput (dev dvxPort1, char signalType[], integer output)
{
	switch (signalType)
	{
		case SIGNAL_TYPE_VIDEO:	sendCommand (dvxPort1, "DVX_COMMAND_INPUT_REQUEST,SIGNAL_TYPE_VIDEO,',',itoa(output)")
		case SIGNAL_TYPE_AUDIO:	sendCommand (dvxPort1, "DVX_COMMAND_INPUT_REQUEST,SIGNAL_TYPE_AUDIO,',',itoa(output)")
	}
}

/*
 * Function:    dvxRequestOutput
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *              char cSignalType[] - signal type
 *                      Values:
 *                          SIGNAL_TYPE_VIDEO
 *                          SIGNAL_TYPE_AUDIO
 *                          SIGNAL_TYPE_ALL
 *              integer input - audio input
 *
 * Description: Requests the output that the specified input is
 *              switched to. Signal type being requested is
 *              dependent on the value of the cSignalType parameter.
 */
define_function dvxRequestOutput (dev dvxPort1, char signalType[], integer input)
{
	switch (signalType)
	{
		case SIGNAL_TYPE_VIDEO:	sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_VIDEO,',',itoa(input)")
		case SIGNAL_TYPE_AUDIO:	sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_AUDIO,',',itoa(input)")
		case SIGNAL_TYPE_ALL:		sendCommand (dvxPort1, "DVX_COMMAND_OUTPUT_REQUEST,SIGNAL_TYPE_ALL,',',itoa(input)")
	}
}


/*
 * --------------------
 * Video output functions
 * --------------------
 */


/*
 * Function:    dvxRequestVideoOutputAspectRatio
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the aspect ratio of the video output port.
 */
define_function dvxRequestVideoOutputAspectRatio (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ASPECT_RATIO_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputAspectRatio
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char cAspectRatioSetting[] - aspect ratio setting
 *                      Values:
 *                          DVX_ASPECT_RATIO_ANAMORPHIC
 *                          DVX_ASPECT_RATIO_MAINTAIN
 *                          DVX_ASPECT_RATIO_STRETCH
 *                          DVX_ASPECT_RATIO_ZOOM
 *
 * Description: Set the aspect ratio of the video output port.
 */
define_function dvxSetVideoOutputAspectRatio (dev dvxVideoOutputPort, char aspectRatioSetting[])
{
	switch (aspectRatioSetting)
	{
		case DVX_ASPECT_RATIO_ANAMORPHIC:
		case DVX_ASPECT_RATIO_MAINTAIN:
		case DVX_ASPECT_RATIO_STRETCH:
		case DVX_ASPECT_RATIO_ZOOM:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ASPECT_RATIO,aspectRatioSetting")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputBlankImage
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the image setting of the video blanking feature
 *     for the video output port.
 */
define_function dvxRequestVideoOutputBlankImage (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_BLANK_IMAGE_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputBlankImage
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char cBlankImage[] - video blanking image
 *                      Values:
 *                          DVX_BLANK_IMAGE_BLACK
 *                          DVX_BLANK_IMAGE_BLUE
 *                          DVX_BLANK_IMAGE_LOGO_1
 *                          DVX_BLANK_IMAGE_LOGO_2
 *                          DVX_BLANK_IMAGE_LOGO_3
 *
 * Description: Set the image of the video blanking feature for the video
 *              output port.
 */
define_function dvxSetVideoOutputBlankImage (dev dvxVideoOutputPort, char blankImage[])
{
	switch (blankImage)
	{
		case DVX_BLANK_IMAGE_BLACK:
		case DVX_BLANK_IMAGE_BLUE:
		case DVX_BLANK_IMAGE_LOGO_1:
		case DVX_BLANK_IMAGE_LOGO_2:
		case DVX_BLANK_IMAGE_LOGO_3:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_BLANK_IMAGE,blankImage")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputBrightness
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the brightness value of the video output port.
 */
define_function dvxRequestVideoOutputBrightness (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_BRIGHTNESS_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputBrightness
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              integer nBrightness - brightness value (0..100)
 *
 * Description: Sets the brightness value of the video output port.
 */
define_function dvxSetVideoOutputBrightness (dev dvxVideoOutputPort, integer brightness)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_BRIGHTNESS,itoa(brightness)")
}

/*
 * Function:    dvxRequestVideoOutputContrast
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the contrast value of the video output port.
 */
define_function dvxRequestVideoOutputContrast (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_CONTRAST_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputContrast
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              integer nContrast - contrast value (0..100)
 *
 * Description: Sets the contrast value of the video output port.
 */
define_function dvxSetVideoOutputContrast (dev dvxVideoOutputPort, integer contrast)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_CONTRAST,itoa(contrast)")
}

/*
 * Function:    dvxRequestVideoOutputFreeze
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests whether the freeze option is active on the
 *              video output port.
 */
define_function dvxRequestVideoOutputFreeze (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_FREEZE_REQUEST")
}

/*
 * Function:    dvxEnableVideoOutputFreeze
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Enables the freeze option on the video output port.
 */
define_function dvxEnableVideoOutputFreeze (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_FREEZE,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoOutputFreeze
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Disables the freeze option on the video output port.
 */
define_function dvxDisableVideoOutputFreeze (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_FREEZE,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoOutputHorizontalShift
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the horizontal shift value of the video output
 *              port.
 */
define_function dvxRequestVideoOutputHorizontalShift (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputHorizontalShift
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              sinteger snHorizontalShift - horizontal shift value (-127..127)
 *
 * Description: Sets the horizontal shift value of the video output port.
 */
define_function dvxSetVideoOutputHorizontalShift (dev dvxVideoOutputPort, sinteger horizontalShift)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT,itoa(horizontalShift)")
}

/*
 * Function:    dvxRequestVideoOutputHorizontalSize
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the horizontal size value of the image displayed
 *              on the video output port.
 */
define_function dvxRequestVideoOutputHorizontalSize (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputHorizontalSize
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              integer nHorizontalSize - horizontal size value (25..800)
 *
 * Description: Sets the horizontal size value of the image displayed on the
 *              video output port.
 */
define_function dvxSetVideoOutputHorizontalSize (dev dvxVideoOutputPort, integer horizontalSize)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE,itoa(horizontalSize)")
}

/*
 * Function:    dvxRequestVideoOutputMute
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 * 
 * Description: Requests if the video output is muted.
 */
define_function dvxRequestVideoOutputMute (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_MUTE_REQUEST")
}

/*
 * Function:    dvxEnableVideoOutputMute
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Enable video mute on the video output.
 */
define_function dvxEnableVideoOutputMute (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_MUTE,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoOutputMute
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Disable video mute on the video output.
 */
define_function dvxDisableVideoOutputMute (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_MUTE,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoOutputOn
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the active status of the video output.
 */
define_function dvxRequestVideoOutputOn (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ON_REQUEST")
}

/*
 * Function:    dvxEnableVideoOutputOn
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Activate (turn on) the video output.
 */
define_function dvxEnableVideoOutputOn (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ON,STATUS_ON")
}

/*
 * Function:    dvxDisableVideoOutputOn
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Deactivate (turn off) the video output.
 */
define_function dvxDisableVideoOutputOn (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ON,STATUS_OFF")
}

/*
 * Function:    dvxRequestVideoOutputOsd
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests whether the OSD setting is enabled on the video
 *              output.
 */
define_function dvxRequestVideoOutputOsd (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD_REQUEST")
}

/*
 * Function:    dvxEnableVideoOutputOsd
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Enable the OSD for the video output.
 */
define_function dvxEnableVideoOutputOsd (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoOutputOsd
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Disable the OSD for the video output.
 */
define_function dvxDisableVideoOutputOsd (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoOutputOsdColor
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the color of the OSD on the video output port.
 */
define_function dvxRequestVideoOutputOsdColor (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD_COLOR_REQUEST")
}

/*
 * Function:    dvxRequestVideoOutputOsdColor
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char osdColor[] - OSD color scheme
 *                      Values:
 *                          DVX_OSD_COLOR_BLACK
 *                          DVX_OSD_COLOR_BLUE
 *                          DVX_OSD_COLOR_WHITE
 *                          DVX_OSD_COLOR_YELLOW
 *
 * Description: Sets the OSD color scheme for the video output port.
 */
define_function dvxSetVideoOutputOsdColor (dev dvxVideoOutputPort, char osdColor[])
{
	switch (osdColor)
	{
		case DVX_OSD_COLOR_BLACK:
		case DVX_OSD_COLOR_BLUE:
		case DVX_OSD_COLOR_WHITE:
		case DVX_OSD_COLOR_YELLOW:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD_COLOR,osdColor")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputOsdPosition
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the OSD position for the video output port.
 */
define_function dvxRequestVideoOutputOsdPosition (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD_POSITION_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputOsdPosition
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char osdPosition [] - OSD position
 *                      Values:
 *                          DVX_OSD_POSITION_TOP_LEFT
 *                          DVX_OSD_POSITION_TOP_RIGHT
 *                          DVX_OSD_POSITION_BOTTOM_LEFT
 *                          DVX_OSD_POSITION_BOTTOM_RIGHT
 *
 * Description: Sets the OSD position for the video output port.
 */
define_function dvxSetVideoOutputOsdPosition (dev dvxVideoOutputPort, char osdPosition[])
{
	switch (osdPosition)
	{
		case DVX_OSD_POSITION_TOP_LEFT:
		case DVX_OSD_POSITION_TOP_RIGHT:
		case DVX_OSD_POSITION_BOTTOM_LEFT:
		case DVX_OSD_POSITION_BOTTOM_RIGHT:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_OSD_COLOR,osdPosition")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputResolution
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the resolution and refresh rate of the video
 *              output port.
 */
define_function dvxRequestVideoOutputResolution (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_RESOLUTION_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputResolution
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char resolution (] - resolution and refresh rate
 *              in form of <hor>x<ver>,<ref>
 *                                   E.g #1:  1024x768,60
 *                                   E.g #2:  1920x1080p,60
 *
 * Description: Sets the resolution and refresh rate of the video output
 *              port.
 */
define_function dvxSetVideoOutputResolution (dev dvxVideoOutputPort, char resolution[])
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_RESOLUTION,resolution")
}

/*define_function dvxSetVideoOutputResolution (dev dvxVideoOutputPort, integer horizontal, integer vertical, integer progressiveFlag, integer refresh)
{
    if (progressiveFlag == FALSE)
		sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_RESOLUTION,itoa(horizontal),'x',itoa(vertical),',',itoa(refresh)")
    else if (progressiveFlag == TRUE)
		sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_RESOLUTION,itoa(horizontal),'x',itoa(vertical),'p,',itoa(refresh)")
}*/

/*
 * Function:    dvxRequestVideoOutputScaleMode
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the status of the scaling mode on the video
 *              output port.
 */
define_function dvxRequestVideoOutputScaleMode (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_SCALE_MODE_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputScaleMode
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char scaleMode[] - scaling mode
 *                      Values:
 *                          DVX_SCALE_MODE_AUTO
 *                          DVX_SCALE_MODE_BYPASS
 *                          DVX_SCALE_MODE_MANUAL
 *
 * Description: Sets the scaling mode on the video output port.
 */
define_function dvxSetVideoOutputScaleMode (dev dvxVideoOutputPort, char scaleMode[])
{
	switch (scaleMode)
	{
		case DVX_SCALE_MODE_AUTO:
		case DVX_SCALE_MODE_BYPASS:
		case DVX_SCALE_MODE_MANUAL:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_SCALE_MODE,scaleMode")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputTestPattern
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the test pattern setting for the video output
 *              port.
 */
define_function dvxRequestVideoOutputTestPattern (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_TEST_PATTERN_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputTestPattern
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              char testPattern[] - test pattern
 *                      Values:
 *                          DVX_TEST_PATTERN_OFF
 *                          DVX_TEST_PATTERN_COLOR_BAR
 *                          DVX_TEST_PATTERN_GRAY_RAMP
 *                          DVX_TEST_PATTERN_SMPTE_BAR
 *                          DVX_TEST_PATTERN_HILO_TRACK
 *                          DVX_TEST_PATTERN_PLUGE
 *                          DVX_TEST_PATTERN_X_HATCH
 *                          DVX_TEST_PATTERN_LOGO_1
 *                          DVX_TEST_PATTERN_LOGO_2
 *                          DVX_TEST_PATTERN_LOGO_3
 *
 * Description: Sets the test pattern for the video output port.
 */
define_function dvxSetVideoOutputTestPattern (dev dvxVideoOutputPort, char testPattern[])
{
	switch (testPattern)
	{
		case DVX_TEST_PATTERN_OFF:
		case DVX_TEST_PATTERN_COLOR_BAR:
		case DVX_TEST_PATTERN_GRAY_RAMP:
		case DVX_TEST_PATTERN_SMPTE_BAR:
		case DVX_TEST_PATTERN_HILO_TRACK:
		case DVX_TEST_PATTERN_PLUGE:
		case DVX_TEST_PATTERN_X_HATCH:
		case DVX_TEST_PATTERN_LOGO_1:
		case DVX_TEST_PATTERN_LOGO_2:
		case DVX_TEST_PATTERN_LOGO_3:
		{
			sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_TEST_PATTERN,testPattern")
		}
	}
}

/*
 * Function:    dvxRequestVideoOutputVerticalShift
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the vertical shift value of the video output port.
 */
define_function dvxRequestVideoOutputVerticalShift (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputVerticalShift
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              sinteger verticalShift - vertical shift value (-127..127)
 *
 * Description: Sets the brightness value of the video output port.
 */
define_function dvxSetVideoOutputVerticalShift (dev dvxVideoOutputPort, sinteger verticalShift)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT,itoa(verticalShift)")
}

/*
 * Function:    dvxRequestVideoOutputVerticalSize
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the vertical size value of the image displayed
 *              on the video output port.
 */
define_function dvxRequestVideoOutputVerticalSize (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputVerticalSize
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              integer verticalSize - vertical shift value (-127..127)
 *
 * Description: Sets the vertical size value of the image displayed on the
 *              video output port.
 */
define_function dvxSetVideoOutputVerticalSize (dev dvxVideoOutputPort, integer verticalSize)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE,itoa(verticalSize)")
}

/*
 * Function:    dvxRequestVideoOutputZoom
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Requests the zoom setting for the video output port.
 */
define_function dvxRequestVideoOutputZoom (dev dvxVideoOutputPort)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ZOOM_REQUEST")
}

/*
 * Function:    dvxSetVideoOutputZoom
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *              integer zoom - zoom value (25..800)
 *
 * Description: Sets the zoom for the video output port.
 */
define_function dvxSetVideoOutputZoom (dev dvxVideoOutputPort, integer zoom)
{
	sendCommand (dvxVideoOutputPort, "DVX_COMMAND_VIDEO_OUT_ZOOM,itoa(zoom)")
}


/*
 * --------------------
 * Video input functions
 * --------------------
 */


/*
 * Function:    dvxRequestVideoInputBrightness
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the brightness of the video input port.
 */
define_function dvxRequestVideoInputBrightness (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_BRIGHTNESS_REQUEST")
}

/*
 * Function:    dvxSetVideoInputBrightness
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              integer brightness - brightness value (0..100)
 *
 * Description: Sets the the brightness of the video input port.
 */
define_function dvxSetVideoInputBrightness (dev dvxVideoInputPort, integer brightness)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_BRIGHTNESS,itoa(brightness)")
}

/*
 * Function:    dvxRequestVideoInputBlackAndWhiteState
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests whether the black and white setting is enabled
 *              on the video input port.
 */
define_function dvxRequestVideoInputBlackAndWhiteState (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE_REQUEST")
}

/*
 * Function:    dvxEnableVideoInputBlackAndWhiteState
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enables the black and white setting on the video input
 *              port.
 */
define_function dvxEnableVideoInputBlackAndWhiteState (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoInputBlackAndWhite
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disables the black and white setting on the video input
 *              port.
 */
define_function dvxDisableVideoInputBlackAndWhite (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoInputColor
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests whether the color setting is enabled on the
 *              video input port.
 */
define_function dvxRequestVideoInputColor (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_COLOR_REQUEST")
}

/*
 * Function:    dvxEnableVideoInputColor
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enables the color setting on the video input port.
 */
define_function dvxEnableVideoInputColor (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_COLOR,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoInputColor
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disables the color setting on the video input port.
 */
define_function dvxDisableVideoInputColor (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_COLOR,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoInputContrast
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the contrast of the video input port.
 */
define_function dvxRequestVideoInputContrast (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_CONTRAST_REQUEST")
}

/*
 * Function:    dvxSetVideoInputContrast
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              integer contrast - contrast value (0..100)
 *
 * Description: Sets the the contrast of the video input port.
 */
define_function dvxSetVideoInputContrast (dev dvxVideoInputPort, integer contrast)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_CONTRAST,itoa(contrast)")
}

/*
 * Function:    dvxRequestVideoInputEdidSource
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests which EDID source the video input is mirroring.
 */
define_function dvxRequestVideoInputEdidSource (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_SOURCE_REQUEST")
}

/*
 * Function:    dvxSetVideoInputEdidSource
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Sets the EDID source to mirror the video input.
 */
define_function dvxSetVideoInputEdidSource (dev dvxVideoInputPort, char edidSource[])
{
	switch (edidSource)
	{
		case DVX_EDID_SOURCE_FULL_SCREEN:
		case DVX_EDID_SOURCE_WIDE_SCREEN:
		case DVX_EDID_SOURCE_ALL_RESOLUTIONS:
		case DVX_EDID_SOURCE_MIRROR_OUTPUT_1:
		case DVX_EDID_SOURCE_MIRROR_OUTPUT_2:
		case DVX_EDID_SOURCE_MIRROR_OUTPUT_3:
		case DVX_EDID_SOURCE_MIRROR_OUTPUT_4:
		{
			sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_SOURCE,edidSource")
		}
	}
}

/*
 * Function:    dvxRequestEdidAutoUpdate
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests whether the EDID source for the video input
 *              updates the available list of resolutions at regular
 *              intervals.
 */
define_function dvxRequestEdidAutoUpdate (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO_REQUEST")
}

/*
 * Function:    dvxEnableEdidAutoUpdate
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enables the EDID source for the video input to update the
 *              list of available resolutions at regular intervals.
 */
define_function dvxEnableEdidAutoUpdate (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableEdidAutoUpdate
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disables the EDID source for the video input from updating
 *              the list of available resolutions at regular intervals.
 */
define_function dvxDisableEdidAutoUpdate (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoInputEdidPreferredResolution
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the preferred resolution of the EDID source for
 *              the video input.
 */
define_function dvxRequestVideoInputEdidPreferredResolution (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION_REQUEST")
}

/*
 * Function:    dvxSetVideoInputEdidPreferredResolution
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Sets the preferred resolution for the EDID source for
 *              the video input.
 */
define_function dvxSetVideoInputEdidPreferredResolution (dev dvxVideoInputPort, char resolution[])
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION,resolution")
}

/*
 * Function:    dvxRequestVideoFormat
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the input format of the video port.
 */
define_function dvxRequestVideoFormat (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_FORMAT_REQUEST")
}

/*
 * Function:    dvxSetVideoInputFormat
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              char signalFormat[] - signal format
 *                      Values:
 *                          VIDEO_SIGNAL_FORMAT_HDMI
 *                          VIDEO_SIGNAL_FORMAT_DVI
 *                          VIDEO_SIGNAL_FORMAT_VGA
 *                          VIDEO_SIGNAL_FORMAT_COMPOSITE
 *                          VIDEO_SIGNAL_FORMAT_COMPONENT
 *                          VIDEO_SIGNAL_FORMAT_SVIDEO
 *
 * Description: Sets the input format of the video port.
 */
define_function dvxSetVideoInputFormat (dev dvxVideoInputPort, char signalFormat[])
{
	switch (signalFormat)
	{
		case VIDEO_SIGNAL_FORMAT_HDMI:
		case VIDEO_SIGNAL_FORMAT_DVI:
		case VIDEO_SIGNAL_FORMAT_VGA:
		case VIDEO_SIGNAL_FORMAT_COMPOSITE:
		case VIDEO_SIGNAL_FORMAT_COMPONENT:
		case VIDEO_SIGNAL_FORMAT_SVIDEO:
		{
			sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_FORMAT,signalFormat")
		}
	}
}

/*
 * Function:    dvxRequestVideoInputHdcpCompliance
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the HDCP compliance setting of the video port.
 */
define_function dvxRequestVideoInputHdcpCompliance (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE_REQUEST")
}

/*
 * Function:    dvxEnableVideoInputHdcpCompliance
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable the HDCP compliance setting on the video port.
 */
define_function dvxEnableVideoInputHdcpCompliance (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoInputHdcpCompliance
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable the HDCP compliance setting on the video port.
 */
define_function dvxDisableVideoInputHdcpCompliance (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoInputHorizontalShift
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the horizontal shift value of the VGA video input
 *              port.
 */
define_function dvxRequestVideoInputHorizontalShift (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT_REQUEST")
}

/*
 * Function:    dvxSetVideoInputHorizontalShift
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              sinteger horizontalShift - horizontal shift value (-50..50)
 *
 * Description: Sets the horizontal shift value of the VGA video input port.
 */
define_function dvxSetVideoInputHorizontalShift (dev dvxVideoInputPort, sinteger horizontalShift)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT,itoa(horizontalShift)")
}

/*
 * Function:    dvxRequestVideoInputHue
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the hue value of the video input port.
 */
define_function dvxRequestVideoInputHue (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HUE_REQUEST")
}

/*
 * Function:    dvxSetVideoInputHue
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              integer hue - hue (0..100)
 *
 * Description: Sets the hue value of the video input port.
 */
define_function dvxSetVideoInputHue (dev dvxVideoInputPort, integer hue)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_HUE,itoa(hue)")
}

/*
 * Function:    dvxRequestVideoInputName
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the name of the video input port.
 */
define_function dvxRequestVideoInputName (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
}

/*
 * Function:    dvxRequestVideoInputNameAll
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests the name of all video input ports.
 */
define_function dvxRequestVideoInputNameAll (dev dvxPort1)
{
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_1:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_2:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_3:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_4:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_5:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_6:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_7:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_8:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_9:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_10:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_NAME_REQUEST")
}

/*
 * Function:    dvxSetVideoInputName
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Sets the name of the video input port.
 */
define_function dvxSetVideoInputName (dev dvxVideoInputPort, char name[])
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_NAME,name")
}

/*
 * Function:    dvxRequestVideoInputPhase
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the input phase value of the VGA video input port.
 */
define_function dvxRequestVideoInputPhase (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_PHASE_REQUEST")
}

/*
 * Function:    dvxSetVideoInputPhase
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              integer phase - input phase value (0..31)
 *
 * Description: Sets the horizontal shift value of the VGA video input port.
 */
define_function dvxSetVideoInputPhase (dev dvxVideoInputPort, integer phase)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_PHASE,itoa(phase)")
}

/*
 * Function:    dvxRequestVideoInputResolutionAuto
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the status of the auto resolution setting on the
 *              video input port.
 */
define_function dvxRequestVideoInputResolutionAuto (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO_REQUEST")
}

/*
 * Function:    dvxEnableVideoInputResolutionAuto
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enables the auto resolution setting on the video input
 *              port.
 */
define_function dvxEnableVideoInputResolutionAuto (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableVideoResolutionAuto
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disables the auto resolution setting on the video input
 *              port.
 */
define_function dvxDisableVideoResolutionAuto (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestVideoInputResolution
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the resolution of the video input port.
 */
define_function dvxRequestVideoInputResolution (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_RESOLUTION_REQUEST")
}

/*
 * Function:    dvxSetVideoInputResolution
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              char resolution[] - resolution string
 *                                       Format: <hor>x<ver>[i|p],<ref>
 *
 * Description: Sets the resolution of the video input port.
 */
define_function dvxSetVideoInputResolution (dev dvxVideoInputPort, char resolution[])
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_RESOLUTION,resolution")
}

/*
 * Function:    dvxRequestVideoInputSaturation
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the saturation level of the video input port.
 */
define_function dvxRequestVideoInputSaturation (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_SATURATION_REQUEST")
}

/*
 * Function:    dvxSetVideoInputSaturation
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              integer saturation - saturation level (0..100)
 *
 * Description: Sets the saturation level of the video input port.
 */
define_function dvxSetVideoInputSaturation (dev dvxVideoInputPort, integer saturation)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_SATURATION,itoa(saturation)")
}

/*
 * Function:    dvxRequestVideoInputStatus
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the status of the video input port.
 */
define_function dvxRequestVideoInputStatus (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
}

/*
 * Function:    dvxRequestVideoInputStatusAll
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX siwtcher device
 *
 * Description: Requests the status of the video input port.
 */
define_function dvxRequestVideoInputStatusAll (dev dvxPort1)
{
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_1:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_2:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_3:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_4:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_5:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_6:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_7:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_8:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_9:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
	sendCommand (dvxPort1.number:DVX_PORT_VID_IN_10:dvxPort1.system, "DVX_COMMAND_VIDEO_IN_STATUS_REQUEST")
}

/*
 * Function:    dvxRequestVideoInputVerticalShift
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Requests the vertical shift value of the RGB video input
 *              port.
 */
define_function dvxRequestVideoInputVerticalShift (dev dvxVideoInputPort)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT_REQUEST")
}

/*
 * Function:    dvxSetVideoInputVerticalShift
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *              sinteger verticalShift - vertical shift value (-10..10)
 *
 * Description: Sets the vertical shifting of the RGB video input port.
 */
define_function dvxSetVideoInputVerticalShift (dev dvxVideoInputPort, sinteger verticalShift)
{
	sendCommand (dvxVideoInputPort, "DVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT,itoa(verticalShift)")
}


/*
 * --------------------
 * Audio input functions
 * --------------------
 */


/*
 * Function:    dvxRequestAudioInputCompression
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the compression setting for the audio input port.
 */
define_function dvxRequestAudioInputCompression (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_REQUEST")
}

/*
 * Function:    dvxSetAudioInputCompression
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              char compressionSetting[] - compression setting
 *                      Values:
 *                          DVX_COMPRESSION_OFF
 *                          DVX_COMPRESSION_LOW
 *                          DVX_COMPRESSION_MEDIUM
 *                          DVX_COMPRESSION_HIGH
 *                          DVX_COMPRESSION_CUSTOM
 *
 * Description: Sets the compression for the audio input port.
 */
define_function dvxSetAudioInputCompression (dev dvxAudioInputPort, CHAR compressionSetting[])
{
	switch (compressionSetting)
	{
		case DVX_COMPRESSION_OFF:
		case DVX_COMPRESSION_LOW:
		case DVX_COMPRESSION_MEDIUM:
		case DVX_COMPRESSION_HIGH:
		case DVX_COMPRESSION_CUSTOM:
		{
			sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION,compressionSetting")
		}
	}
}

/*
 * Function:    dvxRequestAudioInputCompressionAttack
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the compression attack for the audio input port.
 */
define_function dvxRequestAudioInputCompressionAttack (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK_REQUEST")
}

/*
 * Function:    dvxSetAudioInputCompressionAttack
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              integer attack - compression attack (1..2000)
 *
 * Description: Sets the compression attack for the audio input port.
 */
define_function dvxSetAudioInputCompressionAttack (dev dvxAudioInputPort, integer attack)
{

	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK,itoa(attack)")
}

/*
 * Function:    dvxRequestAudioInputCompressionRatio
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the compression ratio for the audio input port.
 */
define_function dvxRequestAudioInputCompressionRatio (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO_REQUEST")
}

/*
 * Function:    dvxSetAudioInputCompressionRatio
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              integer ratio - compression ratio (1..20)
 *
 * Description: Sets the compression ratio for the audio input port.
 */
define_function dvxSetAudioInputCompressionRatio (dev dvxAudioInputPort, integer ratio)
{

	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO,itoa(ratio)")
}

/*
 * Function:    dvxRequestAudioInputCompressionRelease
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the compression release for the audio input port.
 */
define_function dvxRequestAudioInputCompressionRelease (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE_REQUEST")
}

/*
 * Function:    dvxSetAudioInputCompressionRelease
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              integer nReleaseValue - compression release value (1..20)
 *
 * Description: Sets the compression release for the audio input port.
 */
define_function dvxSetAudioInputCompressionRelease (dev dvxAudioInputPort, integer nReleaseValue)
{

	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE,itoa(nReleaseValue)")
}

/*
 * Function:    dvxRequestAudioInputCompressionThreshold
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the compression threshold for the audio input
 *              port.
 */
define_function dvxRequestAudioInputCompressionThreshold (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioInputCompressionThreshold
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              sinteger threshold - compression threshold value (0..-60dB)
 *
 * Description: Sets the compression release for the audio input port.
 */
define_function dvxSetAudioInputCompressionThreshold (dev dvxAudioInputPort, sinteger threshold)
{

	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD,itoa(threshold)")
}

/*
 * Function:    dvxRequestAudioInputGain
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the gain for the audio input port.
 */
define_function dvxRequestAudioInputGain (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_GAIN_REQUEST")
}

/*
 * Function:    dvxSetAudioInputGain
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              sinteger gain - input gain (-24dB..24dB)
 *
 * Description: Sets the gain for the audio input port.
 */
define_function dvxSetAudioInputGain (dev dvxAudioInputPort, sinteger gain)
{

	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_GAIN,itoa(gain)")
}

/*
 * Function:    dvxRequestAudioInputStereo
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Requests the stereo setting for the audio input port.
 */
define_function dvxRequestAudioInputStereo (dev dvxAudioInputPort)
{
	sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_STEREO_REQUEST")
}

/*
 * Function:    dvxSetAudioInputStereo
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *              char stereoSetting[] - stereo setting
 *                      Values:
 *                          DVX_AUDIO_STEREO
 *                          DVX_AUDIO_MONO
 *
 * Description: Sets the stereo setting on the audio input port.
 */
define_function dvxSetAudioInputStereo (dev dvxAudioInputPort, CHAR stereoSetting[])
{
	switch (stereoSetting)
	{
		case DVX_AUDIO_MONO:
		case DVX_AUDIO_STEREO:
		{
			sendCommand (dvxAudioInputPort, "DVX_COMMAND_AUDIO_IN_STEREO,stereoSetting")
		}
	}
}


/*
 * --------------------
 * Audio output functions
 * --------------------
 */


/*
 * Function:    dvxRequestAudioOutputBalance
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the current balance setting for the audio output
 *              port.
 */
define_function dvxRequestAudioOutputBalance (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_BALANCE_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputBalance
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              sinteger balance - balance (-20dB..20dB)
 *
 * Description: Sets the balance for the audio output port.
 */
define_function dvxSetAudioOutputBalance (dev dvxAudioOutputPort, sinteger balance)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_BALANCE,itoa(balance)")
}

/*
 * Function:    dvxRequestAudioOutputDelay
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the delay for the audio output port.
 */
define_function dvxRequestAudioOutputDelay (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DELAY_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputDelay
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer delay - delay (0..200) in milliseconds
 *
 * Description: Sets the delay for the audio output port.
 ***/
define_function dvxSetAudioOutputDelay (dev dvxAudioOutputPort, integer delay)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DELAY,itoa(delay)")
}

/*
 * Function:    dvxSetAudioOutputDuckingAttack
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer attack - ducking attack (1..2000)
 *                                                                         
 * Description: Sets the duration of the attack phase while ducking for
 *              the audio output port.
 */
define_function dvxSetAudioOutputDuckingAttack (dev dvxAudioOutputPort, integer attack)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_ATTACK,itoa(attack)")
}

/*
 * Function:    dvxSetAudioOutputDuckingHold
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer holdValue - ducking hold (0..2000)
 *
 * Description: Sets the duration of the hold phase while ducking for the
 *              audio output port.
 */
define_function dvxSetAudioOutputDuckingHold (dev dvxAudioOutputPort, integer holdValue)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_HOLD,itoa(holdValue)")
}

/*
 * Function:    dvxSetAudioOutputDuckingLevel                            
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer level - ducking level (0..20)
 *
 * Description: Sets the level while ducking for the audio output port.
 */
define_function dvxSetAudioOutputDuckingLevel (dev dvxAudioOutputPort, integer duckingLevel)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_LEVEL,itoa(duckingLevel)")
}

/*
 * Function:    dvxSetAudioOutputDuckingRelease
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer releaseValue - ducking release (10..5000)
 *
 * Description: Sets the duration of the release phase while ducking for
 *              the audio output port.
 */
define_function dvxSetAudioOutputDuckingRelease (dev dvxAudioOutputPort, integer releaseValue)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_RELEASE,itoa(releaseValue)")
}

/*
 * Function:    dvxRequestAudioOutputDuckingThreshold
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the current ducking thresholds of both
 *              microphones for the audio output port.
 */
define_function dvxRequestAudioOutputDuckingThreshold (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputDuckingThreshold
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              sinteger threshold - ducking threshold (-60..0)
 *
 * Description: Sets the ducking thresholds of both microphones on the
 *              audio output port.
 */
define_function dvxSetAudioOutputDuckingThreshold (dev dvxAudioOutputPort, sinteger threshold)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD_REQUEST,itoa(threshold)")
}

/*
 * Function:    dvxRequestAudioOutputDucking
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the current ducking setting for the audio output
 *              port.
 */
define_function dvxRequestAudioOutputDucking (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputDucking
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              char duckingSetting[] - ducking setting
 *                      Values:
 *                          DVX_DUCKING_OFF
 *                          DVX_DUCKING_LOW
 *                          DVX_DUCKING_MEDIUM
 *                          DVX_DUCKING_HIGH
 *                          DVX_DUCKING_CUSTOM
 *
 * Description: Sets the ducking setting for the audio output port.
 */
define_function dvxSetAudioOutputDucking (dev dvxAudioOutputPort, char duckingSetting[])
{
	switch (duckingSetting)
	{
		case DVX_DUCKING_OFF:
		case DVX_DUCKING_LOW:
		case DVX_DUCKING_MEDIUM:
		case DVX_DUCKING_HIGH:
		case DVX_DUCKING_CUSTOM:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_DUCKING,duckingSetting")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputEqCenterFrequency
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *
 * Description: Requests the center frequency on the specified equalizer
 *              eqBand for the audio output port.
 */
define_function dvxRequestAudioOutputEqCenterFrequency (dev dvxAudioOutputPort, integer eqBand)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioOutputEqCenterFrequency
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *              integer frequency - center frequency (20..20000) in Hz
 *
 * Description: Sets the center frequency on the specified equalizer eqBand
 *              for the audio output port.
 */
define_function dvxSetAudioOutputEqCenterFrequency (dev dvxAudioOutputPort, integer eqBand, integer frequency)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY,itoa(eqBand),',',itoa(frequency)")
}

/*
 * Function:    dvxRequestAudioOutputEqFilterType
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *
 * Description: Requests the filter type on the specified equalizer eqBand
 *              for the audio output port.
 */
define_function dvxRequestAudioOutputEqFilterType (dev dvxAudioOutputPort, integer eqBand)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioOutputEqFilterType
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer nBand - eq eqBand (1..10)
 *              char filterType[] - filter type
 *                      Values:
 *                          DVX_EQ_FILTER_TYPE_BELL
 *                          DVX_EQ_FILTER_TYPE_BAND_PASS
 *                          DVX_EQ_FILTER_TYPE_BAND_STOP
 *                          DVX_EQ_FILTER_TYPE_HIGH_PASS
 *                          DVX_EQ_FILTER_TYPE_LOW_PASS
 *                          DVX_EQ_FILTER_TYPE_TREBLE_SHELF
 *                          DVX_EQ_FILTER_TYPE_BASS_SHELF
 *
 * Description: Sets the filter type on the specified equalizer eqBand for
 *              the audio output port.
 */
define_function dvxSetAudioOutputEqFilterType (dev dvxAudioOutputPort, integer eqBand, char filterType[])
{
	switch (filterType)
	{
		case DVX_EQ_FILTER_TYPE_BELL:
		case DVX_EQ_FILTER_TYPE_BAND_PASS:
		case DVX_EQ_FILTER_TYPE_BAND_STOP:
		case DVX_EQ_FILTER_TYPE_HIGH_PASS:
		case DVX_EQ_FILTER_TYPE_LOW_PASS:
		case DVX_EQ_FILTER_TYPE_TREBLE_SHELF:
		case DVX_EQ_FILTER_TYPE_BASS_SHELF:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE,itoa(eqBand),',',filterType")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputEqGain
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *
 * Description: Requests the gain on the specified equalizer eqBand for the
 *              audio output port.
 */
define_function dvxRequestAudioOutputEqGain (dev dvxAudioOutputPort, integer eqBand)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_GAIN_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioOutputEqGain
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *              sinteger gain - gain (-12..12) in dB
 *
 * Description: Sets the gain on the specified equalizer eqBand for the audio
 *              audio output port.
 */
define_function dvxSetAudioOutputEqGain (dev dvxAudioOutputPort, integer eqBand, sinteger gain)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_GAIN,itoa(eqBand),',',itoa(gain)")
}

/*
 * Function:    dvxRequestAudioOutputEqMode
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer nBand - eq eqBand (1..10)
 *
 * Description: Requests the current mode on the specified equalizer eqBand
 *              for the audio output port.
 */
define_function dvxRequestAudioOutputEqMode (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_MODE_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputEqMode
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer nBand - eq eqBand (1..10)
 *              char mode[] - mode
 *                      Values:
 *                          DVX_EQ_MODE_OFF
 *                          DVX_EQ_MODE_MOVIE
 *                          DVX_EQ_MODE_MUSIC
 *                          DVX_EQ_MODE_VOICE
 *
 * Description: Sets the mode on the specified equalizer eqBand for the audio
 *              output port.
 */
define_function dvxSetAudioOutputEqMode (dev dvxAudioOutputPort, char mode[])
{
	switch (mode)
	{
		case DVX_EQ_MODE_OFF:
		case DVX_EQ_MODE_MOVIE:
		case DVX_EQ_MODE_MUSIC:
		case DVX_EQ_MODE_VOICE:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_MODE,mode")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputEqQualityFactor
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *
 * Description: Requests the quality factor (Q) on the specified equalizer
 *              eqBand for the audio output port.
 */
define_function dvxRequestAudioOutputEqQualityFactor (dev dvxAudioOutputPort, integer eqBand)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioOutputEqQualityFactor
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *              float qualityFactor - quality factor (range depends on current filter type)
 *                                         Bell:         (0.1 to 20.0)
 *                                         Band Pass:    (0.1 to 20.0)
 *                                         Band Stop:    (0.1 to 20.0)
 *                                         High Pass:    (0.5 to 1.4)
 *                                         Low Pass:     (0.5 to 1.4)
 *                                         Treble Shelf: (0.5 to 1.0)
 *                                         Bass Shelf:   (0.5 to 1.0)
 *
 * Description: Sets the quality factor (Q) on the specified equalizer eqBand
 *              for the audio output port.
 */
define_function dvxSetAudioOutputEqQualityFactor (dev dvxAudioOutputPort, integer eqBand, float qualityFactor)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR,itoa(eqBand),',',format('%01.1f',qualityFactor)")
}

/*
 * Function:    dvxRequestAudioOutputMaximumVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the maximum volume for the audio output port.
 */
define_function dvxRequestAudioOutputMaximumVolume (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputMaximumVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer volume - maximum volume (0 to 100) in percent
 *
 * Description: Sets the maximum volume for the audio output port.
 */
define_function dvxSetAudioOutputMaximumVolume (dev dvxAudioOutputPort, integer volume)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME,itoa(volume)")
}

/*
 * Function:    dvxRequestAudioOutputMinimumVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the minimum volume for the audio output port.
 */
define_function dvxRequestAudioOutputMinimumVolume (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputMinimumVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer volume - minimum volume (0 to 100) in percent
 *
 * Description: Sets the minimum volume for the audio output port.
 */
define_function dvxSetAudioOutputMinimumVolume (dev dvxAudioOutputPort, integer volume)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME,itoa(volume)")
}

/*
 * Function:    dvxRequestAudioOutputMute
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests mute status for the audio output port.
 */
define_function dvxRequestAudioOutputMute (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MUTE_REQUEST")
}

/*
 * Function:    dvxEnableAudioOutputMute
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Enables mute for the audio output port.
 */
define_function dvxEnableAudioOutputMute (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MUTE,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableAudioOutputMute
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Disables mute for the audio output port.
 */
define_function dvxDisableAudioOutputMute (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_MUTE,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestAudioOutputStereo
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests if audio amp output is in stereo.
 */
define_function dvxRequestAudioOutputStereo (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_STEREO_REQUEST")
}

/*
 * Function:    dvxEnableAudioOutputStereo
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Enables audio amp output in stereo.
 */
define_function dvxEnableAudioOutputStereo (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_STEREO,STATUS_ENABLE")
}

/*
 * Function:    dvxDisableAudioOutputStereo
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Disables audio amp output in stereo.
 */
define_function dvxDisableAudioOutputStereo (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_STEREO,STATUS_DISABLE")
}

/*
 * Function:    dvxRequestAudioOutputTestTone
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the frequency for of the test tone for the audio
 *              output port.
 */
define_function dvxRequestAudioOutputTestTone (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_TEST_TONE_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputTestTone
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              char testToneFrequency[] - test tone frequncy
 *                      Values:
 *                          DVX_TEST_TONE_FREQUENCY_OFF
 *                          DVX_TEST_TONE_FREQUENCY_60_HZ
 *                          DVX_TEST_TONE_FREQUENCY_250_HZ
 *                          DVX_TEST_TONE_FREQUENCY_400_HZ
 *                          DVX_TEST_TONE_FREQUENCY_1_KHZ
 *                          DVX_TEST_TONE_FREQUENCY_3_KHZ
 *                          DVX_TEST_TONE_FREQUENCY_5_KHZ
 *                          DVX_TEST_TONE_FREQUENCY_10_KHZ
 *                          DVX_TEST_TONE_FREQUENCY_PINK_NOISE
 *                          DVX_TEST_TONE_FREQUENCY_WHITE_NOISE
 *
 * Description: Sets the frequency of a test tone for the audio output port.
 */
define_function dvxSetAudioOutputTestTone (dev dvxAudioOutputPort, char testToneFrequency[])
{
	switch (testToneFrequency)
	{
		case DVX_TEST_TONE_FREQUENCY_OFF:
		case DVX_TEST_TONE_FREQUENCY_60_HZ:
		case DVX_TEST_TONE_FREQUENCY_250_HZ:
		case DVX_TEST_TONE_FREQUENCY_400_HZ:
		case DVX_TEST_TONE_FREQUENCY_1_KHZ:
		case DVX_TEST_TONE_FREQUENCY_3_KHZ:
		case DVX_TEST_TONE_FREQUENCY_5_KHZ:
		case DVX_TEST_TONE_FREQUENCY_10_KHZ:
		case DVX_TEST_TONE_FREQUENCY_PINK_NOISE:
		case DVX_TEST_TONE_FREQUENCY_WHITE_NOISE:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_TEST_TONE,testToneFrequency")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the volume setting for the audio output port.
 */
define_function dvxRequestAudioOutputVolume (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_VOLUME_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputVolume
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer volume - volume (0 to 100) in percent
 *
 * Description: Sets the volume on the audio output port.
 */
define_function dvxSetAudioOutputVolume (dev dvxAudioOutputPort, integer volume)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_VOLUME,itoa(volume)")
}

/*
 * Function:    dvxRequestAudioOutputHdmiAudio
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the HDMI output port used by the audio output
 *              port.
 */
define_function dvxRequestAudioOutputHdmiAudio (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_HDMI_AUDIO_REQUEST")
}

/*
 * Function:    dvxSetAudioOutputHdmiAudio
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              char hdmiAudioOutputOption[] - HDMI audio output option
 *                      Values:
 *                          DVX_HDMI_AUDIO_OUTPUT_OFF
 *                          DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1
 *                          DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2
 *                          DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3
 *                          DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4
 *                          DVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU
 *
 * Description: Sets the output used by the HDMI output port.
 */
define_function dvxSetAudioOutputHdmiAudio (dev dvxAudioOutputPort, char hdmiAudioOutputOption[])
{
	switch (hdmiAudioOutputOption)
	{
		case DVX_HDMI_AUDIO_OUTPUT_OFF:
		case DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1:
		case DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2:
		case DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3:
		case DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4:
		case DVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_HDMI_AUDIO,hdmiAudioOutputOption")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputHdmiEq
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests the status of the HDMI equalizer for the audio
 *              output port.
 */
define_function dvxRequestAudioOutputHdmiEq (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_HDMI_EQ_REQUEST")
}

/*
 * Function:    dvxEnableAudioOutputHdmiEq
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Enables the HDMI equalizer on the audio output port.
 */
define_function dvxEnableAudioOutputHdmiEq (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_HDMI_EQ,STATUS_ON")
}

/*
 * Function:    dvxDisableAudioOutputHdmiEq
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Disables the HDMI equalizer on the audio output port.
 */
define_function dvxDisableAudioOutputHdmiEq (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_HDMI_EQ,STATUS_OFF")
}

/*
 * Function:    dvxRequestAudioOutputSpdifAudio
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Requests to which audio output the SPDIF audio output port
 *              connects.
 */
define_function dvxRequestAudioOutputSpdifAudio (dev dvxAudioOutputPort)
{
	sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO_REQUEST")
}

/*
 * Function:    dvxRequestAudioOutputSpdifAudio
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              char spdifAudioOutputOption[] - SPDIF audio output option
 *                      Values:
 *                          DVX_SPDIF_AUDIO_OUTPUT_OFF
 *                          DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_1
 *                          DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_2
 *                          DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_3
 *                          DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_4
 *                          DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_1
 *                          DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_2
 *                          DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_3
 *                          DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_4
 *
 * Description: Sets which audio output the SPDIF audio output port
 *              connects to.
 */
define_function dvxSetAudioOutputSpdifAudio (dev dvxAudioOutputPort, char spdifAudioOutputOption[])
{
	switch (spdifAudioOutputOption)
	{
		case DVX_SPDIF_AUDIO_OUTPUT_OFF:
		case DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_1:
		case DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_2:
		case DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_3:
		case DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_4:
		case DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_1:
		case DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_2:
		case DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_3:
		case DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_4:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO,spdifAudioOutputOption")
		}
	}
}

/*
 * Function:    dvxRequestAudioOutputMixLevel
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              integer input - input port
 *                      Values:
 *                          DVX_MIX_INPUT_LINE
 *                          DVX_MIX_INPUT_MIC1
 *                          DVX_MIX_INPUT_MIC2
 *              integer input - input port
 *                      Values:
 *                          DVX_MIX_OUTPUT_1_AMP
 *                          DVX_MIX_OUTPUT_2_LINE
 *                          DVX_MIX_OUTPUT_3_LINE
 *                          DVX_MIX_OUTPUT_4_LINE
 *
 * Description: Requests the mix level contribution of the specified audio
 *              input to the audio output port's mixer.
 */
define_function dvxRequestAudioOutputMixLevel (dev dvxAudioOutputPort, integer input, integer output)
{
	switch (input)
	{
		case DVX_MIX_INPUT_LINE:
		case DVX_MIX_INPUT_MIC1:
		case DVX_MIX_INPUT_MIC2:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_MIX_LEVEL_REQUEST,itoa(input),',',itoa(output)")
		}
	}
}

/*
 * Function:    dvxSetAudioOutputMixLevel
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *              sinteger snMixLevel - mix level (-100 to 0)
 *              integer input - input port
 *                      Values:
 *                          DVX_MIX_INPUT_LINE
 *                          DVX_MIX_INPUT_MIC1
 *                          DVX_MIX_INPUT_MIC2
 *              integer input - input port
 *                      Values:
 *                          DVX_MIX_OUTPUT_1_AMP
 *                          DVX_MIX_OUTPUT_2_LINE
 *                          DVX_MIX_OUTPUT_3_LINE
 *                          DVX_MIX_OUTPUT_4_LINE
 *
 * Description: Sets the mix level contribution of the specified audio
 *              input to the audio output port's mixer.
 */
define_function dvxSetAudioOutputMixLevel (dev dvxAudioOutputPort, sinteger mixLevel, integer input, integer output)
{
	switch (input)
	{
		case DVX_MIX_INPUT_LINE:
		case DVX_MIX_INPUT_MIC1:
		case DVX_MIX_INPUT_MIC2:
		{
			sendCommand (dvxAudioOutputPort, "DVX_COMMAND_AUDIO_MIX_LEVEL,itoa(mixLevel),',',itoa(input),',',itoa(output)")
		}
	}
}


/*
 * --------------------
 * Microphone input functions
 * --------------------
 */


/*
 * Function:    dvxRequestAudioMicCompression
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the compression setting for the microphone port.
 */
define_function dvxRequestAudioMicCompression (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_REQUEST")
}

/*
 * Function:    dvxSetAudioMicCompression
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              char compressionSetting[] - compression setting
 *                      Values:
 *                          DVX_COMPRESSION_OFF
 *                          DVX_COMPRESSION_LOW
 *                          DVX_COMPRESSION_MEDIUM
 *                          DVX_COMPRESSION_HIGH
 *                          DVX_COMPRESSION_CUSTOM
 *
 * Description: Sets the compression setting for the microphone port.
 */
define_function dvxSetAudioMicCompression (dev dvxAudioMicPort, char compressionSetting[])
{
	switch (compressionSetting)
	{
		case DVX_COMPRESSION_OFF:
		case DVX_COMPRESSION_LOW:
		case DVX_COMPRESSION_MEDIUM:
		case DVX_COMPRESSION_HIGH:
		case DVX_COMPRESSION_CUSTOM:
		{
			sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION,compressionSetting")
		}
	}
}

/*
 * Function:    dvxRequestAudioMicCompressionAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the compression attack for the
 *              microphone port.
 */
define_function dvxRequestAudioMicCompressionAttack (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK_REQUEST")
}

/*
 * Function:    dvxSetAudioMicCompressionAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer attackDuration - attack duration (1 to 2000) in ms
 *
 * Description: Sets the duration of the attack phase while compressing
 *              the microphone port.
 */
define_function dvxSetAudioMicCompressionAttack (dev dvxAudioMicPort, integer attackDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK,itoa(attackDuration)")
}

/*
 * Function:    dvxRequestAudioMicCompressionRatio
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the compression ratio for the microphone port.
 */
define_function dvxRequestAudioMicCompressionRatio (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO_REQUEST")
}

/*
 * Function:    dvxSetAudioMicCompressionAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer ratio - compression ratio (1 to 20)
 *
 * Description: Sets the compression ratio for the microphone port.
 */
define_function dvxSetAudioMicRatio (dev dvxAudioMicPort, integer ratio)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO,itoa(ratio)")
}

/*
 * Function:    dvxRequestAudioMicCompressionRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the release phase while
 *              compressing for the microphone port.
 */
define_function dvxRequestAudioMicCompressionRelease (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE_REQUEST")
}

/*
 * Function:    dvxSetAudioMicRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer releaseDuration - release duration (1 to 5000) in ms
 *
 * Description: Sets the duration of the release phase while compressing
 *              the microphone port.
 */
define_function dvxSetAudioMicRelease (dev dvxAudioMicPort, integer releaseDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE,itoa(releaseDuration)")
}

/*
 * Function:    dvxRequestAudioMicCompressionThreshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the threshold while compressing for the
 *              microphone port.
 */
define_function dvxRequestAudioMicCompressionThreshold (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioMicThreshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              sinteger threshold - threshold (0 to -60)
 *
 * Description: Sets the threshold while compressing the microphone port.
 */
define_function dvxSetAudioMicThreshold (dev dvxAudioMicPort, sinteger threshold)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD,itoa(threshold)")
}

/*
 * Function:    dvxSetAudioMicDuckingAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer attackDuration - attack duration (1 to 2000) in ms
 *
 * Description: Sets the duration of the attack phase while ducking for
 *              the microphone port.
 */
define_function dvxSetAudioMicDuckingAttack (dev dvxAudioMicPort, integer attackDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK,itoa(attackDuration)")
}

/*
 * Function:    dvxSetAudioMicDuckingHold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer holdDuration - hold duration (0 to 2000) in ms
 *
 * Description: Sets the duration of the hold phase while compressing for
 *              the microphone port.
 */
define_function dvxSetAudioMicDuckingHold (dev dvxAudioMicPort, integer holdDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_DUCKING_HOLD,itoa(holdDuration)")
}

/*
 * Function:    dvxSetAudioMicDuckingLevel
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer duckingLevel - release duration (1 to 5000) in ms
 *
 * Description: Sets the level while ducking for the microphone portt.
 */
define_function dvxSetAudioMicDuckingLevel (dev dvxAudioMicPort, integer duckingLevel)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL,itoa(duckingLevel)")
}

/*
 * Function:    dvxSetAudioMicDuckingRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer releaseDuration - release duration (10 to 5000) in ms
 *
 * Description: Sets the duration of the release phase while ducking for
 *              the microphone port.
 */
define_function dvxSetAudioMicDuckingRelease (dev dvxAudioMicPort, integer releaseDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE,itoa(releaseDuration)")
}

/*
// INVALID - DOCUMENTATION WAS INCORRECT 
define_function dvxRequestAudioMicEq (dev dvxAudioMicPort, integer nBand)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_REQUEST,itoa(nBand)")
}

define_function dvxSetAudioMicEq (dev dvxAudioMicPort, integer nBand, sinteger snValue)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ,itoa(nBand),',',itoa(snValue)")
}
*/

/*
 * Function:    dvxRequestAudioMicEqCenterFrequency
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *
 * Description: Requests the frequency for the specified eqBand of the
 *              equalizer for the microphone port.
 */
define_function dvxRequestAudioMicEqCenterFrequency (dev dvxAudioMicPort, integer eqBand)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioMicEqCenterFrequency
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *              integer frequency - center frequency (20..20000) in Hz
 *
 * Description: Sets the center frequency on the specified equalizer eqBand
 *              for the microphone  port.
 */
define_function dvxSetAudioMicEqCenterFrequency (dev dvxAudioMicPort, integer eqBand, sinteger frequency)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY,itoa(eqBand),',',itoa(frequency)")
}

/*
 * Function:    dvxRequestAudioMicEqFilterType
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *
 * Description: Requests the filter type of the specified eqBand of the
 *              equalizer for the microphone port.
 */
define_function dvxRequestAudioMicEqFilterType (dev dvxAudioMicPort, integer eqBand)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioMicEqFilterType
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *              char filterType[] - filter type
 *                      Values:
 *                          DVX_EQ_FILTER_TYPE_BELL
 *                          DVX_EQ_FILTER_TYPE_BAND_PASS
 *                          DVX_EQ_FILTER_TYPE_BAND_STOP
 *                          DVX_EQ_FILTER_TYPE_HIGH_PASS
 *                          DVX_EQ_FILTER_TYPE_LOW_PASS
 *                          DVX_EQ_FILTER_TYPE_TREBLE_SHELF
 *                          DVX_EQ_FILTER_TYPE_BASS_SHELF
 *
 * Description: Sets the filter type of the specified eqBand of the
 *              equalizer for the microphone port.
 */
define_function dvxSetAudioMicEqFilterType (dev dvxAudioMicPort, integer eqBand, char filterType[])
{
	switch (filterType)
	{
		case DVX_EQ_FILTER_TYPE_BELL:
		case DVX_EQ_FILTER_TYPE_BAND_PASS:
		case DVX_EQ_FILTER_TYPE_BAND_STOP:
		case DVX_EQ_FILTER_TYPE_HIGH_PASS:
		case DVX_EQ_FILTER_TYPE_LOW_PASS:
		case DVX_EQ_FILTER_TYPE_TREBLE_SHELF:
		case DVX_EQ_FILTER_TYPE_BASS_SHELF:
		{
			sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE,itoa(eqBand),',',filterType")
		}
	}
}

/*
 * Function:    dvxRequestAudioMicEqGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *
 * Description: Requests the gain on the specified eqBand of the equalizer
 *              for the microphone port.
 */
define_function dvxRequestAudioMicEqGain (dev dvxAudioMicPort, integer eqBand)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_GAIN_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioMicEqGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..10)
 *              sinteger gain - gain (-12..12) in dB
 *
 * Description: Sets the gain on the specified equalizer eqBand for the
 *              microphone  port.
 */
define_function dvxSetAudioMicEqGain (dev dvxAudioMicPort, integer eqBand, sinteger gain)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_GAIN,itoa(eqBand),',',itoa(gain)")
}

/*
 * Function:    dvxRequestAudioMicEqQualityFactor
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *
 * Description: Requests the quality factor (Q) for the specified eqBand of
 *              the equalizer for the microphone port.
 */
define_function dvxRequestAudioMicEqQualityFactor (dev dvxAudioMicPort, integer eqBand)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR_REQUEST,itoa(eqBand)")
}

/*
 * Function:    dvxSetAudioMicEqQualityFactor
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer eqBand - eq eqBand (1..3)
 *              float qualityFactor - quality factor (0.1 to 20)
 * 
 * Description: Sets the quality factor (Q) for the specified eqBand of the
 *              equalizer for the microphone port.
 */
define_function dvxSetAudioMicEqQualityFactor (dev dvxAudioMicPort, integer eqBand, float qualityFactor)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR,itoa(eqBand),',',format('%01.1f',qualityFactor)")
}

/*
 * Function:    dvxRequestAudioMicGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the gain setting for the microphone port.
 */
define_function dvxRequestAudioMicGain (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GAIN_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              sinteger gain - gain(-24..24) in dB
 *
 * Description: Sets the gain for the microphone port.
 */
define_function dvxSetAudioMicGain (dev dvxAudioMicPort, sinteger gain)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GAIN,itoa(gain)")
}

/*
 * Function:    dvxRequestAudioMicGating
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the gating setting for the microphone port.
 */
define_function dvxRequestAudioMicGating (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGating
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              char gatingSetting[] - gating setting
 *                      Values:
 *                          DVX_GATING_OFF
 *                          DVX_GATING_LOW
 *                          DVX_GATING_MEDIUM
 *                          DVX_GATING_HIGH
 *                          DVX_GATING_CUSTOM
 *
 * Description: Sets the gating setting for the microphone port.
 */
define_function dvxSetAudioMicGating (dev dvxAudioMicPort, char gatingSetting[])
{
	switch (gatingSetting)
	{
		case DVX_GATING_OFF:
		case DVX_GATING_LOW:
		case DVX_GATING_MEDIUM:
		case DVX_GATING_HIGH:
		case DVX_GATING_CUSTOM:
		{
			sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING,gatingSetting")
		}
	}
}

/*
 * Function:    dvxRequestAudioMicGatingAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the attack phase while gating
 *              for the microphone port.
 */
define_function dvxRequestAudioMicGatingAttack (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_ATTACK_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGatingAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer attackDuration - attack duration (1..2000) in ms
 *
 * Description: Sets the duration of the attack phase while gatin for the
 *              microphone port.
 */
define_function dvxSetAudioMicGatingAttack (dev dvxAudioMicPort, integer attackDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_ATTACK,itoa(attackDuration)")
}

/*
 * Function:    dvxRequestAudioMicGatingDepth
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the depth while gating for the microphone port.
 */
define_function dvxRequestAudioMicGatingDepth (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_DEPTH_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGatingDepth
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer depth - gating depth (0..20)
 *
 * Description: Requests the depth while gating for the microphone port.
 */
define_function dvxSetAudioMicGatingDepth (dev dvxAudioMicPort, integer depth)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_DEPTH,itoa(depth)")
}

/*
 * Function:    dvxRequestAudioMicGatingHold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the hold phase while gating for
 *              the microphone port.
 */
define_function dvxRequestAudioMicGatingHold (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_HOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGatingHold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer holdDuration - hold duration (0..2000) in ms
 *
 * Description: Sets the duration of the hold phase while gatin for the
 *              microphone port.
 */
define_function dvxSetAudioMicGatingHold (dev dvxAudioMicPort, integer holdDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_HOLD,itoa(holdDuration)")
}

/*
 * Function:    dvxRequestAudioMicGatingRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the release phase while gating
 *              for the microphone port.
 */
define_function dvxRequestAudioMicGatingRelease (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_RELEASE_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGatingRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer releaseDuration - release duration (10..5000) in ms
 *
 * Description: Sets the duration of the release phase while gatin for the
 *              microphone port.
 */
define_function dvxSetAudioMicGatingRelease (dev dvxAudioMicPort, integer releaseDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_RELEASE,itoa(releaseDuration)")
}

/*
 * Function:    dvxRequestAudioMicGatingTheshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the gating threshold for the microphone port.
 */
define_function dvxRequestAudioMicGatingTheshold (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioMicGatingThreshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              sinteger threshold - threshold (0..-60)
 *
 * Description: Sets the gating threshold for the microphone port.
 */
define_function dvxSetAudioMicGatingThreshold (dev dvxAudioMicPort, sinteger threshold)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD,itoa(threshold)")
}

/*
 * Function:    dvxRequestAudioMicLimiter
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the limiter for the microphone port.
 */
define_function dvxRequestAudioMicLimiter (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_REQUEST")
}

/*
 * Function:    dvxSetAudioMicLimiter
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              char limiterSetting[] - limiter setting
 *                      Values:
 *                          DVX_LIMITER_OFF
 *                          DVX_LIMITER_LOW
 *                          DVX_LIMITER_MEDIUM
 *                          DVX_LIMITER_HIGH
 *                          DVX_LIMITER_CUSTOM
 *
 * Description: Sets the limiter for the microphone port.
 */
define_function dvxSetAudioMicLimiter (dev dvxAudioMicPort, char limiterSetting[])
{
	switch (limiterSetting)
	{
		case DVX_LIMITER_OFF:
		case DVX_LIMITER_LOW:
		case DVX_LIMITER_MEDIUM:
		case DVX_LIMITER_HIGH:
		case DVX_LIMITER_CUSTOM:
		{
			sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER,limiterSetting")
		}
	}
}

/*
 * Function:    dvxRequestAudioMicLimiterAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the attack phase while limiting
 *              for the microphone port.
 */
define_function dvxRequestAudioMicLimiterAttack (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK_REQUEST")
}

/*
 * Function:    dvxRequestAudioMicLimiterAttack
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer attackDuration - attack duration (1..2000) in ms
 *
 * Description: Sets the duration of the attack phase while limiting for
 *              the microphone port.
 */
define_function dvxSetAudioMicLimiterAttack (dev dvxAudioMicPort, integer attackDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK,itoa(attackDuration)")
}

/*
 * Function:    dvxRequestAudioMicLimiterRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the duration of the release phase while limiting
 *              for the microphone port.
 */
define_function dvxRequestAudioMicLimiterRelease (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE_REQUEST")
}

/*
 * Function:    dvxSetAudioMicLimiterRelease
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer releaseDuration - release duration (10..5000) in ms
 *
 * Description: Sets the duration of the release phase while limiting for
 *              the microphone port.
 */
define_function dvxSetAudioMicLimiterRelease (dev dvxAudioMicPort, integer releaseDuration)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE,itoa(releaseDuration)")
}

/*
 * Function:    dvxRequestAudioMicLimiterThreshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the threshold while limiting for the microphone
 *              port.
 */
define_function dvxRequestAudioMicLimiterThreshold (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD_REQUEST")
}

/*
 * Function:    dvxSetAudioMicLimiterThreshold
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              sinteger threshold - threshold (0..-60)
 *
 * Description: Sets the threshold while limiting for the microphone port.
 */
define_function dvxSetAudioMicLimiterThreshold (dev dvxAudioMicPort, sinteger threshold)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD,itoa(threshold)")
}

/*
 * Function:    dvxRequestAudioMicOn
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the status of the microphone port.
 */
define_function dvxRequestAudioMicOn (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_ON_REQUEST")
}

/*
 * Function:    dvxEnableAudioMicOn
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Turns on the microphone port.
 */
define_function dvxEnableAudioMicOn (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_ON,STATUS_ON")
}

/*
 * Function:    dvxDisableAudioMicOn
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Turns off the microphone port.
 */
define_function dvxDisableAudioMicOn (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_ON,STATUS_OFF")
}

/*
 * Function:    dvxRequestAudioMicPhantomPower
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the phantom power setting forvthe microphone port.
 */
define_function dvxRequestAudioMicPhantomPower (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER_REQUEST")
}

/*
 * Function:    dvxEnableAudioMicPhantomPower
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Turns on phantom power for the microphone port.
 */
define_function dvxEnableAudioMicPhantomPower (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER,STATUS_ON")
}

/*
 * Function:    dvxDisableAudioMicPhantomPower
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Turns off phantom power for the microphone port.
 */
define_function dvxDisableAudioMicPhantomPower (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER,STATUS_OFF")
}

/*
 * Function:    dvxRequestAudioMicPreampGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the pre-amplifier gain setting of the microphone
 *              port.
 */
define_function dvxRequestAudioMicPreampGain (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_PREAMP_GAIN_REQUEST")
}

/*
 * Function:    dvxSetAudioMicPreampGain
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              integer gain - gain (0..100) in percent %
 *
 * Description: Sets the pre-amplifier gain on the microphone port.
 */
define_function dvxSetAudioMicPreampGain (dev dvxAudioMicPort, integer gain)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_PREAMP_GAIN,itoa(gain)")
}

/*
 * Function:    dvxRequestAudioMicStereo
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *
 * Description: Requests the microphone port that is/are in use.
 */
define_function dvxRequestAudioMicStereo (dev dvxAudioMicPort)
{
	sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_STEREO_REQUEST")
}

/*
 * Function:    dvxSetAudioMicStereo
 *
 * Arguments:   dev dvxAudioMicPort - audio microphone port on the DVX
 *              char micType[] - type of microphone
 *                      Values:
 *                          DVX_MIC_TYPE_DUAL_MONO
 *                          DVX_MIC_TYPE_SINGLE_STEREO
 *
 * Description: Sets the microphone to be used by the microphone port.
 */
define_function dvxSetAudioMicStereo (dev dvxAudioMicPort, char micType[])
{
	switch (micType)
	{
		case DVX_MIC_TYPE_DUAL_MONO:
		case DVX_MIC_TYPE_SINGLE_STEREO:
		{
			sendCommand (dvxAudioMicPort, "DVX_COMMAND_AUDIO_MIC_STEREO,micType")
		}
	}
}


/*
 * --------------------
 * System functions
 * --------------------
 */


/*
 * Function:    dvxEnableStanbyMode
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX
 *
 * Description: Enter standby mode on the DVX.
 */
define_function dvxEnableStanbyMode (dev dvxPort1)
{
    channelOn (dvxPort1, DVX_CHANNEL_STANDBY_MODE)
}

/*
 * Function:    dvxDisableStanbyMode
 *
 * Arguments:   dev dvxPort1 - port 1 on the DVX
 *
 * Description: Exit standby mode on the DVX.
 */
define_function dvxDisableStanbyMode (dev dvxPort1)
{
    channelOff (dvxPort1, DVX_CHANNEL_STANDBY_MODE)
}


/*
 * --------------------
 * More switching functions
 * --------------------
 */


/*
 * Function:    dvxCycleOutputSource
 *
 * Arguments:   dev dvxOutputPort - audio or video output port on the DVX
 *
 * Description: Cycle sources on the output.
 */
define_function dvxCycleOutputSource (dev dvxOutputPort)
{
    // Cycles both the audio and video output source.
    // NOTE: if the video and audio sources on the same output number are different prior to the cycle
    // then the audio source input number will be sent to the same input number as the video input source
    // after the cycle.
    channelPulse (dvxOutputPort, DVX_CHANNEL_OUTPUT_SOURCE_CYCLE)
}


/*
 * --------------------
 * More audio input functions
 * --------------------
 */


/*
 * Function:    dvxEnableAudioInputGainRampUp
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Start ramping up gain on the audio input port.
 */
define_function dvxEnableAudioInputGainRampUp (dev dvxAudioInputPort)
{
    channelOn (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_UP)
}

/*
 * Function:    dvxDisableAudioInputGainRampUp
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Stop ramping up gain on the audio input port.
 */
define_function dvxDisableAudioInputGainRampUp (dev dvxAudioInputPort)
{
    channelOff (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_UP)
}

/*
 * Function:    dvxEnableAudioInputGainRampDown
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Start ramping down gain on the audio input port.
 */
define_function dvxEnableAudioInputGainRampDown (dev dvxAudioInputPort)
{
    channelOn (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_DOWN)
}

/*
 * Function:    dvxDisableAudioInputGainRampDown
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Stop ramping down gain on the audio input port.
 */
define_function dvxDisableAudioInputGainRampDown (dev dvxAudioInputPort)
{
    channelOff (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_DOWN)
}

/*
 * Function:    dvxEnableAudioInputGainMute
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Enable gain mute on the audio input port.
 */
define_function dvxEnableAudioInputGainMute (dev dvxAudioInputPort)
{
    channelOn (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE)
}

/*
 * Function:    dvxDisableAudioInputGainMute
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Disable gain mute on the audio input port.
 */
define_function dvxDisableAudioInputGainMute (dev dvxAudioInputPort)
{
    channelOff (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE)
}

/*
 * Function:    dvxCycleAudioInputGain
 *
 * Arguments:   dev dvxAudioInputPort - audio input port on the DVX
 *
 * Description: Cycle gain mute on the audio input port.
 */
define_function dvxCycleAudioInputGain (dev dvxAudioInputPort)
{
    channelPulse (dvxAudioInputPort, DVX_CHANNEL_AUDIO_INPUT_GAIN_CYCLE)
}


/*
 * --------------------
 * More audio output functions
 * --------------------
 */


/*
 * Function:    dvxCycleAudioOutputVolumeMute
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Cycle volume mute on the audio output port.
 */
define_function dvxCycleAudioOutputVolumeMute (dev dvxAudioOutputPort)
{
    channelPulse (dvxAudioOutputPort, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE_CYCLE)
}

/*
 * Function:    dvxEnableAudioOutputVolumeRampUp
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Enable volume ramping up on the audio output port.
 */
define_function dvxEnableAudioOutputVolumeRampUp (dev dvxAudioOutputPort)
{
    channelOn (dvxAudioOutputPort, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_UP)
}

/*
 * Function:    dvxDisableAudioOutputVolumeRampUp
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Disable volume ramping up on the audio output port.
 */
define_function dvxDisableAudioOutputVolumeRampUp (dev dvxAudioOutputPort)
{
    channelOff (dvxAudioOutputPort, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_UP)
}

/*
 * Function:    dvxEnableAudioOutputVolumeRampDown
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Enable volume ramping down on the audio output port.
 */
define_function dvxEnableAudioOutputVolumeRampDown (dev dvxAudioOutputPort)
{
    channelOn (dvxAudioOutputPort, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_DOWN)
}

/*
 * Function:    dvxDisableAudioOutputVolumeRampDown
 *
 * Arguments:   dev dvxAudioOutputPort - audio output port on the DVX
 *
 * Description: Disable volume ramping down on the audio output port.
 */
define_function dvxDisableAudioOutputVolumeRampDown (dev dvxAudioOutputPort)
{
    channelOn (dvxAudioOutputPort, DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_DOWN)
}

/*
 * --------------------
 * More microphone input functions
 * --------------------
 */


/*
 * --------------------
 * More video input functions
 * --------------------
 */

/*
 * Function:    dvxEnableVideoInputPhaseRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of phase on the video input port.
 */
define_function dvxEnableVideoInputPhaseRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputPhaseRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of phase on the video input port.
 */
define_function dvxDisableVideoInputPhaseRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputPhaseRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of phase on the video input port.
 */
define_function dvxEnableVideoInputPhaseRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputPhaseRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of phase on the video input port.
 */
define_function dvxDisableVideoInputPhaseRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_DOWN)
}

/*
 * Function:    dvxEnableVideoInputVerticalShiftRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of vertical shift on the video input
 *              port.
 */
define_function dvxEnableVideoInputVerticalShiftRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputVerticalShiftRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of vertical shift on the video input
 *              port.
 */
define_function dvxDisableVideoInputVerticalShiftRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputVerticalShiftRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of vertical shift on the video input
 *              port.
 */
define_function dvxEnableVideoInputVerticalShiftRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputVerticalShiftRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of vertical shift on the video input
 *              port.
 */
define_function dvxDisableVideoInputVerticalShiftRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_DOWN)
}

/*
 * Function:    dvxEnableVideoInputBrightnessRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of brightness on the video input port.
 */
define_function dvxEnableVideoInputBrightnessRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputBrightnessRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of brightness on the video input port.
 */
define_function dvxDisableVideoInputBrightnessRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputBrightnessRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of brightness on the video input port.
 */
define_function dvxEnableVideoInputBrightnessRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputBrightnessRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of brightness on the video input port.
 */
define_function dvxDisableVideoInputBrightnessRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_DOWN)
}

/*
 * Function:    dvxEnableVideoInputSaturationRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of saturation on the video input port.
 */
define_function dvxEnableVideoInputSaturationRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputSaturationRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of saturation on the video input port.
 */
define_function dvxDisableVideoInputSaturationRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputSaturationRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of saturation on the video input port.
 */
define_function dvxEnableVideoInputSaturationRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputSaturationRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of saturation on the video input port.
 */
define_function dvxDisableVideoInputSaturationRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_DOWN)
}

/*
 * Function:    dvxEnableVideoInputContrastRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of contrast on the video input port.
 */
define_function dvxEnableVideoInputContrastRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputContrastRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of contrast on the video input port.
 */
define_function dvxDisableVideoInputContrastRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputContrastRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of contrast on the video input port.
 */
define_function dvxEnableVideoInputContrastRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputContrastRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of contrast on the video input port.
 */
define_function dvxDisableVideoInputContrastRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_DOWN)
}

/*
 * Function:    dvxEnableVideoInputHueRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping up of hue on the video input port.
 */
define_function dvxEnableVideoInputHueRampUp (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoInputHueRampUp
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping up of hue on the video input port.
 */
define_function dvxDisableVideoInputHueRampUp (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoInputHueRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Enable ramping down of hue on the video input port.
 */
define_function dvxEnableVideoInputHueRampDown (dev dvxVideoInputPort)
{
    channelOn (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoInputHueRampDown
 *
 * Arguments:   dev dvxVideoInputPort - video input port on the DVX
 *
 * Description: Disable ramping down of hue on the video input port.
 */
define_function dvxDisableVideoInputHueRampDown (dev dvxVideoInputPort)
{
    channelOff (dvxVideoInputPort, DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_DOWN)
}


/*
 * --------------------
 * More video output functions
 * --------------------
 */


/*
 * Function:    dvxEnableVideoOutputZoomRampUp
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Enable ramping up of zoom on the video output port.
 */
define_function dvxEnableVideoOutputZoomRampUp (dev dvxVideoOutputPort)
{
    channelOn (dvxVideoOutputPort, DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_UP)
}

/*
 * Function:    dvxDisableVideoOutputZoomRampUp
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Disable ramping up of zoom on the video output port.
 */
define_function dvxDisableVideoOutputZoomRampUp (dev dvxVideoOutputPort)
{
    channelOff (dvxVideoOutputPort, DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_UP)
}

/*
 * Function:    dvxEnableVideoOutputZoomRampDown
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Enable ramping down of zoom on the video output port.
 */
define_function dvxEnableVideoOutputZoomRampDown (dev dvxVideoOutputPort)
{
    channelOn (dvxVideoOutputPort, DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_DOWN)
}

/*
 * Function:    dvxDisableVideoOutputZoomRampDown
 *
 * Arguments:   dev dvxVideoOutputPort - video output port on the DVX
 *
 * Description: Disable ramping down of zoom on the video output port.
 */
define_function dvxDisableVideoOutputZoomRampDown (dev dvxVideoOutputPort)
{
    channelOff (dvxVideoOutputPort, DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_DOWN)
}

#end_if