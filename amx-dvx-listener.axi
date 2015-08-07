program_name='amx-dvx-listener'

#if_not_defined __AMX_DVX_LISTENER__
#define __AMX_DVX_LISTENER__

/*
 * --------------------
 * amx-dvx-listener
 *
 * For usage, check out the readme for the amx-dvx-library.
 * --------------------
 */

define_constant

char VERSION_AMX_DVX_LISTENER[] = 'v1.0.0'

integer MAX_DVX_LISTENERS = 15

include 'amx-dvx-api'
#include 'common'



/*
 * --------------------
 * Device arrays
 *
 * Any components that are to be monitored should have the appropriate
 * device array copied into the main program DEFINE_VARIABLE section and the 
 * associated #DEFINE compiler directives should be copied to the top of the 
 * main program, above the line of code that this include file is included 
 * into the main program.
 * --------------------
 */


define_variable
/*
#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_MAIN
dev dvDvxMainPorts[] = { 5002:1:0 }

#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_OUTPUTS
dev dvDvxVidOutPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0 }

#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_INPUTS
dev dvDvxVidInPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0, 5002:5:0, 5002:6:0, 5002:7:0, 5002:8:0, 5002:9:0, 5002:10:0 }

#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_OUTPUTS
dev dvDvxAudOutPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0 }

#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_INPUTS
dev dvDvxAudInPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0, 5002:5:0, 5002:6:0, 5002:7:0, 5002:8:0, 5002:9:0, 5002:10:0, 5002:11:0, 5002:12:0, 5002:13:0, 5002:14:0 }

#DEFINE INCLUDE_DVX_MONITOR_SWITCHER_MIC_INPUTS
dev dvDvxMicInPorts[] = { 5002:1:0, 5002:2:0 }
*/










/*
 * --------------------
 * Callback functions
 * --------------------
 */


/*
 * --------------------
 * Switch callback functions
 * --------------------
 */

/*
#define INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
define_function dvxNotifySwitch (dev dvxPort1, char signalType[], integer input, integer output)
{
	// dvxPort1 is port 1 on the DVX.
	// signalType contains the type of signal that was switched ('AUDIO' or 'VIDEO')
	// input contains the source input number that was switched to the destination
	// output contains the destination output number that the source was switched to
}
*/


/*
 * --------------------
 * Front panel callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKOUT_CALLBACK
define_function dvxNotifyFrontPanelLockoutStatus (dev dvxPort1, char lockoutStatus[])
{
	// dvxPort1 is port 1 on the DVX.
	// lockoutStatus contains the lockout status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKTYPE_CALLBACK
define_function dvxNotifyFrontPanelLockoutType (dev dvxPort1, integer lockoutType)
{
	// dvxPort1 is port 1 on the DVX.
	// lockoutType contains the lockout type (DVX_LOCKTYPE_ALL_MENUS | DVX_LOCKTYPE_RESERVED | DVX_LOCKTYPE_CONFIGURE_MENUS_ONLY)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LCD_CALLBACK
define_function dvxNotifyFrontPanelIntensityLcd (dev dvxPort1, integer intensityValue)
{
	// dvxPort1 is port 1 on the DVX.
	// intensityValue contains the intensity value (range 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LEDS_CALLBACK
define_function dvxNotifyFrontPanelIntensityLeds (dev dvxPort1, integer intensityValue)
{
	// dvxPort1 is port 1 on the DVX.
	// intensityValue contains the intensity value (range 0 to 100)
}
*/


/*
 * --------------------
 * System callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_FAN_SPEED_CALLBACK
define_function dvxNotifyFaspeed (dev dvxPort1, integer nFanId, integer speed)
{
	// dvxPort1 is port 1 on the DVX.
	// nFanId contains the Fan ID (1 | 2).
	// speed contains the fan speed.
}
*/

/*
#define INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
define_function dvxNotifyInternalTemperature (dev dvxPort1, integer tempCelcius)
{
	// dvxPort1 is port 1 on the DVX.
	// tempCelcius contains the internal temperature of the DVX in degrees celcius
}
*/

/*
#define INCLUDE_DVX_NOTIFY_DXLINK_OUTPUT_ETHERNET_CALLBACK
define_function dvxNotifyDxlinkOutputEthernet (dev dvxDxlinkOutput, char ethernetStatus[])
{
	// dvxDxlinkOutput is the D:P:S of the DXLink output port on the DVX switcher. The output number can be taken from dvxDxlinkOutput.PORT
	// ethernetStatus is the status of the Ethernet on the DXLink port (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_DXLINK_INPUT_ETHERNET_CALLBACK
define_function dvxNotifyDxlinkInputEthernet (dev dvxDxlinkInput, char ethernetStatus[])
{
	// dvxDxlinkInput is the D:P:S of the DXLink input port on the DVX switcher. The input number can be taken from dvxDxlinkInput.PORT
	// ethernetStatus is the status of the Ethernet on the DXLink port (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
define_function dvxNotifyStandbyMode (dev dvxPort1, integer status)
{
	// dvxPort1 is port 1 on the DVX.
	// status is the status of the DVX being in standby mode (TRUE | FALSE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FAN_ALARM
define_function dvxNotifyFanAlarm (dev dvxPort1, integer status)
{
	// dvxPort1 is port 1 on the DVX.
	// status is the status of the DVX fan alarm (TRUE | FALSE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
define_function dvxNotifyTemperatureAlarm (dev dvxPort1, integer status)
{
	// dvxPort1 is port 1 on the DVX.
	// status is the status of the DVX temperature alarm (TRUE | FALSE)
}
*/


/*
 * --------------------
 * Video output callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
define_function dvxNotifyVideoOutputAspectRatio (dev dvxVideoOutput, char aspectRatio[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxOutput.PORT
	// aspectRatio is the aspect ratio (DVX_ASPECT_RATIO_MAINTAIN | DVX_ASPECT_RATIO_STRETCH | DVX_ASPECT_RATIO_ZOOM | DVX_ASPECT_RATIO_ANAMORPHIC)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BLANK_IMAGE_CALLBACK
define_function dvxNotifyVideoOutputBlankImage (dev dvxVideoOutput, char blankImage[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxOutput.PORT
	// blankImage is the image chosen to be displayed on the output when an input source with no signal is switched to the output (DVX_BLANK_IMAGE_BLACK | DVX_BLANK_IMAGE_BLUE | DVX_BLANK_IMAGE_LOGO_1 | DVX_BLANK_IMAGE_LOGO_2 | DVX_BLANK_IMAGE_LOGO_3)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
define_function dvxNotifyVideoOutputBrightness (dev dvxVideoOutput, integer brightness)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// brightness is the brightness level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONTRAST_CALLBACK
define_function dvxNotifyVideoOutputContrast (dev dvxVideoOutput, integer contrast)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// contrast is the constrast level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
define_function dvxNotifyVideoOutputFreeze (dev dvxVideoOutput, char freezeStatus[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// freezeStatus is the status of the video freeze (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
define_function dvxNotifyVideoOutputHorizontalShift (dev dvxVideoOutput, integer horizontalShift)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// horizontalShift is the horizontal shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
define_function dvxNotifyVideoOutputHorizontalSize (dev dvxVideoOutput, integer horizontalSize)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// horizontalSize is the horizontal size value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
define_function dvxNotifyVideoOutputMute (dev dvxVideoOutput, char muteStatus[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// muteStatus contains the video output mute status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
define_function dvxNotifyVideoOutputOn (dev dvxVideoOutput, char onOffStatus[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// onOffStatus is the video output on status (STATUS_ON | STATUS_OFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
define_function dvxNotifyVideoOutputOsd (dev dvxVideoOutput, char osdStatus[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// osdStatus is the OSD status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_COLOR_CALLBACK
define_function dvxNotifyVideoOutputOsdColor (dev dvxVideoOutput, char osdColor[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// osdColor is the OSD color (DVX_OSD_COLOR_BLACK | DVX_OSD_COLOR_BLUE | DVX_OSD_COLOR_WHITE | DVX_OSD_COLOR_YELLOW)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_POSISTION_CALLBACK
define_function dvxNotifyVideoOutputOsdPosition (dev dvxVideoOutput, char osdPosition[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// osdPosition is the OSD position (DVX_OSD_POSITION_TOP_LEFT | DVX_OSD_POSITION_TOP_RIGHT | DVX_OSD_POSITION_BOTTOM_LEFT | DVX_OSD_POSITION_BOTTOM_RIGHT)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_RESOLUTION_CALLBACK
define_function dvxNotifyVideoOutputResolution (dev dvxVideoOutput, char resolution[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// resolution is the video output resolution and refresh (HORxVER,REF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_SCALE_MODE_CALLBACK
define_function dvxNotifyVideoOutputScaleMode (dev dvxVideoOutput, char scaleMode[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// scaleMode contains the scaler mode (DVX_SCALE_MODE_AUTO | DVX_SCALE_MODE_BYPASS | DVX_SCALE_MODE_MANUAL)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_TEST_PATTERN_CALLBACK
define_function dvxNotifyVideoOutputTestPattern (dev dvxVideoOutput, char testPattern[])
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// testPattern is the test pattern (DVX_TEST_PATTERN_OFF | DVX_TEST_PATTERN_COLOR_BAR | DVX_TEST_PATTERN_GRAY_RAMP | DVX_TEST_PATTERN_SMPTE_BAR | DVX_TEST_PATTERN_HILO_TRACK | DVX_TEST_PATTERN_PLUGE | DVX_TEST_PATTERN_X_HATCH | DVX_TEST_PATTERN_LOGO_1 | DVX_TEST_PATTERN_LOGO_2 | DVX_TEST_PATTERN_LOGO_3)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
define_function dvxNotifyVideoOutputVerticalShift (dev dvxVideoOutput, integer verticalShift)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// verticalShift is the vertical shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
define_function dvxNotifyVideoOutputVerticalSize (dev dvxVideoOutput, integer verticalSize)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// verticalSize is the vertical size value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
define_function dvxNotifyVideoOutputZoom (dev dvxVideoOutput, integer zoom)
{
	// dvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvxVideoOutput.PORT
	// zoom is the zoom value
}
*/


/*
 * --------------------
 * Video input callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
define_function dvxNotifyVideoInputBrightness (dev dvxVideoInput, integer brightness)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// brightness is the brightness level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
define_function dvxNotifyVideoInputBlackAndWhiteState (dev dvxVideoInput, char status[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// status is the status of black and white mode on the video input (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_COLOUR_CALLBACK
define_function dvxNotifyVideoInputColor (dev dvxVideoInput, char status[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// status is the status of color mode on the video input (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
define_function dvxNotifyVideoInputContrast (dev dvxVideoInput, integer contrast)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// contrast is the contrast level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_SOURCE_CALLBACK
define_function dvxNotifyVideoInputEdidSource (dev dvxVideoInput, char edidSource[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// edidSource is the source of the EDID on the DVX input (DVX_EDID_SOURCE_ALL_RESOLUTIONS | DVX_EDID_SOURCE_WIDE_SCREEN | DVX_EDID_SOURCE_FULL_SCREEN | DVX_EDID_SOURCE_MIRROR_OUTPUT_1 | DVX_EDID_SOURCE_MIRROR_OUTPUT_2 | DVX_EDID_SOURCE_MIRROR_OUTPUT_3 | DVX_EDID_SOURCE_MIRROR_OUTPUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_UPDATE_AUTO_CALLBACK
define_function dvxNotifyVideoInputEdidUpdateAuto (dev dvxVideoInput, char autoStatus[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// autoStatus is the status of whether the EDID updates at regular intervals (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_PREFERRED_RESOLUTION_CALLBACK
define_function dvxNotifyVideoInputEdidPreferredResolution (dev dvxVideoInput, char resolution[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// resolution is the resolution listed in the EDID as the preferred (or native) resolution on the DVX video input
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_FORMAT_CALLBACK
define_function dvxNotifyVideoInputFormat (dev dvxVideoInput, char videoFormat[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// videoFormat is the video format (VIDEO_SIGNAL_FORMAT_HDMI | VIDEO_SIGNAL_FORMAT_DVI | VIDEO_SIGNAL_FORMAT_VGA | VIDEO_SIGNAL_FORMAT_COMPOSITE | VIDEO_SIGNAL_FORMAT_COMPONENT | VIDEO_SIGNAL_FORMAT_SVIDEO | VIDEO_SIGNAL_FORMAT_RGB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HDCP_COMPLIANCE
define_function dvxNotifyVideoInputHdcpCompliance (dev dvxVideoInput, char status[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// status is the status of the HDCP compliance on the video input port (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
define_function dvxNotifyVideoInputHorizontalShift (dev dvxVideoInput, sinteger horizontalShift)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// horizontalShift is the horizontal shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
define_function dvxNotifyVideoInputHue (dev dvxVideoInput, integer hue)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// hue is the hue value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
define_function dvxNotifyVideoInputName (dev dvxVideoInput, char name[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// name is the name of the video input
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_PHASE_CALLBACK
define_function dvxNotifyVideoInputPhase (dev dvxVideoInput, integer phase)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// phase is the phase value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_AUTO_CALLBACK
define_function dvxNotifyVideoInputResolutionAuto (dev dvxVideoInput, char status[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// status is the auto resolution detect status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_CALLBACK
define_function dvxNotifyVideoInputResolution (dev dvxVideoInput, char resolution[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// resolution is the input resolution.
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
define_function dvxNotifyVideoInputSaturation (dev dvxVideoInput, integer saturation)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// saturation is the saturation value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
define_function dvxNotifyVideoInputStatus (dev dvxVideoInput, char signalStatus[])
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// signalStatus is the input signal status (DVX_SIGNAL_STATUS_NO_SIGNAL | DVX_SIGNAL_STATUS_UNKNOWN | DVX_SIGNAL_STATUS_VALID_SIGNAL)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
define_function dvxNotifyVideoInputVerticalShift (dev dvxVideoInput, sinteger verticalShift)
{
	// dvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvxVideoInput.PORT
	// verticalShift is the vertical shift value
}
*/


/*
 * --------------------
 * Audio output callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
define_function dvxNotifyAudioOutBalance (dev dvxAudioOutput, sinteger balance)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// balance is the balance value (range: -20 to 20dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DELAY_CALLBACK
define_function dvxNotifyAudioOutDelay (dev dvxAudioOutput, integer delay)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// delay is the delay value (range: 0 to 200ms)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_THRESHOLD_CALLBACK
define_function dvxNotifyAudioOutDuckingThreshold (dev dvxAudioOutput, sinteger threshold)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// threshold is the ducking threshold value (range: -60 to 0)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_CALLBACK
define_function dvxNotifyAudioOutDucking (dev dvxAudioOutput, char ducking[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// ducking is the ducking (DVX_DUCKING_OFF | DVX_DUCKING_LOW | DVX_DUCKING_MEDIUM | DVX_DUCKING_HIGH | DVX_DUCKING_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_CENTER_FREQUENCY_CALLBACK
define_function dvxNotifyAudioOutEqCenterFrequency (dev dvxAudioOutput, integer band, integer frequency)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// band is the EQ band (range: 1 to 10)
	// frequency is the center frequency (range: 20 to 20000Hz)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_FILTER_TYPE_CALLBACK
define_function dvxNotifyAudioOutEqFilterType (dev dvxAudioOutput, integer band, char filterType[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// band is the EQ band (range: 1 to 10)
	// filterType is the filter type (DVX_EQ_FILTER_TYPE_BELL | DVX_EQ_FILTER_TYPE_BAND_PASS | DVX_EQ_FILTER_TYPE_BAND_STOP | DVX_EQ_FILTER_TYPE_HIGH_PASS | DVX_EQ_FILTER_TYPE_LOW_PASS | DVX_EQ_FILTER_TYPE_TREBLE_SHELF | DVX_EQ_FILTER_TYPE_BASS_SHELF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
define_function dvxNotifyAudioOutEqGain (dev dvxAudioOutput, integer band, sinteger gain)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// band is the EQ band (range: 1 to 10)
	// gain is the gain (range: -12 to 12dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_MODE_CALLBACK
define_function dvxNotifyAudioOutEqMode (dev dvxAudioOutput, char mode[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// mode is the EQ mode (DVX_EQ_MODE_OFF | DVX_EQ_MODE_VOICE | DVX_EQ_MODE_MUSIC | DVX_EQ_MODE_MOVIE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_QUALITY_FACTOR_CALLBACK
define_function dvxNotifyAudioOutEqQualityFactor (dev dvxAudioOutput, integer band, float qualityFactor)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// band is the EQ band (range: 1....10)
	// qualityFactor is the quality factor (range is dependent on eq filter type)
	//      Filter type     Range
	//      -----------     -----
	//      Bell            0.1 to 20.0
	//      Band Pass       0.1 to 20.0
	//      Band Stop       0.1 to 20.0
	//      High Pass       0.5 to 1.4
	//      Low Pass        0.5 to 1.4
	//      Treble Shelf    0.5 to 1.0
	//      Bass Shelf      0.5 to 1.0
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MAXIMUM_VOLUME_CALLBACK
define_function dvxNotifyAudioOutMaximumVolume (dev dvxAudioOutput, integer maxVol)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// maxVol is the maximum volume setting for the audio output port (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MINIMUM_VOLUME_CALLBACK
define_function dvxNotifyAudioOutMinimumVolume (dev dvxAudioOutput, integer minVol)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// minVol is the minimum volume setting for the audio output port (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
define_function dvxNotifyAudioOutMute (dev dvxAudioOutput, char muteStatus[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// muteStatus is the mute status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_STEREO_CALLBACK
define_function dvxNotifyAudioOutStereo (dev dvxAudioOutput, char stereoStatus[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// stereoStatus is the stereo audio status (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_TEST_TONE_CALLBACK
define_function dvxNotifyAudioOutTestTone (dev dvxAudioOutput, char testTone[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// testTone is the test tone frequency (DVX_TEST_TONE_FREQUENCY_OFF | DVX_TEST_TONE_FREQUENCY_60_HZ | DVX_TEST_TONE_FREQUENCY_250_HZ | DVX_TEST_TONE_FREQUENCY_400_HZ | DVX_TEST_TONE_FREQUENCY_1_KHZ | DVX_TEST_TONE_FREQUENCY_3_KHZ | DVX_TEST_TONE_FREQUENCY_5_KHZ | DVX_TEST_TONE_FREQUENCY_10_KHZ | DVX_TEST_TONE_FREQUENCY_PINK_NOISE | DVX_TEST_TONE_FREQUENCY_WHITE_NOISE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
define_function dvxNotifyAudioOutVolume (dev dvxAudioOutput, integer volume)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// volume is the volume value (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_AUDIO_OUTPUT_CALLBACK
define_function dvxNotifyAudioOutHdmiAudioOutput (dev dvxAudioOutput, char hdmiAudioOutput[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// hdmiAudioOutput contains the audio output setting for the HDMI output (DVX_HDMI_AUDIO_OUTPUT_OFF | DVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU | DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1 | DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2 | DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3 | DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_EQ_STATUS_CALLBACK
define_function dvxNotifyAudioOutHdmiEqStatus (dev dvxAudioOutput, char eqStatus[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// eqStatus contains the HDMI equalizer status (STATUS_ON | STATUS_OFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_SPDIF_AUDIO_OUTPUT_CALLBACK
define_function dvxNotifyAudioOutSpdifAudioOutput (dev dvxAudioOutput, char spdifAudioOutput[])
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// spdifAudioOutput contains the output to which the SP/DIF port connects (DVX_SDDIF_AUDIO_OUTPUT_OFF | DVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_1 | DVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_2 | DVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_3 | DVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_4 | DVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_1 | DVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_2 | DVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_3 | DVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
define_function dvxNotifyAudioOutMixLevel (dev dvxAudioOutput, sinteger mixLevel, integer input, integer output)
{
	// dvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvxAudioOutput.PORT
	// mixLevel is the mix level (range: -100 to 0)
	// input is input being mixed (DVX_MIX_INPUT_LINE | DVX_MIX_INPUT_MIC1 | DVX_MIX_INPUT_MIC2)
	// output is the audio output (1 is AMP, 2...4 are Line outputs)
}
*/


/*
 * --------------------
 * Audio input callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_CALLBACK
define_function dvxNotifyAudioInCompression (dev dvxAudioInput, char compressionSetting[])
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// compressionSetting is the compression setting for the audio input (DVX_COMPRESSION_OFF | DVX_COMPRESSION_LOW | DVX_COMPRESSION_MEDIUM | DVX_COMPRESSION_HIGH | DVX_COMPRESSION_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_ATTACK_CALLBACK
define_function dvxNotifyAudioInCompressionAttack (dev dvxAudioInput, integer attackDuration)
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// attackDuration is the duration of the compression attack phase (range: 1....2000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RATIO_CALLBACK
define_function dvxNotifyAudioInCompressionRatio (dev dvxAudioInput, integer ratio)
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// ratio is the compression ratio (rang:e 1....20)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RELEASE_CALLBACK
define_function dvxNotifyAudioInCompressionRelease (dev dvxAudioInput, integer release)
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// release is the compression release (range: 1...5000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_THRESHOLD_CALLBACK
define_function dvxNotifyAudioInCompressionThreshold (dev dvxAudioInput, sinteger threshold)
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// threshold is the compression threshold (range: 0....-60dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
define_function dvxNotifyAudioInGain (dev dvxAudioInput, sinteger gain)
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// gain is the gain value (range: -24....24 in dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
define_function dvxNotifyAudioInGainMute (dev dvxAudioInput, char status[])
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// status is the gain mute status value (STATUS_ENABLE | STATUS_DISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_STEREO_CALLBACK
define_function dvxNotifyAudioInStereo (dev dvxAudioInput, char stereoMode[])
{
	// dvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvxAudioInput.PORT
	// stereoMode is the stereo audio mode (DVX_AUDIO_STEREO | DVX_AUDIO_MONO)
}
*/


/*
 * --------------------
 * Microphone input callback functions
 * --------------------
 */


/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_CALLBACK
define_function dvxNotifyAudioMicCompression (dev dvxMicInput, char compressionSetting[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// compressionSetting is the compression setting (DVX_COMPRESSION_OFF | DVX_COMPRESSION_LOW | DVX_COMPRESSION_MEDIUM | DVX_COMPRESSION_HIGH | DVX_COMPRESSION_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_ATTACK_CALLBACK
define_function dvxNotifyAudioMicCompressionAttack (dev dvxMicInput, integer attack)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// attack is the duration of the attack phase while compressing the microphone (range: 1 to 2000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RATIO_CALLBACK
define_function dvxNotifyAudioMicCompressionRatio (dev dvxMicInput, integer ratio)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// ratio is the ratio for compressing the microphone (range: 1 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RELEASE_CALLBACK
define_function dvxNotifyAudioMicCompressionRelease (dev dvxMicInput, integer release)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// release is the duration of the compression release while compressing the microphone (range: 1 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_THRESHOLD_CALLBACK
define_function dvxNotifyAudioMicCompressionThreshold (dev dvxMicInput, sinteger threshold)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// threshold is the threshold while compressing the microphone (range: 0 to -60).
}
*/

/*// INVALID COMMAND - DOCUMENTATION WAS INCORRECT
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
define_function dvxNotifyAudioMicEq (dev dvxMicInput, integer band, sinteger value)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// band is the microphone eq band (range: 1 to 3).
	// value is the EQ  setting (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CENTER_FREQUENCY_CALLBACK
define_function dvxNotifyAudioMicEqCenterFrequency (dev dvxMicInput, integer band, sinteger centerFrequency)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// band is the microphone eq band (range: 1 to 3).
	// centerFrequency is the EQ center frequency (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_FILTER_TYPE_CALLBACK
define_function dvxNotifyAudioMicEqFilterType (dev dvxMicInput, integer band, char filterType[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// band is the microphone eq band (range: 1 to 3).
	// filterType is the EQ filter type (DVX_EQ_FILTER_TYPE_BELL | DVX_EQ_FILTER_TYPE_BAND_PASS | DVX_EQ_FILTER_TYPE_BAND_STOP | DVX_EQ_FILTER_TYPE_HIGH_PASS | DVX_EQ_FILTER_TYPE_LOW_PASS | DVX_EQ_FILTER_TYPE_TREBLE_SHELF | DVX_EQ_FILTER_TYPE_BASS_SHELF).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_GAIN_CALLBACK
define_function dvxNotifyAudioMicEqGain (dev dvxMicInput, integer band, sinteger gain)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// band is the microphone eq band (range: 1 to 3).
	// gain is the EQ gain value (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_QUALITY_FACTOR_CALLBACK
define_function dvxNotifyAudioMicEqQualityFactor (dev dvxMicInput, integer band, float factor)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// band is the microphone eq band (range: 1 to 3).
	// factor is the EQ quality factor value (range: 0.1 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
define_function dvxNotifyAudioMicGain (dev dvxMicInput, sinteger gain)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// gain is the mic gain value (range: -24 to 24).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_CALLBACK
define_function dvxNotifyAudioMicGating (dev dvxMicInput, char gatingSetting[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// gatingSetting is the mic gating setting (DVX_GATING_OFF | DVX_GATING_LOW | DVX_GATING_MEDIUM | DVX_GATING_HIGH | DVX_GATING_CUSTOM).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_ATTACK_CALLBACK
define_function dvxNotifyAudioMicGatingAttack (dev dvxMicInput, integer attack)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// attack is the mic gating attack value (range: 1 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_DEPTH_CALLBACK
define_function dvxNotifyAudioMicGatingDepth (dev dvxMicInput, integer depth)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// depth is the mic gating attack value (range: 0 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_HOLD_CALLBACK
define_function dvxNotifyAudioMicGatingHold (dev dvxMicInput, integer hold)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// hold is the mic gating hold value (range: 0 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_RELEASE_CALLBACK
define_function dvxNotifyAudioMicGatingRelease (dev dvxMicInput, integer release)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// release is the mic gating release value (range: 10 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_THRESHOLD_CALLBACK
define_function dvxNotifyAudioMicGatingThreshold (dev dvxMicInput, sinteger threshold)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// threshold is the mic gating theshhold value (range: 0 to -60).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_CALLBACK
define_function dvxNotifyAudioMicLimiter (dev dvxMicInput, char limiterSetting[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// limiterSetting is the mic limiter setting (DVX_LIMITER_OFF | DVX_LIMITER_LOW | DVX_LIMITER_MEDIUM | DVX_LIMITER_HIGH | DVX_LIMITER_CUSTOM).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_ATTACK_CALLBACK
define_function dvxNotifyAudioMicLimiterAttack (dev dvxMicInput, integer attack)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// attack is the mic limiter attack value (range: 1 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_RELEASE_CALLBACK
define_function dvxNotifyAudioMicLimiterRelease (dev dvxMicInput, integer release)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// release is the mic limiter release value (range: 10 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_THRESHOLD_CALLBACK
define_function dvxNotifyAudioMicLimiterThreshold (dev dvxMicInput, sinteger threshold)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// threshold is the mic limiter theshhold value (range: 0 to -60).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
define_function dvxNotifyAudioMicOn (dev dvxMicInput, char status[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// status is the status of the microphone (STATUS_ON | STATUS_OFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_PHANTOM_POWER_CALLBACK
define_function dvxNotifyAudioMicPhantomPower (dev dvxMicInput, char status[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// status is the phantom power setting of the microphone (STATUS_ON | STATUS_OFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
define_function dvxNotifyAudioMicPreampGain (dev dvxMicInput, integer percentage)
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// percentage is the pre-amplifier gain on the microphone (range: 0 to 100, units are in %).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_STEREO_CALLBACK
define_function dvxNotifyAudioMicStereo (dev dvxMicInput, char micType[])
{
	// dvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvxMicInput.PORT
	// micType is the type of microphone in use on the microphone port (DVX_MIC_TYPE_DUAL_MONO | DVX_MIC_TYPE_SINGLE_STEREO)
}
*/



/*
 * --------------------
 * Events to capture responses from the DVX or update notifications
 * --------------------
 */

define_event


/*
 * --------------------
 * Data events
 * --------------------
 */

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MAIN
data_event[dvDvxMainPorts]  // dvDvxMainPorts should be the device (D:P:S) for port 1 on the DVX or an array containing multiple devices for port 1 on multiple DVX's
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			// System commands
			
			#if_defined INCLUDE_DVX_NOTIFY_FAN_SPEED_CALLBACK
			case DVX_COMMAND_FAN_SPEED:
			{
				stack_var integer fanId
				stack_var integer fanspeed
				
				fanId = atoi(dvxParseCmdParam(data.text))
				fanspeed = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyFaspeed(data.device, fanId, fanspeed)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
			case DVX_COMMAND_TEMPERATURE:
			{
				dvxNotifyInternalTemperature(data.device, atoi(data.text))
			}
			#end_if
			
			
			
			
			
			// Front Panel commands
			
			#if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKOUT_CALLBACK
			case DVX_COMMAND_FRONT_PANEL_LOCKOUT:
			{
				dvxNotifyFrontPanelLockoutStatus(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKTYPE_CALLBACK
			case DVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE:
			{
				dvxNotifyFrontPanelLockoutType(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LCD_CALLBACK
			case DVX_COMMAND_FRONT_PANEL_INTENSITY_LCD:
			{
				dvxNotifyFrontPanelIntensityLcd(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LEDS_CALLBACK
			case DVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS:
			{
				dvxNotifyFrontPanelIntensityLeds(data.device, atoi(data.text))
			}
			#end_if
			
			
			
			// Switching commands
			
			#if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
			case DVX_COMMAND_SWITCH_RESPONSE:
			{
				stack_var char type[10]
				stack_var integer input
				stack_var integer output
				
				if (find_string(data.text,'LAUDIO',1) == 1)
				{
					type = SIGNAL_TYPE_AUDIO
					remove_string(data.text,'LAUDIOI',1)
				}
				else if (find_string(data.text,'LVIDEO',1) == 1)
				{
					type = SIGNAL_TYPE_VIDEO
					remove_string(data.text,'LVIDEOI',1)
				}
				input = atoi(data.text)
				remove_string(data.text,"'O'",1)
				output = atoi(data.text)
				dvxNotifySwitch(data.device, type, input, output)
			}
			#end_if
			
			
			default:
			{
				// Unhandled command - Do nothing!
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_OUTPUTS
data_event[dvDvxVidOutPorts]    // dvDvxVidOutPorts should be a DEV array containing devices for each video output port on the DVX
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_DVX_NOTIFY_DXLINK_OUTPUT_ETHERNET_CALLBACK
			case DVX_COMMAND_DXLINK_OUTPUT_ETHERNET:
			{
				dvxNotifyDxlinkOutputEthernet(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_ASPECT_RATIO:
			{
				dvxNotifyVideoOutputAspectRatio(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BLANK_IMAGE_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_BLANK_IMAGE:
			{
				dvxNotifyVideoOutputBlankImage(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_BRIGHTNESS:
			{
				dvxNotifyVideoOutputBrightness(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONSTRAST_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_CONTRAST:
			{
				dvxNotifyVideoOutputContrast(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_FREEZE:
			{
				dvxNotifyVideoOutputFreeze(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT:
			{
				dvxNotifyVideoOutputHorizontalShift(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE:
			{
				dvxNotifyVideoOutputHorizontalSize(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
			case DVX_COMMAND_VIDEO_MUTE:
			case DVX_COMMAND_VIDEO_OUT_MUTE:
			{
				dvxNotifyVideoOutputMute(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_ON:
			{
				dvxNotifyVideoOutputOn(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_OSD:
			{
				dvxNotifyVideoOutputOsd(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_COLOR_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_OSD_COLOR:
			{
				dvxNotifyVideoOutputOsdColor(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_POSISTION_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_OSD_POSITION:
			{
				dvxNotifyVideoOutputOsdPosition(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_RESOLUTION_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_RESOLUTION:
			{
				dvxNotifyVideoOutputResolution(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_SCALE_MODE_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_SCALE_MODE:
			{
				dvxNotifyVideoOutputScaleMode(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_TEST_PATTERN_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_TEST_PATTERN:
			{
				dvxNotifyVideoOutputTestPattern(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT:
			{
				dvxNotifyVideoOutputVerticalShift(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE:
			{
				dvxNotifyVideoOutputVerticalSize(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
			case DVX_COMMAND_VIDEO_OUT_ZOOM:
			{
				dvxNotifyVideoOutputZoom(data.device, atoi(data.text))
			}
			#end_if
			
			default:
			{
				// Unhandled command - Do nothing!
			}
			
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_INPUTS
data_event[dvDvxVidInPorts] // dvDvxVidInPorts should be a DEV array containing devices for each video input port on the DVX
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_DVX_NOTIFY_DXLINK_INPUT_ETHERNET_CALLBACK
			case DVX_COMMAND_DXLINK_INPUT_ETHERNET:
			{
				dvxNotifyDxlinkInputEthernet(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
			case DVX_COMMAND_VIDEO_IN_BRIGHTNESS:
			{
				dvxNotifyVideoInputBrightness(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
			case DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE:
			{
				dvxNotifyVideoInputBlackAndWhiteState(data.device,data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_COLOUR_CALLBACK
			case DVX_COMMAND_VIDEO_IN_COLOR:
			{
				dvxNotifyVideoInputColor(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
			case DVX_COMMAND_VIDEO_IN_CONTRAST:
			{
				dvxNotifyVideoInputContrast(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_SOURCE_CALLBACK
			case DVX_COMMAND_VIDEO_IN_EDID_SOURCE:
			{
				dvxNotifyVideoInputEdidSource(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_UPDATE_AUTO_CALLBACK
			case DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO:
			{
				dvxNotifyVideoInputEdidUpdateAuto(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_PREFERRED_RESOLUTION_CALLBACK
			case DVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION:
			{
				dvxNotifyVideoInputEdidPreferredResolution(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_FORMAT_CALLBACK
			case DVX_COMMAND_VIDEO_IN_FORMAT:
			{
				dvxNotifyVideoInputFormat(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HDCP_COMPLIANCE
			case DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE:
			{
				dvxNotifyVideoInputHdcpCompliance(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
			case DVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT:
			{
				dvxNotifyVideoInputHorizontalShift(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
			case DVX_COMMAND_VIDEO_IN_HUE:
			{
				dvxNotifyVideoInputHue(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
			case DVX_COMMAND_VIDEO_IN_NAME:
			{
				dvxNotifyVideoInputName(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_PHASE_CALLBACK
			case DVX_COMMAND_VIDEO_IN_PHASE:
			{
				dvxNotifyVideoInputHue(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_AUTO_CALLBACK
			case DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO:
			{
				dvxNotifyVideoInputResolutionAuto(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_CALLBACK
			case DVX_COMMAND_VIDEO_IN_RESOLUTION:
			{
				dvxNotifyVideoInputResolution(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
			case DVX_COMMAND_VIDEO_IN_SATURATION:
			{
				dvxNotifyVideoInputSaturation(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
			case DVX_COMMAND_VIDEO_IN_STATUS:
			{
				dvxNotifyVideoInputStatus(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
			case DVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT:
			{
				dvxNotifyVideoInputVerticalShift(data.device, atoi(data.text))
			}
			#end_if
			
			default:
			{
				// Unhandled command - Do nothing!
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_INPUTS
data_event[dvDvxAudInPorts] // dvDvxAudInPorts should be a DEV array containing devices for each audio input port on the DVX
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_CALLBACK
			case DVX_COMMAND_AUDIO_IN_COMPRESSION:
			{
				dvxNotifyAudioInCompression(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_ATTACK_CALLBACK
			case DVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK:
			{
				dvxNotifyAudioInCompressionAttack(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RATIO_CALLBACK
			case DVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO:
			{
				dvxNotifyAudioInCompressionRatio(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RELEASE_CALLBACK
			case DVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE:
			{
				dvxNotifyAudioInCompressionRelease(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_THRESHOLD_CALLBACK
			case DVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD:
			{
				dvxNotifyAudioInCompressionThreshold(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
			case DVX_COMMAND_AUDIO_IN_GAIN:
			{
				dvxNotifyAudioInGain(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_STEREO_CALLBACK
			case DVX_COMMAND_AUDIO_IN_STEREO:
			{
				dvxNotifyAudioInStereo(data.device, data.text)
			}
			#end_if
			
			default:
			{
				// Unhandled command - Do nothing!
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_OUTPUTS
data_event[dvDvxAudOutPorts]    // dvDvxAudOutPorts should be a DEV array containing devices for each audio output port on the DVX
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_BALANCE:
			{
				dvxNotifyAudioOutBalance(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DELAY_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_DELAY:
			{
				dvxNotifyAudioOutDelay(data.device, atoi(data.text))
			}
			#end_if
			
			/*
			case DVX_COMMAND_AUDIO_OUT_DUCK_ATTACK:
			{
			}
			*/
			
			/*
			case DVX_COMMAND_AUDIO_OUT_DUCK_HOLD:
			{
			}
			*/
			
			/*
			case DVX_COMMAND_AUDIO_OUT_DUCK_LEVEL:
			{
			}
			*/
			
			/*
			case DVX_COMMAND_AUDIO_OUT_DUCK_RELEASE:
			{
			}
			*/
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_THRESHOLD_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD:
			{
				dvxNotifyAudioOutDuckingThreshold(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_DUCKING:
			{
				dvxNotifyAudioOutDucking(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_CENTER_FREQUENCY_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY:
			{
				stack_var integer band
				stack_var integer centerFrequency
				
				band = atoi(dvxParseCmdParam(data.text))
				centerFrequency = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioOutEqCenterFrequency(data.device, band, centerFrequency)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_FILTER_TYPE_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE:
			{
				stack_var integer band
				
				band = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioOutEqFilterType(data.device, band, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_EQ_GAIN:
			{
				stack_var integer band
				stack_var sinteger gain
				
				band = atoi(dvxParseCmdParam(data.text))
				gain = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioOutEqGain(data.device, band, gain)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_MODE_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_EQ_MODE:
			{
				dvxNotifyAudioOutEqMode(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_QUALITY_FACTOR_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR:
			{
				stack_var integer band
				stack_var float qualityFactor
				
				band = atoi(dvxParseCmdParam(data.text))
				qualityFactor = atof(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioOutEqQualityFactor(data.device,band,qualityFactor)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MAXIMUM_VOLUME_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME:
			{
				dvxNotifyAudioOutMaximumVolume(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MINIMUM_VOLUME_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME:
			{
				dvxNotifyAudioOutMinimumVolume(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_MUTE:
			{
				dvxNotifyAudioOutMute(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_STEREO_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_STEREO:
			{
				dvxNotifyAudioOutStereo(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_TEST_TONE_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_TEST_TONE:
			{
				dvxNotifyAudioOutTestTone(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_VOLUME:
			{
				dvxNotifyAudioOutVolume(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_AUDIO_OUTPUT_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_HDMI_AUDIO:
			{
				dvxNotifyAudioOutHdmiAudioOutput(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_EQ_STATUS_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_HDMI_EQ:
			{
				dvxNotifyAudioOutHdmiEqStatus(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_SPDIF_AUDIO_OUTPUT_CALLBACK
			case DVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO:
			{
				dvxNotifyAudioOutSpdifAudioOutput(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
			case DVX_COMMAND_AUDIO_MIX_LEVEL:
			{
				stack_var sinteger value
				stack_var integer input
				stack_var integer output
				
				value = atoi(dvxParseCmdParam(data.text))
				input = atoi(dvxParseCmdParam(data.text))
				output = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioOutMixLevel(data.device, value, input, output)
			}
			#end_if
			
			default:
			{
				// Unhandled command - Do nothing!
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MIC_INPUTS
data_event[dvDvxMicInPorts] // dvDvxMicInPorts should be a DEV array containing devices for each mic input port on the DVX
{
	command:
	{
		stack_var char cmdHeader[30]
		
		// remove the header
		cmdHeader = dvxParseCmdHeader(data.text)
		// cmdHeader contains the header
		// data.text is left with the parameters
		
		switch (cmdHeader)
		{
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_COMPRESSION:
			{
				dvxNotifyAudioMicCompression(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_ATTACK_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK:
			{
				dvxNotifyAudioMicCompressionAttack(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RATIO_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO:
			{
				dvxNotifyAudioMicCompressionRatio(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RELEASE_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE:
			{
				dvxNotifyAudioMicCompressionRelease(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_THRESHOLD_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD:
			{
				dvxNotifyAudioMicCompressionThreshold(data.device, atoi(data.text))
			}
			#end_if
			
			/*
			case DVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK:
			{
			}
			*/
			/*
			case DVX_COMMAND_AUDIO_MIC_DUCKING_HOLD:
			{
			dvxNotifyAudioMic
			}
			*/
			/*
			case DVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL:
			{
			dvxNotifyAudioMic
			}
			*/
			/*
			case DVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE:
			{
			dvxNotifyAudioMic
			}
			*/
			
			/*	// INVALID COMMAND - DOCUMENTATION WAS INCORRECT
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_EQ:
			{
				stack_var integer band
				stack_var sinteger snValue
				
				band = atoi(dvxParseCmdParam(data.text))
				snValue = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioMicEq(data.device, band, snValue)
			}
			#end_if
			*/
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CENTER_FREQUENCY_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY:
			{
				stack_var integer band
				stack_var sinteger centerFrequency
				
				band = atoi(dvxParseCmdParam(data.text))
				centerFrequency = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioMicEqCenterFrequency(data.device, band, centerFrequency)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_FILTER_TYPE_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE:
			{
				stack_var integer band
				stack_var char filterType[20]
				
				band = atoi(dvxParseCmdParam(data.text))
				filterType = dvxParseCmdParam(data.text)
				
				dvxNotifyAudioMicEqFilterType(data.device, band, filterType)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_GAIN_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_EQ_GAIN:
			{
				stack_var integer band
				stack_var sinteger gain
				
				band = atoi(dvxParseCmdParam(data.text))
				gain = atoi(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioMicEqGain(data.device, band, gain)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_QUALITY_FACTOR_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR:
			{
				stack_var integer band
				stack_var float qualityFactor
				
				band = atoi(dvxParseCmdParam(data.text))
				qualityFactor = atof(dvxParseCmdParam(data.text))
				
				dvxNotifyAudioMicEqQualityFactor(data.device, band, qualityFactor)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GAIN:
			{
				dvxNotifyAudioMicGain(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING:
			{
				dvxNotifyAudioMicGating(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_ATTACK_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING_ATTACK:
			{
				dvxNotifyAudioMicGatingAttack(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_DEPTH_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING_DEPTH:
			{
				dvxNotifyAudioMicGatingDepth(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_HOLD_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING_HOLD:
			{
				dvxNotifyAudioMicGatingHold(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_RELEASE_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING_RELEASE:
			{
				dvxNotifyAudioMicGatingRelease(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_THRESHOLD_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD:
			{
				dvxNotifyAudioMicGatingThreshold(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_LIMITER:
			{
				dvxNotifyAudioMicLimiter(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_ATTACK_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK:
			{
				dvxNotifyAudioMicLimiterAttack(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_RELEASE_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE:
			{
				dvxNotifyAudioMicLimiterRelease(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_THRESHOLD_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD:
			{
				dvxNotifyAudioMicLimiterThreshold(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_ON:
			{
				dvxNotifyAudioMicOn(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PHANTOM_POWER_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER:
			{
				dvxNotifyAudioMicPhantomPower(data.device, data.text)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_PREAMP_GAIN:
			{
				dvxNotifyAudioMicPreampGain(data.device, atoi(data.text))
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_STEREO_CALLBACK
			case DVX_COMMAND_AUDIO_MIC_STEREO:
			{
				dvxNotifyAudioMicStereo(data.device, data.text)
			}
			#end_if
			
			default:
			{
				// Unhandled command - Do nothing!
			}
		}
	}
}
#end_if


/*
 * --------------------
 * Channel events
 * --------------------
 */


#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MAIN
channel_event[dvDvxMainPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
			case DVX_CHANNEL_STANDBY_MODE:
			{
				dvxNotifyStandbyMode(channel.device, TRUE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_FAN_ALARM
			case DVX_CHANNEL_FAN_ALARM:
			{
				dvxNotifyFanAlarm(channel.device, TRUE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
			case DVX_CHANNEL_TEMPERATURE_ALARM:
			{
				dvxNotifyTemperatureAlarm(channel.device, TRUE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
			case DVX_CHANNEL_STANDBY_MODE:
			{
				dvxNotifyStandbyMode(channel.device, FALSE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_FAN_ALARM
			case DVX_CHANNEL_FAN_ALARM:
			{
				dvxNotifyFanAlarm(channel.device, FALSE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
			case DVX_CHANNEL_TEMPERATURE_ALARM:
			{
				dvxNotifyTemperatureAlarm(channel.device, FALSE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_INPUTS
channel_event[dvDvxAudInPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
			case DVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE:
			{
				dvxNotifyAudioInGainMute(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
			case DVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE:
			{
				dvxNotifyAudioInGainMute(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_OUTPUTS
channel_event[dvDvxAudOutPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
			case DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE:
			{
				dvxNotifyAudioOutMute(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
			case DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE:
			{
				dvxNotifyAudioOutMute(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MIC_INPUTS
channel_event[dvDvxMicInPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
			case DVX_CHANNEL_AUDIO_MIC_ENABLE:
			{
				dvxNotifyAudioMicOn(channel.device, STATUS_ON)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
			case DVX_CHANNEL_AUDIO_MIC_ENABLE:
			{
				dvxNotifyAudioMicOn(channel.device, STATUS_OFF)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_INPUTS
channel_event[dvDvxVidInPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
			case DVX_CHANNEL_VIDEO_INPUT_BLACK_AND_WHITE_STATE:
			{
				dvxNotifyVideoInputBlackAndWhiteState(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
			case DVX_CHANNEL_VIDEO_INPUT_BLACK_AND_WHITE_STATE:
			{
				dvxNotifyVideoInputBlackAndWhiteState(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_OUTPUTS
channel_event[dvDvxVidOutPorts,0]
{
	on:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_ENABLE:
			{
				dvxNotifyVideoOutputOn(channel.device, STATUS_ON)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_MUTE_STATE:
			{
				dvxNotifyVideoOutputMute(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_FREEZE_STATE:
			{
				dvxNotifyVideoOutputFreeze(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_OSD_STATE:
			{
				dvxNotifyVideoOutputOsd(channel.device, STATUS_ENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
	off:
	{
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_ENABLE:
			{
				dvxNotifyVideoOutputOn(channel.device, STATUS_OFF)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_MUTE_STATE:
			{
				dvxNotifyVideoOutputMute(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_FREEZE_STATE:
			{
				dvxNotifyVideoOutputFreeze(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
			case DVX_CHANNEL_VIDEO_OUTPUT_OSD_STATE:
			{
				dvxNotifyVideoOutputOsd(channel.device, STATUS_DISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
	}
}
#end_if


/*
 * --------------------
 * Level events
 * --------------------
 */


#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MAIN
level_event[dvDvxMainPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
		case DVX_LEVEL_TEMPERATURE:
		{
			dvxNotifyInternalTemperature(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_INPUTS
level_event[dvDvxAudInPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
		case DVX_LEVEL_AUDIO_INPUT_GAIN:
		{
			dvxNotifyAudioInGain(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_AUDIO_OUTPUTS
level_event[dvDvxAudOutPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
		case DVX_LEVEL_AUDIO_OUTPUT_VOLUME:
		{
			dvxNotifyAudioOutVolume(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
		case DVX_LEVEL_AUDIO_OUTPUT_BALANCE:
		{
			dvxNotifyAudioOutBalance(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_1:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 1, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_2:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 2, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_3:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 3, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_4:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 4, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_5:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 5, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_6:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 6, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_7:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 7, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_8:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 8, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_9:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 9, level.value)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_10:
		{
			dvxNotifyAudioOutEqGain(level.input.device, 10, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
		case DVX_LEVEL_AUDIO_OUTPUT_SOURCE_MIXING_LEVEL:
		{
			dvxNotifyAudioOutMixLevel(level.input.device, level.value, DVX_MIX_INPUT_LINE, level.input.device.port)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_1_MIXING_LEVEL:
		{
			dvxNotifyAudioOutMixLevel(level.input.device, level.value, DVX_MIX_INPUT_MIC1, level.input.device.port)
		}
		
		case DVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_2_MIXING_LEVEL:
		{
			dvxNotifyAudioOutMixLevel(level.input.device, level.value, DVX_MIX_INPUT_MIC2, level.input.device.port)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
		case DVX_LEVEL_AUDIO_OUTPUT_SWITCHING:
		{
			dvxNotifySwitch(level.input.device.number:1:level.input.device.system,SIGNAL_TYPE_AUDIO,level.value,level.input.device.port)
		}
		#end_if
		
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_MIC_INPUTS
level_event[dvDvxMicInPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
		case DVX_LEVEL_AUDIO_MIC_PREAMP_GAIN:
		{
			dvxNotifyAudioMicPreampGain(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
		case DVX_LEVEL_AUDIO_MIC_GAIN:
		{
			dvxNotifyAudioMicGain(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
		case DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_1:
		{
			dvxNotifyAudioMicEq(level.input.device, 1, level.value)
		}
		
		case DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_2:
		{
			dvxNotifyAudioMicEq(level.input.device, 2, level.value)
		}
		
		case DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_3:
		{
			dvxNotifyAudioMicEq(level.input.device, 3, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_INPUTS
level_event[dvDvxVidInPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_BRIGHTNESS:
		{
			dvxNotifyVideoInputBrightness(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_SATURATION:
		{
			dvxNotifyVideoInputSaturation(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_CONTRAST:
		{
			dvxNotifyVideoInputContrast(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_HUE:
		{
			dvxNotifyVideoInputHue(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_HORIZONTAL_SHIFT:
		{
			dvxNotifyVideoInputHorizontalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
		case DVX_LEVEL_VIDEO_INPUT_VERTICAL_SHIFT:
		{
			dvxNotifyVideoInputVerticalShift(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#if_defined INCLUDE_DVX_MONITOR_SWITCHER_VIDEO_OUTPUTS
level_event[dvDvxVidOutPorts,0]
{
	switch (level.input.level)
	{
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_ZOOM:
		{
			dvxNotifyVideoOutputZoom(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_BRIGHTNESS:
		{
			dvxNotifyVideoOutputBrightness(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONTRAST_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_CONTRAST:
		{
			dvxNotifyVideoOutputContrast(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SIZE:
		{
			dvxNotifyVideoOutputHorizontalSize(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SHIFT:
		{
			dvxNotifyVideoOutputHorizontalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SIZE:
		{
			dvxNotifyVideoOutputVerticalSize(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SHIFT:
		{
			dvxNotifyVideoOutputVerticalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
		case DVX_LEVEL_VIDEO_OUTPUT_SWITCHING:
		{
			dvxNotifySwitch(level.input.device.number:1:level.input.device.system,SIGNAL_TYPE_VIDEO,level.value,level.input.device.port)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
	}
}
#end_if

#end_if