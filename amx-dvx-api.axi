program_name='amx-dvx-api'

#if_not_defined __AMX_DVX_API__
#define __AMX_DVX_API__

/*
 * --------------------
 * amx-dvx-api
 *
 * For usage, check out the readme for the amx-dvx-library.
 * --------------------
 */

define_constant

char VERSION_AMX_DVX_API[] = 'v1.0.0'


define_constant

integer DVX_MAX_VIDEO_INPUTS    = 10
integer DVX_MAX_VIDEO_OUTPUTS   = 4

integer DVX_MAX_AUDIO_INPUTS    = 14
integer DVX_MAX_AUDIO_OUTPUTS   = 4

integer DVX_MAX_MIC_INPUTS      = 2

/*
 * --------------------
 * DVX structures
 * 
 * Can be used by NetLinx programmer to keep track of DVX info.
 * --------------------
 */

define_type

structure _DvxAudioInput
{
	char compressingSetting[30]
	integer compressionAttack      // 1 to 2000
	integer compressionRatio       // 1 to 20
	integer compressionRelease     // 1 to 5000
	sinteger compressionThreshold  // 0 to -16 (in dB)
	sinteger gain                  // -24 to 24 (dB)
	char stereoSetting[30]
}

structure _DvxAudioMic
{
	char compressionSetting[30]
	integer compressionAttack      // 1 to 2000
	integer compressionRatio       // 1 to 20
	integer compressionRelease     // 1 to 5000
	sinteger compressionThreshold  // 0 to -60

	integer duckingAttack      // 1 to 2000
	integer duckingHold        // 0 to 2000
	integer duckingLevel       // 0 to 20
	integer duckingRelease     // 10 to 5000

	// 3 band EQ
	integer eqCenterFrequency[3]   // 20 to 20,000 (in Hz)
	char eqFilterType[3][30]
	sinteger eqGain[3]             // -12 to 12 (in dB)
	float eqQualityFactor[3]

	sinteger gain

	char gatingSetting[30]
	integer gatingAttack
	integer gatingDepth
	integer gatingHold
	integer gatingRelease
	sinteger gatingThreshold

	char limiterSetting[30]
	integer limiterAttack
	integer limiterRelease
	float limiterThreshold

	char onStatus[30]

	char phantomPowerOnStatus[30]

	integer preampGain         // 0 to 100 (in percent %)

	char micTypeInUse[30]      // Single Stereo or Dual Mono    
}

structure _DvxAudioOutput
{
	sinteger balance       // -20 to 20 (in dB)
	integer delay          // 0 to 200 (in milliseconds)

	integer duckingAttack      // 1 to 2000
	integer duckingHold        // 0 to 2000
	integer duckingLevel       // 0 to 20
	integer duckingRelease     // 10 to 5000
	sinteger duckingThreshold  // -60 to 0
	char duckingSetting[30]

	integer eqCenterFrequency[10]  // 20 to 20,000 (in kHz)
	char eqFilterType[10][30]
	sinteger eqGain[10]            // -12 to 12 (in dB)
	char eqMode[30]
	float eqQualityFactor[10]

	integer maximumVolume          // 0 to 100 (in percent)
	integer minimumVolume          // 0 to 100 (in percent)
	char muteStatus[30]
	char ampStereoMode[30]
	char testToneFrequency[30]
	integer volume                 // 0 to 100 (in percent)
}

structure _DvxVideoInput
{
	integer brightness             // 0 to 100
	char blackAndWhiteStatus[30]
	char colorStatus[30]
	integer contrast               // 0 to 100
	char edidSource[30]
	char edidAutoStatus[30]
	char signalFormat[30]
	char hdcpComplianceStatus
	sinteger horizontalShift       // -50 to 50
	integer hue                    // 0 to 100
	char name[30]
	integer phase                  // 0 to 31
	char edidPreferredResolution[30]
	char autoResolutionStatus[30]
	char resolutionAndRefreshRate[30]
	integer saturation         // 0 to 100
	char status[30]
	sinteger verticalShift     // -10 to 10
}

structure _DvxVideoOutput
{
	char aspectRatio[30]
	char blankingImage[30]
	integer brightness         // 0 to 100
	integer contrast           // 0 to 100
	char freezeOption[30]
	sinteger horizontalShift   // -127 to 127
	integer horizontalSize     // 25 to 800
	char muteStatus[30]
	char onStatus[30]
	char osdStatus[30]
	char osdColor[30]
	char osdPosition[30]
	char resolutionAndRefreshRate[30]
	char scalerSetting[30]
	char testPattern[30]
	sinteger verticalShift     // -127 to 127
	integer verticalSize       // 25 to 800
	integer zoom               // 25 to 800
}


structure _DvxSwitcher
{
	_DvxAudioInput audioInputs[DVX_MAX_AUDIO_INPUTS]
	_DvxAudioOutput audioOutputs[DVX_MAX_AUDIO_OUTPUTS]

	_DvxMicInput micInputs[DVX_MAX_MIC_INPUTS]

	_DvxVideoInput videoInputs[DVX_MAX_VIDEO_INPUTS]
	_DvxVideoOutput videoOutputs[DVX_MAX_VIDEO_OUTPUTS]
	
	integer switchStatusVideoInputs[DVX_MAX_VIDEO_INPUTS]
	integer switchStatusVideoOutputs[DVX_MAX_VIDEO_OUTPUTS]
	integer switchStatusAudioInputs[DVX_MAX_AUDIO_INPUTS]
	integer switchStatusAudioOutputs[DVX_MAX_AUDIO_OUTPUTS]
}



/*
 * --------------------
 * DVX constants
 * --------------------
 */

define_constant


/*
 * --------------------
 * DVX level codes
 * --------------------
 */


// System level codes
integer DVX_LEVEL_TEMPERATURE               = 8 // range: ???

// Audio input level codes
integer DVX_LEVEL_AUDIO_INPUT_GAIN          = 5 // range: -24 to 24

// Audio output level codes
integer DVX_LEVEL_AUDIO_OUTPUT_VOLUME                   = 1     // range: 0 to 100
integer DVX_LEVEL_AUDIO_OUTPUT_BALANCE                  = 2     // range: -20 to 20
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_1                = 31    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_2                = 32    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_3                = 33    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_4                = 34    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_5                = 35    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_6                = 36    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_7                = 37    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_8                = 38    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_9                = 39    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_10               = 40    // range: -12 to 12
integer DVX_LEVEL_AUDIO_OUTPUT_SOURCE_MIXING_LEVEL      = 41    // range: 0 to 100
integer DVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_1_MIXING_LEVEL  = 42    // range: 0 to 100
integer DVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_2_MIXING_LEVEL  = 43    // range: 0 to 100
integer DVX_LEVEL_AUDIO_OUTPUT_SWITCHING                = 51    // range: 0 to 14

// Mic input level codes
integer DVX_LEVEL_AUDIO_MIC_PREAMP_GAIN     = 52    // range: 0 to 65
integer DVX_LEVEL_AUDIO_MIC_GAIN            = 53    // range: -24 to 24
integer DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_1   = 61    // range: -12 to 12
integer DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_2   = 62    // range: -12 to 12
integer DVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_3   = 63    // range: -12 to 12

// Video input level codes
integer DVX_LEVEL_VIDEO_INPUT_BRIGHTNESS        = 10    // range: 0 to 100
integer DVX_LEVEL_VIDEO_INPUT_SATURATION        = 11    // range: 0 to 100
integer DVX_LEVEL_VIDEO_INPUT_CONTRAST          = 12    // range: 0 to 100
integer DVX_LEVEL_VIDEO_INPUT_HUE               = 14    // range: 0 to 100
integer DVX_LEVEL_VIDEO_INPUT_HORIZONTAL_SHIFT  = 17    // range: -50 to 50
integer DVX_LEVEL_VIDEO_INPUT_VERTICAL_SHIFT    = 19    // range: -10 to 10

// Video output level codes
integer DVX_LEVEL_VIDEO_OUTPUT_ZOOM                 = 15    // range: 25 to 800
integer DVX_LEVEL_VIDEO_OUTPUT_BRIGHTNESS           = 20    // range: 0 to 100
integer DVX_LEVEL_VIDEO_OUTPUT_CONTRAST             = 22    // range: 0 to 100
integer DVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SIZE      = 26    // range: 25 to 800
integer DVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SHIFT     = 27    // range: -127 to 127
integer DVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SIZE        = 28    // range: 25 to 800
integer DVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SHIFT       = 29    // range: -127 to 127
integer DVX_LEVEL_VIDEO_OUTPUT_SWITCHING            = 50    // range: 0 to 10


/*
 * --------------------
 * DVX channel codes
 * --------------------
 */


// System channel codes
integer DVX_CHANNEL_STANDBY_MODE        = 100
integer DVX_CHANNEL_FAN_ALARM           = 216
integer DVX_CHANNEL_TEMPERATURE_ALARM   = 217

// Switching channel codes
integer DVX_CHANNEL_OUTPUT_SOURCE_CYCLE = 196

// Audio input channel codes
integer DVX_CHANNEL_AUDIO_INPUT_GAIN_UP     = 140
integer DVX_CHANNEL_AUDIO_INPUT_GAIN_DOWN   = 141
integer DVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE   = 143
integer DVX_CHANNEL_AUDIO_INPUT_GAIN_CYCLE  = 144

// Audio output channel codes
integer DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_UP              = 24
integer DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_DOWN            = 25
integer DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE_CYCLE      = 26
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_1   = 41
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_2   = 42
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_3   = 43
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_4   = 44
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_5   = 45
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_6   = 46
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_7   = 47
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_8   = 48
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_9   = 49
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_10  = 50
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_11  = 51
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_12  = 52
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_13  = 53
integer DVX_CHANNEL_AUDIO_OUTPUT_SWITCH_AUDIO_INPUT_14  = 54
integer DVX_CHANNEL_AUDIO_OUTPUT_BALANCE_RAMP_UP        = 164
integer DVX_CHANNEL_AUDIO_OUTPUT_BALANCE_RAMP_DOWN      = 165
integer DVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE            = 199

// Video input channel codes
integer DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_UP               = 83
integer DVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_DOWN             = 84
integer DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_UP      = 132
integer DVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_DOWN    = 133
integer DVX_CHANNEL_VIDEO_INPUT_HORIZONTAL_SHIFT_RAMP_UP    = 134
integer DVX_CHANNEL_VIDEO_INPUT_HORIZONTAL_SHIFT_RAMP_DOWN  = 135
integer DVX_CHANNEL_VIDEO_INPUT_BLACK_AND_WHITE_STATE       = 142
integer DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_UP          = 148
integer DVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_DOWN        = 149
integer DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_UP          = 150
integer DVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_DOWN        = 151
integer DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_UP            = 152
integer DVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_DOWN          = 153
integer DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_UP                 = 156
integer DVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_DOWN               = 157

// Video output channel codes
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_1   = 31
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_2   = 32
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_3   = 33
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_4   = 34
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_5   = 35
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_6   = 36
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_7   = 37
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_8   = 38
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_9   = 39
integer DVX_CHANNEL_VIDEO_OUTPUT_SWITCH_VIDEO_INPUT_10  = 40
integer DVX_CHANNEL_VIDEO_OUTPUT_ENABLE                 = 70
integer DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_UP           = 158
integer DVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_DOWN         = 159
integer DVX_CHANNEL_VIDEO_OUTPUT_MUTE_STATE             = 210
integer DVX_CHANNEL_VIDEO_OUTPUT_FREEZE_STATE           = 213
integer DVX_CHANNEL_VIDEO_OUTPUT_OSD_STATE              = 234

// Audio mic channel codes
integer DVX_CHANNEL_AUDIO_MIC_ENABLE    = 71


/*
 * --------------------
 * DVX command headers
 * --------------------
 */


// Audio commands
char DVX_COMMAND_SWITCH_AUDIO_ONLY[]                            = 'AI'          // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_SWITCH_AUDIO[]                                 = 'CLAUDIOI'    // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_AUDIO_IN_COMPRESSION_REQUEST[]                 = '?AUDIN_COMPRESSION'
char DVX_COMMAND_AUDIO_IN_COMPRESSION[]                         = 'AUDIN_COMPRESSION-'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK_REQUEST[]          = '?AUDIN_COMPRESSION_ATTACK'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK[]                  = 'AUDIN_COMPRESSION_ATTACK-'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO_REQUEST[]           = '?AUDIN_COMPRESSION_RATIO'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO[]                   = 'AUDIN_COMPRESSION_RATIO-'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE_REQUEST[]         = '?AUDIN_COMPRESSION_RELEASE'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE[]                 = 'AUDIN_COMPRESSION_RELEASE-'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD_REQUEST[]       = '?AUDIN_COMPRESSION_THRESH'
char DVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD[]               = 'AUDIN_COMPRESSION_THRESH-'
char DVX_COMMAND_AUDIO_IN_GAIN_REQUEST[]                        = '?AUDIN_GAIN'
char DVX_COMMAND_AUDIO_IN_GAIN[]                                = 'AUDIN_GAIN-'
char DVX_COMMAND_AUDIO_IN_STEREO_REQUEST[]                      = '?AUDIN_STEREO'
char DVX_COMMAND_AUDIO_IN_STEREO[]                              = 'AUDIN_STEREO-'
//char DVX_COMMAND_AUDIO_MUTE_REQUEST[]                         = '?AUDIO_MUTE'     // Redacted, see ?AUDOUT_MUTE
//char DVX_COMMAND_AUDIO_MUTE[]                                 = 'AUDIO_MUTE-'     // Redacted, see AUDOUT_MUTE
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_REQUEST[]                = '?AUDMIC_COMPRESSION'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION[]                        = 'AUDMIC_COMPRESSION-'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK_REQUEST[]         = '?AUDMIC_COMPRESSION_ATTACK'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK[]                 = 'AUDMIC_COMPRESSION_ATTACK-'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO_REQUEST[]          = '?AUDMIC_COMPRESSION_RATIO'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO[]                  = 'AUDMIC_COMPRESSION_RATIO-'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE_REQUEST[]        = '?AUDMIC_COMPRESSION_RELEASE'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE[]                = 'AUDMIC_COMPRESSION_RELEASE-'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD_REQUEST[]      = '?AUDMIC_COMPRESSION_THRESH'
char DVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD[]              = 'AUDMIC_COMPRESSION_THRESH-'
//char DVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK_REQUEST[]           = '?AUDMIC_DUCK_ATTACK'
char DVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK[]                     = 'AUDMIC_DUCK_ATTACK-'
//char DVX_COMMAND_AUDIO_MIC_DUCKING_HOLD_REQUEST[]             = '?AUDMIC_DUCK_HOLD'
char DVX_COMMAND_AUDIO_MIC_DUCKING_HOLD[]                       = 'AUDMIC_DUCK_HOLD-'
//char DVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL_REQUEST[]            = '?AUDMIC_DUCK_LEVEL'
char DVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL[]                      = 'AUDMIC_DUCK_LEVEL-'
//char DVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE_REQUEST[]          = '?AUDMIC_DUCK_RELEASE'
char DVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE[]                    = 'AUDMIC_DUCK_RELEASE-'
//char DVX_COMMAND_AUDIO_MIC_EQ_REQUEST[]                       = '?AUDMIC_EQ-'     // INVALID COMMANDS - DOCUMENTATION WAS INCORRECT
//char DVX_COMMAND_AUDIO_MIC_EQ[]                               = 'AUDMIC_EQ-'      // INVALID COMMANDS - DOCUMENTATION WAS INCORRECT
char DVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY_REQUEST[]        = '?AUDMIC_EQ_CF-'
char DVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY[]                = 'AUDMIC_EQ_CF-'
char DVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE_REQUEST[]             = '?AUDMIC_EQ_FT-'
char DVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE[]                     = 'AUDMIC_EQ_FT-'
char DVX_COMMAND_AUDIO_MIC_EQ_GAIN_REQUEST[]                    = '?AUDMIC_EQ_GAIN-'
char DVX_COMMAND_AUDIO_MIC_EQ_GAIN[]                            = 'AUDMIC_EQ_GAIN-'
char DVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR_REQUEST[]          = '?AUDMIC_EQ_Q-'
char DVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR[]                  = 'AUDMIC_EQ_Q-'
char DVX_COMMAND_AUDIO_MIC_GAIN_REQUEST[]                       = '?AUDMIC_GAIN'
char DVX_COMMAND_AUDIO_MIC_GAIN[]                               = 'AUDMIC_GAIN-'
char DVX_COMMAND_AUDIO_MIC_GATING_REQUEST[]                     = '?AUDMIC_GATING'
char DVX_COMMAND_AUDIO_MIC_GATING[]                             = 'AUDMIC_GATING-'
char DVX_COMMAND_AUDIO_MIC_GATING_ATTACK_REQUEST[]              = '?AUDMIC_GATING_ATTACK'
char DVX_COMMAND_AUDIO_MIC_GATING_ATTACK[]                      = 'AUDMIC_GATING_ATTACK-'
char DVX_COMMAND_AUDIO_MIC_GATING_DEPTH_REQUEST[]               = '?AUDMIC_GATING_DEPTH'
char DVX_COMMAND_AUDIO_MIC_GATING_DEPTH[]                       = 'AUDMIC_GATING_DEPTH-'
char DVX_COMMAND_AUDIO_MIC_GATING_HOLD_REQUEST[]                = '?AUDMIC_GATING_HOLD'
char DVX_COMMAND_AUDIO_MIC_GATING_HOLD[]                        = 'AUDMIC_GATING_HOLD-'
char DVX_COMMAND_AUDIO_MIC_GATING_RELEASE_REQUEST[]             = '?AUDMIC_GATING_RELEASE'
char DVX_COMMAND_AUDIO_MIC_GATING_RELEASE[]                     = 'AUDMIC_GATING_RELEASE-'
char DVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD_REQUEST[]           = '?AUDMIC_GATING_THRESH'
char DVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD[]                   = 'AUDMIC_GATING_THRESH-'
char DVX_COMMAND_AUDIO_MIC_LIMITER_REQUEST[]                    = '?AUDMIC_LIMITER'
char DVX_COMMAND_AUDIO_MIC_LIMITER[]                            = 'AUDMIC_LIMITER-'
char DVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK_REQUEST[]             = '?AUDMIC_LIMITER_ATTACK'
char DVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK[]                     = 'AUDMIC_LIMITER_ATTACK-'
char DVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE_REQUEST[]            = '?AUDMIC_LIMITER_RELEASE'
char DVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE[]                    = 'AUDMIC_LIMITER_RELEASE-'
char DVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD_REQUEST[]          = '?AUDMIC_LIMITER_THRESH'
char DVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD[]                  = 'AUDMIC_LIMITER_THRESH-'
char DVX_COMMAND_AUDIO_MIC_ON_REQUEST[]                         = '?AUDMIC_ON'
char DVX_COMMAND_AUDIO_MIC_ON[]                                 = 'AUDMIC_ON-'
char DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER_REQUEST[]              = '?AUDMIC_PHANTOM_PWR'
char DVX_COMMAND_AUDIO_MIC_PHANTOM_POWER[]                      = 'AUDMIC_PHANTOM_PWR-'
char DVX_COMMAND_AUDIO_MIC_PREAMP_GAIN_REQUEST[]                = '?AUDMIC_PREAMP_GAIN'
char DVX_COMMAND_AUDIO_MIC_PREAMP_GAIN[]                        = 'AUDMIC_PREAMP_GAIN-'
char DVX_COMMAND_AUDIO_MIC_STEREO_REQUEST[]                     = '?AUDMIC_STEREO'
char DVX_COMMAND_AUDIO_MIC_STEREO[]                             = 'AUDMIC_STEREO-'
char DVX_COMMAND_AUDIO_OUT_BALANCE_REQUEST[]                    = '?AUDOUT_BALANCE'
char DVX_COMMAND_AUDIO_OUT_BALANCE[]                            = 'AUDOUT_BALANCE-'
char DVX_COMMAND_AUDIO_OUT_DELAY_REQUEST[]                      = '?AUDOUT_DELAY'
char DVX_COMMAND_AUDIO_OUT_DELAY[]                              = 'AUDOUT_DELAY-'
//char DVX_COMMAND_AUDIO_OUT_DUCKING_ATTACK_REQUEST[]           = '?AUDOUT_DUCK_ATTACK'
char DVX_COMMAND_AUDIO_OUT_DUCKING_ATTACK[]                     = 'AUDOUT_DUCK_ATTACK-'
//char DVX_COMMAND_AUDIO_OUT_DUCKING_HOLD_REQUEST[]             = '?AUDOUT_DUCK_HOLD'
char DVX_COMMAND_AUDIO_OUT_DUCKING_HOLD[]                       = 'AUDOUT_DUCK_HOLD-'
//char DVX_COMMAND_AUDIO_OUT_DUCKING_LEVEL_REQUEST[]            = '?AUDOUT_DUCK_LEVEL'
char DVX_COMMAND_AUDIO_OUT_DUCKING_LEVEL[]                      = 'AUDOUT_DUCK_LEVEL-'
//char DVX_COMMAND_AUDIO_OUT_DUCKING_RELEASE_REQUEST[]          = '?AUDOUT_DUCK_RELEASE'
char DVX_COMMAND_AUDIO_OUT_DUCKING_RELEASE[]                    = 'AUDOUT_DUCK_RELEASE-'
char DVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD_REQUEST[]          = '?AUDOUT_DUCK_THRESH'
char DVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD[]                  = 'AUDOUT_DUCK_THRESH-'
char DVX_COMMAND_AUDIO_OUT_DUCKING_REQUEST[]                    = '?AUDOUT_DUCKING'
char DVX_COMMAND_AUDIO_OUT_DUCKING[]                            = 'AUDOUT_DUCKING-'
char DVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY_REQUEST[]        = '?AUDOUT_EQ_CF-'
char DVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY[]                = 'AUDOUT_EQ_CF-'
char DVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE_REQUEST[]             = '?AUDOUT_EQ_FT-'
char DVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE[]                     = 'AUDOUT_EQ_FT-'
char DVX_COMMAND_AUDIO_OUT_EQ_GAIN_REQUEST[]                    = '?AUDOUT_EQ_GAIN-'
char DVX_COMMAND_AUDIO_OUT_EQ_GAIN[]                            = 'AUDOUT_EQ_GAIN-'
char DVX_COMMAND_AUDIO_OUT_EQ_MODE_REQUEST[]                    = '?AUDOUT_EQ_MODE-'
char DVX_COMMAND_AUDIO_OUT_EQ_MODE[]                            = 'AUDOUT_EQ_MODE-'
char DVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR_REQUEST[]          = '?AUDOUT_EQ_Q-'
char DVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR[]                  = 'AUDOUT_EQ_Q-'
char DVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME_REQUEST[]             = '?AUDOUT_MAXVOL'
char DVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME[]                     = 'AUDOUT_MAXVOL-'
char DVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME_REQUEST[]             = '?AUDOUT_MINVOL'
char DVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME[]                     = 'AUDOUT_MINVOL-'
char DVX_COMMAND_AUDIO_OUT_MUTE_REQUEST[]                       = '?AUDOUT_MUTE'
char DVX_COMMAND_AUDIO_OUT_MUTE[]                               = 'AUDOUT_MUTE-'
char DVX_COMMAND_AUDIO_OUT_STEREO_REQUEST[]                     = '?AUDOUT_STEREO'
char DVX_COMMAND_AUDIO_OUT_STEREO[]                             = 'AUDOUT_STEREO-'
char DVX_COMMAND_AUDIO_OUT_TEST_TONE_REQUEST[]                  = '?AUDOUT_TESTTONE'
char DVX_COMMAND_AUDIO_OUT_TEST_TONE[]                          = 'AUDOUT_TESTTONE-'
char DVX_COMMAND_AUDIO_OUT_VOLUME_REQUEST[]                     = '?AUDOUT_VOLUME'
char DVX_COMMAND_AUDIO_OUT_VOLUME[]                             = 'AUDOUT_VOLUME-'
//char DVX_COMMAND_AUDIO_GAIN_REQUEST[]                         = '?GAIN-'      // redacted, see ?AUDIN_GAIN
//char DVX_COMMAND_AUDIO_GAIN[]                                 = 'GAIN-'       // redacted, see AUDIN_GAIN
char DVX_COMMAND_AUDIO_OUT_HDMI_AUDIO_REQUEST[]                 = '?HDMIOUT_AUDIO'
char DVX_COMMAND_AUDIO_OUT_HDMI_AUDIO[]                         = 'HDMIOUT_AUDIO-'
char DVX_COMMAND_AUDIO_OUT_HDMI_EQ_REQUEST[]                    = '?HDMIOUT_EQ'
char DVX_COMMAND_AUDIO_OUT_HDMI_EQ[]                            = 'HDMIOUT_EQ-'
//char DVX_COMMAND_AUDIO_INPUT_EQ_REQUEST[]                     = '?INPUT_EQ-'      // redacted, see ?AUDMIC_EQ
//char DVX_COMMAND_AUDIO_INPUT_OUT_EQ[]                         = 'INPUT_EQ-'       // redacted, see AUDMIC_EQ
//char DVX_COMMAND_AUDIO_PHANTOM_POWER_REQUEST[]                = '?PHANTOM_PWR'    // redacted, see ?AUDMIC_PHANTOM_PWR
//char DVX_COMMAND_AUDIO_PHANTOM_POWER[]                        = 'PHANTOM_PWR-'    // redacted, see AUDMIC_PHANTOM_PWR
char DVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO_REQUEST[]                = '?SPDIFOUT_AUDIO'
char DVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO[]                        = 'SPDIFOUT_AUDIO-'
//char DVX_COMMAND_AUDIO_VOLUME_REQUEST[]                       = '?VOLUME'     // redacted, see ?AUDOUT_VOLUME
//char DVX_COMMAND_AUDIO_VOLUME[]                               = 'VOLUME-'     // redacted, see AUDOUT_VOLUME
char DVX_COMMAND_AUDIO_MIX_LEVEL_REQUEST[]                      = '?XPOINT-'
char DVX_COMMAND_AUDIO_MIX_LEVEL[]                              = 'XPOINT-'

// Video commands
char DVX_COMMAND_SWITCH_AUDIO_AND_VIDEO[]                       = 'CI'          // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_SWITCH_VIDEO[]                                 = 'CLVIDEOI'    // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_SWITCH_ALL[]                                   = 'CLALLI'      // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_SWITCH_VIDEO_ONLY[]                            = 'VI'          // NOTE: command does not confirm to DVX API (header-parameters)
char DVX_COMMAND_SWITCH_RESPONSE[]                              = 'SWITCH-'
char DVX_COMMAND_INPUT_REQUEST[]                                = '?INPUT-'
char DVX_COMMAND_OSD_REQUEST[]                                  = '?OSD'
char DVX_COMMAND_OSD[]                                          = 'OSD-'
char DVX_COMMAND_OUTPUT_REQUEST[]                               = '?OUTPUT-'
char DVX_COMMAND_VIDEO_MUTE_REQUEST[]                           = '?VIDEO_MUTE'         // Redacted (see ?VIDOUT_MUTE) (still works)
char DVX_COMMAND_VIDEO_MUTE[]                                   = 'VIDEO_MUTE-'         // Redacted (see VIDOUT_MUTE) (still works)
//char DVX_COMMAND_VIDEO_TEST_PATTERN_REQUEST[]                 = '?VIDEO_TESTPATTERN'  // Redacted (no longer works)
//char DVX_COMMAND_VIDEO_TEST_PATTERN[]                         = 'VIDEO_TESTPATTERN-'  // Redacted (no longer works)
char DVX_COMMAND_VIDEO_IN_BRIGHTNESS_REQUEST[]                  = '?VIDIN_BRIGHTNESS'
char DVX_COMMAND_VIDEO_IN_BRIGHTNESS[]                          = 'VIDIN_BRIGHTNESS-'
char DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE_REQUEST[]       = '?VIDIN_BW'
char DVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE[]               = 'VIDIN_BW-'
char DVX_COMMAND_VIDEO_IN_COLOR_REQUEST[]                       = '?VIDIN_COLOR'    // Redacted (see VIDIN_BW)
char DVX_COMMAND_VIDEO_IN_COLOR[]                               = 'VIDIN_COLOR-'    // Redacted (see ?VIDIN_BW)
char DVX_COMMAND_VIDEO_IN_CONTRAST_REQUEST[]                    = '?VIDIN_CONTRAST'
char DVX_COMMAND_VIDEO_IN_CONTRAST[]                            = 'VIDIN_CONTRAST-'
char DVX_COMMAND_VIDEO_IN_EDID_SOURCE_REQUEST[]                 = '?VIDIN_EDID'
char DVX_COMMAND_VIDEO_IN_EDID_SOURCE[]                         = 'VIDIN_EDID-'
char DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO_REQUEST[]            = '?VIDIN_EDID_AUTO'
char DVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO[]                    = 'VIDIN_EDID_AUTO-'
char DVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION_REQUEST[]   = '?VIDIN_PREF_EDID'
char DVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION[]           = 'VIDIN_PREF_EDID-'
char DVX_COMMAND_VIDEO_IN_FORMAT_REQUEST[]                      = '?VIDIN_FORMAT'
char DVX_COMMAND_VIDEO_IN_FORMAT[]                              = 'VIDIN_FORMAT-'
char DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE_REQUEST[]             = '?VIDIN_HDCP'
char DVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE[]                     = 'VIDIN_HDCP-'
char DVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT_REQUEST[]            = '?VIDIN_HSHIFT'
char DVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT[]                    = 'VIDIN_HSHIFT-'
char DVX_COMMAND_VIDEO_IN_HUE_REQUEST[]                         = '?VIDIN_HUE'
char DVX_COMMAND_VIDEO_IN_HUE[]                                 = 'VIDIN_HUE-'
char DVX_COMMAND_VIDEO_IN_NAME_REQUEST[]                        = '?VIDIN_NAME'
char DVX_COMMAND_VIDEO_IN_NAME[]                                = 'VIDIN_NAME-'
char DVX_COMMAND_VIDEO_IN_PHASE_REQUEST[]                       = '?VIDIN_PHASE'
char DVX_COMMAND_VIDEO_IN_PHASE[]                               = 'VIDIN_PHASE-'
char DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO_REQUEST[]             = '?VIDIN_RES_AUTO'
char DVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO[]                     = 'VIDIN_RES_AUTO-'
char DVX_COMMAND_VIDEO_IN_RESOLUTION_REQUEST[]                  = '?VIDIN_RES_REF'
char DVX_COMMAND_VIDEO_IN_RESOLUTION[]                          = 'VIDIN_RES_REF-'
char DVX_COMMAND_VIDEO_IN_SATURATION_REQUEST[]                  = '?VIDIN_SATURATION'
char DVX_COMMAND_VIDEO_IN_SATURATION[]                          = 'VIDIN_SATURATION-'
char DVX_COMMAND_VIDEO_IN_STATUS_REQUEST[]                      = '?VIDIN_STATUS'
char DVX_COMMAND_VIDEO_IN_STATUS[]                              = 'VIDIN_STATUS-'
char DVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT_REQUEST[]              = '?VIDIN_VSHIFT'
char DVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT[]                      = 'VIDIN_VSHIFT-'
char DVX_COMMAND_VIDEO_OUT_ASPECT_RATIO_REQUEST[]               = '?VIDOUT_ASPECT_RATIO'
char DVX_COMMAND_VIDEO_OUT_ASPECT_RATIO[]                       = 'VIDOUT_ASPECT_RATIO-'
char DVX_COMMAND_VIDEO_OUT_BLANK_IMAGE_REQUEST[]                = '?VIDOUT_BLANK'
char DVX_COMMAND_VIDEO_OUT_BLANK_IMAGE[]                        = 'VIDOUT_BLANK-'
char DVX_COMMAND_VIDEO_OUT_BRIGHTNESS_REQUEST[]                 = '?VIDOUT_BRIGHTNESS'
char DVX_COMMAND_VIDEO_OUT_BRIGHTNESS[]                         = 'VIDOUT_BRIGHTNESS-'
char DVX_COMMAND_VIDEO_OUT_CONTRAST_REQUEST[]                   = '?VIDOUT_CONTRAST'
char DVX_COMMAND_VIDEO_OUT_CONTRAST[]                           = 'VIDOUT_CONTRAST-'
char DVX_COMMAND_VIDEO_OUT_FREEZE_REQUEST[]                     = '?VIDOUT_FREEZE'
char DVX_COMMAND_VIDEO_OUT_FREEZE[]                             = 'VIDOUT_FREEZE-'
char DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT_REQUEST[]           = '?VIDOUT_HSHIFT'
char DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT[]                   = 'VIDOUT_HSHIFT-'
char DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE_REQUEST[]            = '?VIDOUT_HSIZE'
char DVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE[]                    = 'VIDOUT_HSIZE-'
char DVX_COMMAND_VIDEO_OUT_MUTE_REQUEST[]                       = '?VIDOUT_MUTE'
char DVX_COMMAND_VIDEO_OUT_MUTE[]                               = 'VIDOUT_MUTE-'
char DVX_COMMAND_VIDEO_OUT_ON_REQUEST[]                         = '?VIDOUT_ON'
char DVX_COMMAND_VIDEO_OUT_ON[]                                 = 'VIDOUT_ON-'
char DVX_COMMAND_VIDEO_OUT_OSD_REQUEST[]                        = '?VIDOUT_OSD'
char DVX_COMMAND_VIDEO_OUT_OSD[]                                = 'VIDOUT_OSD-'
char DVX_COMMAND_VIDEO_OUT_OSD_COLOR_REQUEST[]                  = '?VIDOUT_OSD_COLOR'
char DVX_COMMAND_VIDEO_OUT_OSD_COLOR[]                          = 'VIDOUT_OSD_COLOR-'
char DVX_COMMAND_VIDEO_OUT_OSD_POSITION_REQUEST[]               = '?VIDOUT_OSD_POS'
char DVX_COMMAND_VIDEO_OUT_OSD_POSITION[]                       = 'VIDOUT_OSD_POS-'
//char DVX_COMMAND_VIDEO_OUT_RESOLUTION_REQUEST[]               = '?VIDOUT_RES' // Redacted (still works)
//char DVX_COMMAND_VIDEO_OUT_RESOLUTION[]                       = 'VIDOUT_RES-' // Redacted (still works)
char DVX_COMMAND_VIDEO_OUT_RESOLUTION_REQUEST[]                 = '?VIDOUT_RES_REF'
char DVX_COMMAND_VIDEO_OUT_RESOLUTION[]                         = 'VIDOUT_RES_REF-'
//char DVX_COMMAND_VIDEO_OUT_RESOLUTION_AUTO_REQUEST[]          = '?VIDOUT_RES_AUTO' // Redacted (see ?VIDOUT_SCALE)
//char DVX_COMMAND_VIDEO_OUT_RESOLUTION_AUTO[]                  = 'VIDOUT_RES_AUTO-' // Redacted (see VIDOUT_SCALE)
char DVX_COMMAND_VIDEO_OUT_SCALE_MODE_REQUEST[]                 = '?VIDOUT_SCALE'
char DVX_COMMAND_VIDEO_OUT_SCALE_MODE[]                         = 'VIDOUT_SCALE-'
char DVX_COMMAND_VIDEO_OUT_TEST_PATTERN_REQUEST[]               = '?VIDOUT_TESTPAT'
char DVX_COMMAND_VIDEO_OUT_TEST_PATTERN[]                       = 'VIDOUT_TESTPAT-'
char DVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT_REQUEST[]             = '?VIDOUT_VSHIFT'
char DVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT[]                     = 'VIDOUT_VSHIFT-'
char DVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE_REQUEST[]              = '?VIDOUT_VSIZE'
char DVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE[]                      = 'VIDOUT_VSIZE-'
char DVX_COMMAND_VIDEO_OUT_ZOOM_REQUEST[]                       = '?VIDOUT_ZOOM'
char DVX_COMMAND_VIDEO_OUT_ZOOM[]                               = 'VIDOUT_ZOOM-'

// Front Panel commands
char DVX_COMMAND_FRONT_PANEL_LOCKOUT[]                  = 'FP_LOCKOUT-'
char DVX_COMMAND_FRONT_PANEL_LOCKOUT_REQUEST[]          = '?FP_LOCKOUT'
char DVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE[]             = 'FP_LOCKTYPE-'
char DVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE_REQUEST[]     = '?FP_LOCKTYPE'
char DVX_COMMAND_FRONT_PANEL_INTENSITY_LCD[]            = 'INTENSITY_LCD-'
char DVX_COMMAND_FRONT_PANEL_INTENSITY_LCD_REQUEST[]    = '?INTENSITY_LCD'
char DVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS[]           = 'INTENSITY_LEDS-'
char DVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS_REQUEST[]   = '?INTENSITY_LEDS'

//System commands
char DVX_COMMAND_DXLINK_OUTPUT_ETHERNET_REQUEST[]   = '?DXLINK_ETH'
char DVX_COMMAND_DXLINK_OUTPUT_ETHERNET[]           = 'DXLINK_ETH-'
char DVX_COMMAND_DXLINK_INPUT_ETHERNET_REQUEST[]    = '?DXLINK_IN_ETH'
char DVX_COMMAND_DXLINK_INPUT_ETHERNET[]            = 'DXLINK_IN_ETH-'
//char DVX_COMMAND_DSP_FIRMWARE_VERSION_REQUEST[]   = '?DSP_FWVERSION'  // Redacted
//char DVX_COMMAND_DSP_FIRMWARE_VERSION[]           = 'DSP_FWVERSION-'  // Redacted
char DVX_COMMAND_FAN_SPEED_REQUEST[]                = '?FAN_SPEED'
char DVX_COMMAND_FAN_SPEED[]                        = 'FAN_SPEED-'
char DVX_COMMAND_TEMPERATURE_REQUEST[]              = '?TEMP'
char DVX_COMMAND_TEMPERATURE[]                      = 'TEMP-'


/*
 * --------------------
 * DVX ports
 * --------------------
 */


// DVX Ports
integer DVX_PORT_VID_IN_NONE    = 0
integer DVX_PORT_AUD_IN_NONE    = 0
integer DVX_PORT_MAIN           = 1
integer DVX_PORT_VID_IN_1       = 1
integer DVX_PORT_VID_IN_2       = 2
integer DVX_PORT_VID_IN_3       = 3
integer DVX_PORT_VID_IN_4       = 4
integer DVX_PORT_VID_IN_5       = 5
integer DVX_PORT_VID_IN_6       = 6
integer DVX_PORT_VID_IN_7       = 7
integer DVX_PORT_VID_IN_8       = 8
integer DVX_PORT_VID_IN_9       = 9
integer DVX_PORT_VID_IN_10      = 10
integer DVX_PORT_VID_OUT_1      = 1
integer DVX_PORT_VID_OUT_2      = 2
integer DVX_PORT_VID_OUT_3      = 3
integer DVX_PORT_VID_OUT_4      = 4
integer DVX_PORT_AUD_IN_1       = 1
integer DVX_PORT_AUD_IN_2       = 2
integer DVX_PORT_AUD_IN_3       = 3
integer DVX_PORT_AUD_IN_4       = 4
integer DVX_PORT_AUD_IN_5       = 5
integer DVX_PORT_AUD_IN_6       = 6
integer DVX_PORT_AUD_IN_7       = 7
integer DVX_PORT_AUD_IN_8       = 8
integer DVX_PORT_AUD_IN_9       = 9
integer DVX_PORT_AUD_IN_10      = 10
integer DVX_PORT_AUD_IN_11      = 11
integer DVX_PORT_AUD_IN_12      = 12
integer DVX_PORT_AUD_IN_13      = 13
integer DVX_PORT_AUD_IN_14      = 14
integer DVX_PORT_AUD_OUT_1      = 1
integer DVX_PORT_AUD_OUT_2      = 2
integer DVX_PORT_AUD_OUT_3      = 3
integer DVX_PORT_AUD_OUT_4      = 4
integer DVX_PORT_MIC_IN_1       = 1
integer DVX_PORT_MIC_IN_2       = 2


/*
 * --------------------
 * DVX command parameter values
 * --------------------
 */


// DVX Front Panel Lockout Types
integer DVX_LOCKTYPE_ALL_MENUS              = 1
integer DVX_LOCKTYPE_RESERVED               = 2
integer DVX_LOCKTYPE_CONFIGURE_MENUS_ONLY   = 3

// DVX EDID Sources
char DVX_EDID_SOURCE_ALL_RESOLUTIONS[]  = 'ALL RESOLUTIONS'
char DVX_EDID_SOURCE_WIDE_SCREEN[]      = 'WIDE-SCREEN'
char DVX_EDID_SOURCE_FULL_SCREEN[]      = 'FULL-SCREEN'
char DVX_EDID_SOURCE_MIRROR_OUTPUT_1[]  = 'MIRROR OUT 1'
char DVX_EDID_SOURCE_MIRROR_OUTPUT_2[]  = 'MIRROR OUT 2'
char DVX_EDID_SOURCE_MIRROR_OUTPUT_3[]  = 'MIRROR OUT 3'
char DVX_EDID_SOURCE_MIRROR_OUTPUT_4[]  = 'MIRROR OUT 4'

// DVX Aspect Ratios
char DVX_ASPECT_RATIO_ANAMORPHIC[]  = 'ANAMORPHIC'
char DVX_ASPECT_RATIO_MAINTAIN[]    = 'MAINTAIN'
char DVX_ASPECT_RATIO_STRETCH[]     = 'STRETCH'
char DVX_ASPECT_RATIO_ZOOM[]        = 'ZOOM'

// DVX Blanking Image Options
char DVX_BLANK_IMAGE_BLACK[]    = 'BLACK'
char DVX_BLANK_IMAGE_BLUE[]     = 'BLUE'
char DVX_BLANK_IMAGE_LOGO_1[]   = 'LOGO 1'
char DVX_BLANK_IMAGE_LOGO_2[]   = 'LOGO 2'
char DVX_BLANK_IMAGE_LOGO_3[]   = 'LOGO 3'

// DVX OSD Color Options
char DVX_OSD_COLOR_BLACK[]  = 'BLACK'
char DVX_OSD_COLOR_BLUE[]   = 'BLUE'
char DVX_OSD_COLOR_WHITE[]  = 'WHITE'
char DVX_OSD_COLOR_YELLOW[] = 'YELLOW'

// DVX OSD Position Options
char DVX_OSD_POSITION_TOP_LEFT[]        = 'TOP LEFT'
char DVX_OSD_POSITION_TOP_RIGHT[]       = 'TOP RIGHT'
char DVX_OSD_POSITION_BOTTOM_LEFT[]     = 'BTM LEFT'
char DVX_OSD_POSITION_BOTTOM_RIGHT[]    = 'BTM RIGHT'

// DVX Scaler Modes
char DVX_SCALE_MODE_AUTO[]      = 'AUTO'
char DVX_SCALE_MODE_BYPASS[]    = 'BYPASS'
char DVX_SCALE_MODE_MANUAL[]    = 'MANUAL'

// DVX Test Patterns
char DVX_TEST_PATTERN_OFF[]         = 'OFF'
char DVX_TEST_PATTERN_COLOR_BAR[]   = 'COLOR BAR'
char DVX_TEST_PATTERN_GRAY_RAMP[]   = 'GRAY RAMP'
char DVX_TEST_PATTERN_HILO_TRACK[]  = 'HILOTRACK'
char DVX_TEST_PATTERN_PLUGE[]       = 'PLUGE'
char DVX_TEST_PATTERN_SMPTE_BAR[]   = 'SMPTE BAR'
char DVX_TEST_PATTERN_X_HATCH[]     = 'X-HATCH'
char DVX_TEST_PATTERN_LOGO_1[]      = 'LOGO 1'
char DVX_TEST_PATTERN_LOGO_2[]      = 'LOGO 2'
char DVX_TEST_PATTERN_LOGO_3[]      = 'LOGO 3'

// DVX Compression Options
char DVX_COMPRESSION_OFF[]      = 'OFF'
char DVX_COMPRESSION_LOW[]      = 'LOW'
char DVX_COMPRESSION_MEDIUM[]   = 'MEDIUM'
char DVX_COMPRESSION_HIGH[]     = 'HIGH'
char DVX_COMPRESSION_CUSTOM[]   = 'CUSTOM'

// DVX Gating Options
char DVX_GATING_OFF[]       = 'OFF'
char DVX_GATING_LOW[]       = 'LOW'
char DVX_GATING_MEDIUM[]    = 'MEDIUM'
char DVX_GATING_HIGH[]      = 'HIGH'
char DVX_GATING_CUSTOM[]    = 'CUSTOM'

// DVX Limiting Options
char DVX_LIMITER_OFF[]      = 'OFF'
char DVX_LIMITER_LOW[]      = 'LOW'
char DVX_LIMITER_MEDIUM[]   = 'MEDIUM'
char DVX_LIMITER_HIGH[]     = 'HIGH'
char DVX_LIMITER_CUSTOM[]   = 'CUSTOM'

// DVX Ducking Options
char DVX_DUCKING_OFF[]      = 'OFF'
char DVX_DUCKING_LOW[]      = 'LOW'
char DVX_DUCKING_MEDIUM[]   = 'MEDIUM'
char DVX_DUCKING_HIGH[]     = 'HIGH'
char DVX_DUCKING_CUSTOM[]   = 'CUSTOM'

// DVX Stereo/Mono Audio Options
char DVX_AUDIO_STEREO[] = 'STEREO'
char DVX_AUDIO_MONO[]   = 'MONO'

// DVX Microphone Types
char DVX_MIC_TYPE_DUAL_MONO[]       = 'DUAL MONO'
char DVX_MIC_TYPE_SINGLE_STEREO[]   = 'SINGLE STEREO'

// DVX Filter Types
char DVX_EQ_FILTER_TYPE_BELL[]          = 'BELL'
char DVX_EQ_FILTER_TYPE_BAND_PASS[]     = 'BAND PASS'
char DVX_EQ_FILTER_TYPE_BAND_STOP[]     = 'BAND STOP'
char DVX_EQ_FILTER_TYPE_HIGH_PASS[]     = 'HIGH PASS'
char DVX_EQ_FILTER_TYPE_LOW_PASS[]      = 'LOW PASS'
char DVX_EQ_FILTER_TYPE_TREBLE_SHELF[]  = 'TREBLE SHELF'
char DVX_EQ_FILTER_TYPE_BASS_SHELF[]    = 'BASS SHELF'

// DVX EQ Modes
char DVX_EQ_MODE_OFF[]      = 'OFF'
char DVX_EQ_MODE_VOICE[]    = 'VOICE'
char DVX_EQ_MODE_MUSIC[]    = 'MUSIC'
char DVX_EQ_MODE_MOVIE[]    = 'MOVIE'

// DVX Test Tones
char DVX_TEST_TONE_FREQUENCY_OFF[]          = 'OFF'
char DVX_TEST_TONE_FREQUENCY_60_HZ[]        = '60Hz'
char DVX_TEST_TONE_FREQUENCY_250_HZ[]       = '250Hz'
char DVX_TEST_TONE_FREQUENCY_400_HZ[]       = '400Hz'
char DVX_TEST_TONE_FREQUENCY_1_KHZ[]        = '1KHz'
char DVX_TEST_TONE_FREQUENCY_3_KHZ[]        = '3KHz'
char DVX_TEST_TONE_FREQUENCY_5_KHZ[]        = '5KHz'
char DVX_TEST_TONE_FREQUENCY_10_KHZ[]       = '10KHz'
char DVX_TEST_TONE_FREQUENCY_PINK_NOISE[]   = 'PINK NOISE'
char DVX_TEST_TONE_FREQUENCY_WHITE_NOISE[]  = 'WHITE NOISE'

// DVX HDMI Audio Output Options
char DVX_HDMI_AUDIO_OUTPUT_OFF[]                = 'OFF'
char DVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU[]    = 'INPUT PASS-THRU'
char DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1[]       = 'ANALOG OUT 1'
char DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2[]       = 'ANALOG OUT 2'
char DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3[]       = 'ANALOG OUT 3'
char DVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4[]       = 'ANALOG OUT 4'

// DVX SP/DIF Audio Output Options
char DVX_SPDIF_AUDIO_OUTPUT_OFF[]           = 'OFF'
char DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_1[]    = 'HDMI OUT 1'
char DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_2[]    = 'HDMI OUT 2'
char DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_3[]    = 'HDMI OUT 3'
char DVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_4[]    = 'HDMI OUT 4'
char DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_1[]  = 'ANALOG OUT 1'
char DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_2[]  = 'ANALOG OUT 2'
char DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_3[]  = 'ANALOG OUT 3'
char DVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_4[]  = 'ANALOG OUT 4'

// DVX Mix Input
//char DVX_MIX_INPUT_LINE[]     = 'LINE'
//char DVX_MIX_INPUT_MIC1[]     = 'MIC1'
//char DVX_MIX_INPUT_MIC2[]     = 'MIC2'
// DVX Mix Input
integer DVX_MIX_INPUT_LINE  = 1
integer DVX_MIX_INPUT_MIC1  = 2
integer DVX_MIX_INPUT_MIC2  = 3

integer DVX_MIX_OUTPUT_1_AMP    = 1
integer DVX_MIX_OUTPUT_2_LINE   = 2
integer DVX_MIX_OUTPUT_3_LINE   = 3
integer DVX_MIX_OUTPUT_4_LINE   = 4

// DVX Signal Status
char DVX_SIGNAL_STATUS_NO_SIGNAL[]      = 'NO SIGNAL'
char DVX_SIGNAL_STATUS_UNKNOWN[]        = 'UNKNOWN'
char DVX_SIGNAL_STATUS_VALID_SIGNAL[]   = 'VALID SIGNAL'

// DVX DXLink Ethernet Modes
char DVX_DXLINK_ETHERNET_OFF[]  = 'off'
char DVX_DXLINK_ETHERNET_AUTO[] = 'auto'

char DVX_VIDEO_OUTPUT_RESOLUTION_640x480_60HZ[]     = '640x480,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_640x480_72HZ[]     = '640x480,72'
char DVX_VIDEO_OUTPUT_RESOLUTION_640x480_75HZ[]     = '640x480,75'
char DVX_VIDEO_OUTPUT_RESOLUTION_800x600_60HZ[]     = '800x600,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_800x600_72HZ[]     = '800x600,72'
char DVX_VIDEO_OUTPUT_RESOLUTION_800x600_75HZ[]     = '800x600,75'
char DVX_VIDEO_OUTPUT_RESOLUTION_1024x768_60HZ[]    = '1024x768,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1024x768_70HZ[]    = '1024x768,70'
char DVX_VIDEO_OUTPUT_RESOLUTION_1024x768_75HZ[]    = '1024x768,75'
char DVX_VIDEO_OUTPUT_RESOLUTION_1280x720p_60HZ[]   = '1280x720p,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1280x768_60HZ[]    = '1280x768,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1280x800_60HZ[]    = '1280x800,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1280x1024_60HZ[]   = '1280x1024,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1360x768_60HZ[]    = '1360x768,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1440x900_60HZ[]    = '1440x900,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1600x1200_60HZ[]   = '1600x1200,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1680x1050_60HZ[]   = '1680x1050,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1920x1080_60HZ[]   = '1920x1080,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1920x1080p_60HZ[]  = '1920x1080p,60'
char DVX_VIDEO_OUTPUT_RESOLUTION_1920x1200_60HZ[]   = '1920x1200,60'




/*
 * --------------------
 * Functions to parse return comamands from DVX
 * --------------------
 */

define_constant

char cDvxCmdHeaderSeperator[] = '-'
char cDvxCmdParamaterSeperator[] = ','

// Name   : ==== DvxParseCmdHeader ====
// Purpose: To parse out parameters from DVX send_command or send_string
// Params : (1) IN/OUT  - sndcmd/str data
// Returns: parsed property/method name, still includes the leading '?' and/or trailing command seperating caharacter if present
// Notes  : Parses the strings sent to or from modules extracting the command header.
//          Command separating character assumed to be '-'
//
define_function char[100] dvxParseCmdHeader(CHAR cmd[])
{
	stack_var char cmdHeader[100]

	cmdHeader = remove_string(cmd,cDvxCmdHeaderSeperator,1)

	return cmdHeader
}

// Name   : ==== dvxParseCmdParam ====
// Purpose: To parse out parameters from received DVX send_command or send_string
// Params : (1) IN/OUT  - sndcmd/str data
// Returns: Parse parameter from the front of the string not including the separator
// Notes  : Parses the strings sent to or from modules extracting the parameters.
//          A single param is picked of the cmd string and removed, through the separator.
//          The separator is NOT returned from the function.
//          If the first character of the param is a double quote, the function will 
//          remove up to (and including) the next double-quote and the separator without spaces.
//          The double quotes will then be stripped from the parameter before it is returned.
//          If the double-quote/separator sequence is not found, the function will remove up to (and including)
//          the separator character and the leading double quote will NOT be removed.
//          If the separator is not found, the entire remained of the command is removed.
//          Parameter separating character assumed to be ','
//
define_function char[100] dvxParseCmdParam(CHAR cCmd[])
{
	stack_var char cTemp[100]
	stack_var char cSep[1]
	stack_var char chC
	stack_var integer nLoop
	stack_var integer nState
	stack_var char bInquotes
	stack_var char bDone

	// Reset state
	nState = 1; //ST_START
	bInquotes = FALSE;
	bDone = FALSE;

	// Loop the command and escape it
	for (nLoop = 1; nLoop <= length_array(cCmd); nLoop++)
	{
		// Grab characters and process it based on state machine
		chC = cCmd[nLoop];
		switch (nState)
		{
			// Start or string: end of string bails us out
			case 1: //ST_START
			{
				// Starts with a quote?
				// If so, skip it, set flag and move to collect.
				if (chC == '"')
				{
				    nState = 2; //ST_COLLECT
				    bInquotes = TRUE;
				}
				
				// Starts with a comma?  Empty param
				else if (chC == cDvxCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
				}
				
				// Not a quote or a comma?  Add it to the string and move to collection
				else
				{
					cTemp = "cTemp, chC"
					nState = 2; //ST_COLLECT
				}
				break;
			}
			
			// Collect string.
			case 2: //ST_COLLECT
			{
				// If in quotes, just grab the characters
				if (bInquotes)
				{
					// Ah...found a quote, jump to end quote state
					if (chC == '"' )
					{
					nState = 3; //ST_END_QUOTE
					break;
					}
				}
				
				// Not in quotes, look for commas
				else if (chC == cDvxCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
					break;
				}
				
				// Not in quotes, look for quotes (this would be wrong)
				// But instead of barfing, I will just add the quote (below)
				else if (chC == '"' )
				{
					// I will check to see if it should be escaped
					if (nLoop < length_array(cCmd))
					{
					// If this is 2 uqotes back to back, just include the one
					if (cCmd[nLoop+1] = '"')
						nLoop++;
					}
				}
				
				// Add character to collection
				cTemp = "cTemp,chC"
				break;
			}

			// End Quote
			case 3: //ST_END_QUOTE
			{
				// Hit a comma
				if (chC == cDvxCmdParamaterSeperator)
				{
					// I am done
					bDone = TRUE;
				}

				// OK, found a quote right after another quote.  So this is escaped.
				else if (chC == '"')
				{
					cTemp = "cTemp,chC"
					nState = 2; //ST_COLLECT
				}
				break;
			}
		}

		// OK, if end of string or done, process and exit
		IF (bDone == TRUE || nLoop >= length_array(cCmd))
		{
			// remove cTemp from cCmd
			cCmd = mid_string(cCmd, nLoop + 1, length_string(cCmd) - nLoop)

			// cTemp is done
			return cTemp;
		}
	}

	// Well...we should never hit this
	return "";
}


#end_if