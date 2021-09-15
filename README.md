# TWRP for Sony Xperia Z Ultra

Minimal tree to build TWRP in android-9.0

## Compile

export ALLOW_MISSING_DEPENDENCIES=true

. build/envsetup.sh && lunch omni_togari-eng

mka adbd recoveryimage

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core (4x2.2 GHz Krait 400)
Chipset | Qualcomm MSM8974 Snapdragon 800
GPU     | Adreno 330
Memory  | 2 GB RAM
Shipped Android Version | 4.3
Storage | 16 GB
Battery | Li-ion 2300 mAh battery
Display | 1080 × 1920 pixels, 6.4 inches  (~344 ppi pixel density)
Rear Camera  | Sony G Lens 8 MP 1/2.3" Exmor RS IMX220 back-side illuminated sensor
Front Camera | 2 MP


## Device picture

![Sony Xperia Z Ultra](https://fdn2.gsmarena.com/vv/pics/sony/sony-xperia-z-ultra1.jpg)
