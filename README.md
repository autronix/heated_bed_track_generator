Heated Bed Trace Maker for EAGLE
======

Description
---
Simple Ruby script to generate heating bed tracks for 3D printers in EAGLE.

This is based on the [Heated Bed Theory] [1] and [Comments] [2]

Calculations need to be performed beforehand to determine:
* Track Width (in mm)
* Track spacing (in mm)
* Layer number (numerical value having a matching Layer on EAGLE)
* Desired number of tracks
* Start and END positions in EAGLE Schematic

Usage
-----
Change the values to your liking in the ruby file and run the script.

TODO
----
* Add in-program user input for values
* Add calculations in-program calculations to generate values based on Resistance, track width, etc...

License
------
MIT

Contact
-------
[info@autronix.com] [3]

[1]:http://reprap.org/wiki/Heated_Bed_Theory
[2]:http://reprap.org/wiki/Talk:Heated_Bed_Theory
[3]:mailto:info@autronix.com

