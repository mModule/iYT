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
- Update to YouTube v18.23.35

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

<b>Patches included in this Module</b>
<details>

| Patch | Description |
|:--------:|:--------------:|
| `client-spoof` | Spoofs a patched client to allow playback. |
| `disable-shorts-on-startup` | Disables playing YouTube Shorts when launching YouTube. |
| `disable-auto-captions` | Disable forced captions from being automatically enabled. |
| `hide-ads` | Removes general ads. |
| `hide-endscreen-cards` | Hides the suggested video cards at the end of a video in fullscreen. |
| `hide-info-cards` | Hides info cards in videos. |
| `hide-watermark` | Hides creator's watermarks on videos. |
| `minimized-playback` | Enables minimized and background playback. |
| `remember-video-quality` | Adds the ability to remember the video quality you chose in the video quality flyout. |
| `return-youtube-dislike` | Shows the dislike count of videos using the Return YouTube Dislike API. |
| `sponsorblock` | Integrates SponsorBlock which allows skipping video segments such as sponsored content. |
| `video-ads` | Removes ads in the video player. |
| `disable-player-popup-panels` | Disables panels from appearing automatically when going into fullscreen (playlist or live chat). |
| `disable-fullscreen-panels` | Disables video description and comments panel in fullscreen view. |
| `hide-layout-components` | Hides general layout components. |
</details>

---

#### Notes
- Feel free to use, change, improve, adapt.
- Remember to share.

### Credits
- The Android Community and everyone who has helped me learn through the years.
- John Wu and team for all things [Magisk](https://github.com/topjohnwu/Magisk).
- Vanced.
- ReVanced.
<!-- - [inotia00](https://github.com/inotia00/revanced-patches) for patches. -->
- Everyone that has contributed to YouTube modifications.<br>
