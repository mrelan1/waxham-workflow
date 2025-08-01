# Guide to Amira

🎥 [Watch the Amira Video Tutorial on YouTube](https://youtu.be/yl-nqEb0eNE)

## Import and Set-Up

**1. Import MemBrain Scores File**

Open a new project. Click the “Open Data” button in the top left. Import the MemBrain 
segmentation scores file (e.g. *_scores.mrc). You can right click this and select Ortho Slice 
from the Amira toolbox to visualize the imported volume

**2. Import TARDIS Microtubule Semantic File**

Click the “Open Data” button again. Import the TARDIS output segmentation (e.g. 
*_semantic.mrc).

***Note:** This file must be in the **int16 format** to ensure proper compatibility with Amira's segmentation tools. If it is not already in this format, you will need to convert it before import.*

<p align="center">
  <img src="amira_images/import_2.png" alt="Import step in Amira" />
  <br>
  <em>Above: you should now have two files imported</em>
</p>

**3. Generate Ortho Slices to Visualize**

Select one of the imported .mrc files. Right click on the file to open the modules dialog. In 
the left-side menu of the dialog, click *Display*. Then, in the menu to the right, select *Ortho 
Slice* and click *Create*. You should now be able to see the selected tomogram in the viewer. 
Use the slice number slider in the Properties panel on the bottom left to scroll through the z-slices of the tomogram.

The blue box in the orange Ortho Slice module (to the left of the words “Ortho Slice”) 
indicate which tomogram is currently displayed. To turn off and on a tomogram’s display, 
click the blue box (to turn to a gray (inactive)), and click the gray box on the inactive 
tomogram (to turn to blue).


## Segmentation with the Magic Wand

**1. Open Segmentation Window/Confirm Image and Label Field**

Select the *_scores.mrc file. Then, in the top menu, select the Segmentation tab. The 
display will then change to the Segmentation Window. Confirm the image you selected 
corresponds to the proper label field. See image below for example.

**2. Build Materials Table**

Below the image and label field, note the Materials section. By default, the “Exterior (Not 
Assigned)” class and “Inside” class will be generated. 

Change the name of the “Inside” class to your first class by double-clicking on the name 
itself. Then, click the Add button at the bottom of the table to add a new class. Add and 
rename as many classes as you want to segment.

***Note:** You should prepare your list of classes to segment before building your table. Once 
you begin segmenting, you are committed to that order of classes, which can affect 
downstream analysis.*

**3. Launch the Magic Wand**

Below the Materials section, note the Selection section. By default, the mouse arrow tool 
will be selected. Select the fourth tool that looks like a wand. This is the Magic Wand tool. 

In your image pane, a blue-ish mask will cover your tomogram. We will adjust this mask to 
help us segment signal. Below the tool selection, there will be deselected checkboxes. 
Check the boxes “All slices” and “Same material only.”

**4. Adjust the Masking to Segment**

Note the Masking scale below the checkboxes. You should see a histogram of the pixel 
intensities in the tomogram. There are two white domain restrictors on the left and right side 
of the scale.

Move the left-side restrictor to the right, going through the histogram until you reach the last 
~20-25% of the histogram. This restricts the mask to the ~20-25% of pixels that are 
segmented as “signal” in the tomogram. As you move the restrictor more to the right, you 
will notice the mask begins to restrict itself as well.

***Note:** If the Masking scale is not automatically calibrated, click the “Edit” dropdown to the 
right of the scale and select “Adjust range to” and “Data min-max.”*

**5. Segmentation and 3D Viewing**
Now that the mask has been adjusted, we can start to segment and view the tomogram in 
3D. Select the class you want to segment in the table. With the magic wand tool selected, 
click the signal on the blue mask you would like to segment. When you click, the selected 
signal’s mask will turn purple, and a 3D preview of your selection will appear in the right-side panel of the Segmentation window. (Make sure to check the 3D box to the right of the  class name in the Materials table).

To add your selected signal to the segmentation, click the (+) button below the words 
“Selection.” Repeat this process to add segmentations of signal for all classes. 

***Tips for Segmentation:***
- *Use your mouse wheel to scroll through z-slices of your tomogram. Some signal will 
be more accentuated in certain slices and less in others.*
- Adjust your masking constantly. Some signal will need a more indulgent restriction 
(move the left-side restrictor more to the left to encompass more of the histogram).*
- ***Mihir's Trick:***
  -  Move the left-side restrictor almost all the way through the length of the 
histogram (~5-10%).
  - Select the smallest pixel of signal possible. After selecting, you will see the 
purple mask in the 2D viewer and 3D preview in the 3D viewer.
  - Gradually move the left-side restrictor back to the left through the length of 
the histogram. It is imperative you do this after selecting your signal. As you 
move the restrictor, the purple mask in the 2D viewer will grow with the 
signal, and the 3D preview will expand.
  -Move the restrictor until you segment the full volume of your signal. This 
enables you to see when you segment too much and capture signal that is 
not your selected class, or when you segment too little and miss signal in 
the tomogram.

**6. Moving Between MemBrain and TARDIS Files**

The image you segment can be changed by selecting a new image from the toggle in Image: 
(at the top under Segmentation Editor). When you move between images, the Masking scale 
should automatically adjust to the histogram of the tomogram. If not, click the “Edit” 
dropdown to the right of the scale and select “Adjust range to” and “Data min-max.”

## Visualization and Animation

**1. Generate Volume Rendering**

Once you have finished segmenting your tomogram in the Segmentation Window, return to the 
Project Window by using the top tab. You will now see a new file that Amira generated as your 
segmentation: *scores.labels. This will be attached to your *scores.mrc file.

Right click on the *scores.labels file to open the modules dialog. In the left-side menu of the 
dialog, click Display. Then, in the menu to the right, scroll and select Volume Rendering and 
click Create. You should now be able to see the 3D segmentation of your tomogram. You 
can use your mouse to move around the volume.

**2. Move Ortho Slice through Volume**
We can overlay our existing Ortho Slice of the *scores.mrc file onto the volume for 
visualization purposes. Click the gray box to the left of “Ortho Slice” words in the orange 
module connected to your *scores.mrc file. The box should turn blue, and your Ortho Slice should appear with the volume. Use the slice number slider in the Properties panel on the bottom left to scroll through the z-slices of the tomogram.

**3. Animate Ortho Slice**

You can animate the Ortho-Slice running through all z-slices. Right click on the Ortho Slice module 
attached to the *scores.labels file to open the modules dialog. In the left-side menu of the dialog, 
click Animate. Then, in the menu to the right, select Animate Ports and click Create. A new yellow 
module will appear, and its properties panel will open in the bottom left. 

In the “Time:” row, simply hit the Play button (looks like a Triangle oriented on its right side, directly 
to the left of the slice number box) to animate the Ortho Slice moving through all z-slices.

In the dropdown menu to the right of the slice number box, you can configure the animation 
to play once, loop, stop, adjust the timing, and more.

## Bugs and Fixes

**Unable to Fix Masking when Moving Between Membrain and TARDIS in Segmentation Window**

This was the only major bug encountered when using Amira. When you are segmenting and 
switching between the Membrain and TARDIS files, the Masking scale will sometimes not 
automatically adjust. In some cases, the Masking scale will glitch, and you will not be able to use 
the Magic Wand. 

*This only has happened for the following reason: returning to the Project Window while segmenting 
one file and opening the Segmentation Window with the other file.*

**Mihir's Fix:**
- Save your *scores.labels file. It will save as an .am file (the Amira file type).
- Close Amira and reopen a new project. 
- Reimport your *scores.mrc and *semantic.mrc files
- Import your saved *scores.labels file
- Resume segmentation. The *scores.mrc file will automatically recognize the imported 
*scores.labels file as the Label Field.

If any other bugs or fixes, please send to mrelan1@jh.edu so I can update this guide. 








