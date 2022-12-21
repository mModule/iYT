## Inject YouTube

### Description
Magisk module that overlays a modified (patched) version over the regular version.<br>
_This is done by using the `mount` command to mount (overlay) one file/directory over the other_.<br>

### Requirement(s)
Google _YouTube_ to be installed as a _user_ app.<br>
Must be the same build as the patched version.
- Note: This has to be a full apk install. Not a split-apk install.

### Download
Available in the releases tab. [Link](https://github.com/mModule/iYT/releases)

### How to install.
- Install regular (stock) YouTube.
- Copy the module zip file to the device.
- Open Magisk Manager, select Modules and then Install from storage.
- Select the zip file and install.
- Reboot device.<br>

### Recent changes
- Cleanup script(s).<br>
<i>Still some WIP</i>
- Updates to the stock YouTube's theme, now makes the 'Black' theme build redundant.<br>
<i>Drop separate 'Black' and 'Dark' theme names since they are now the same.</i><br>
- Update to YouTube v17.49.37

### How to
_Still need to create the wiki pages :roll_eyes:_
- [Make the Module](https://github.com/mModule/iYT/wiki/MakeModule)
- [Install YouTube](https://github.com/mModule/iYT/wiki/YouTube)

Module support:<br>
- xdaDevelopers [Inject YouTube](https://forum.xda-developers.com/t/module-inject-youtube.4512121)

### About
This module includes a modified YouTube app.<br>
The modified version is created by patching the stock version using ReVanced. <br>
For more information on ReVanced.<br>
- See the [ReVanced](https://github.com/revanced) project.

#### Patches included in this Module
<details>

* Client Spoof<br>
_Spoofs the YouTube or Vanced client to prevent playback issues_<br>
* Disable Auto Captions<br>
_Disable forced captions from being automatically enabled_<br>
* Disable Auto Player Popup Panels<br>
_Disable automatic popup panels (playlist or live chat) on video player_<br>
* Disable Fullscreen Panels<br>
_Disables video description and comments panel in fullscreen view_<br>
* Disable Startup Shorts Player<br>
_Disables playing YouTube Shorts when launching YouTube_<br>
* General Ads<br>
_Removes general ads_<br>
* Hide Infocard Suggestions<br>
_Hides infocards in videos_<br>
* Hide Watermark<br>
_Hides creator's watermarks on videos_<br>
* Minimized Playback<br>
_Enables minimized and background playback_<br>
* Remember Video Quality<br>
_Adds the ability to remember the video quality you chose in the video quality flyout_<br>
* Return Youtube Dislike<br>
_Shows the dislike count of videos using the Return YouTube Dislike API_<br>
* Sponsorblock<br>
_Integrate SponsorBlock_<br>
* Video Ads<br>
_Removes ads in the video player_<br>

</details>

---

#### Notes
- Feel free to use, change, improve, adapt.
- Remember to share.

### Credits
- The Android Community and everyone who has helped me learn through the years.
- John Wu for Magisk.
- Vanced.
- ReVanced.
- Everyone that has contributed to YouTube modifications.<br>
