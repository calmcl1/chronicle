# Chronicle

## What is Chronicle?

Chronicle is an audio logger, designed for radio station use.

At the moment, it records audio from specified input to an audio file, on the hour, every hour. Once the recordings have become outdated, they will be deleted. As such, it is a full rotating logger.

## Getting Chronicle
### Windows x32 and x64
Windows users (both 32 and 64 bit) can simply download the latest compiled binaries from the [Releases](https://github.com/calmcl1/chronicle/releases) page. Simply extract and run. Hooray!

### Linux
Linux users can also [download the binaries](https://github.com/calmcl1/chronicle/releases). However, you will need to manually install the pre-requisites:
* `build-essential` and `pkg-config`
* RtAudio, which you have to build (and `make install`) from source. [Get RtAudio here](https://www.music.mcgill.ca/~gary/rtaudio/index.html).
* libsndfile, which is in most package managers. (`libsndfile1-dev`)
* Boost, which is in most package managers (`libboost-dev`).
* ncurses, which is available in most package managers (`libncurses5-dev`).

Then, grab a copy of the source from the [Releases](https://github.com/calmcl1/chronicle/releases) page. Extract to your favourite directory.

Open a terminal and `cd` into the source directory.

Run `make linux`.

The built binary will exist in (srcdir)/build/linux.

I'll get around to making it easier, I promise!


## Usage:

```
chronicle [-h | --help]
chronicle [--licence]
chronicle [-l | --list-devices ]
chronicle [-d | --directory OUTPUT_DIRECTORY] [-f | --filename FORMAT] [-i | --input-device DEVICE_ID] 
          [-a | --max-age MAX_FILE_AGE] [-s | --audio-format [WAV | OGG]]

Where:
    -h | --help          Prints this help message.
    --licence            Prints the licence information for this software and libraries that it uses.
    -l | --list-devices  Lists the available input devices with their IDs.
    -d | --directory     Sets the directory to save the logged audio to. A trailing slash is not required, but may
                             be added. On Windows, if using a trailing slash, use a trailing double-slash.
                             Defaults to current directory.
    -f | --format        strftime-compatible format to use when naming the audio files.
                             Defaults to %F %H%M%S .
    -i | --input-device  The ID number of the input device to record from. A list of input devices and their ID
                             numbers can be obtained with `chronicle -l`.
                             If unspecified, the system default audio recording device will be used.
    -a | --max-age       Sets the maximum age (in seconds) before audio files will be automatically deleted.
                             Defaults to 3600000 (1000 hours, in accordance with OFCOM rules).
    -s | --audio-format Sets the audio format to use for the recorded audio files.
                             Acceptable parameters are:
                                 OGG | Ogg Vorbis (.ogg)
                                 WAV | 16-bit PCM WAV (.wav)
                             Defaults to WAV.
```

## Known Issues:
* Audio devices with more than 2 channels will default to the first two channels. This is perfectly suitable for standard line-in/mic-in audio devices and sound cards where the channels are split up into pairs (which most do), but any sound card that presents multiple channels in a single device will automatically record the first two.
* All audio is resampled to 16bit for conversion to PCM Wave. Although theoretically an issue, this is not likely to affect the vast majority of users.
* Due to the type sizes used in the underlying audio libraries, the audio monitoring graph on the 32-bit version is less reliable at very low levels. This does not affect the quality of the recorded output.

## Buy me a coffee?
If you find chronicle to be useful, fancy buying me a coffee?

I'm on [Flattr](https://flattr.com/submit/auto?fid=kzr39z&url=http%3A%2F%2Fgithub.com%2Fcalmcl1%2Fchronicle) and [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FXDR44PHGFEDN)!

## Copyright
Copyright 2016-2017 Callum McLean.
Distributed under the MIT Licence. See LICENCE for details.