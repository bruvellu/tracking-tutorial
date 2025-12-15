---
title: Cell tracking using Mastodon in Fiji
author: Bruno C. Vellutini
date: today
date-format: long
created: 15 December 2025
modified: today
toc: true
toc-depth: 3
#embed-resources: true
bibliography: references.bib
lang: en
format: html
link-citations: true
colorlinks: true
citecolor: Maroon
urlcolor: MidnightBlue
---

## Summary {#sec-summary}

This is a (very) basic tutorial on how to track cells using Mastodon [@Girstmair2025] in Fiji [@Schindelin2012-di].

## Requirements {#sec-requirements}

- Lightsheet multiview dataset
- Fiji/ImageJ
- Mastodon

## Setup {#sec-setup}

- Install Fiji
- Start Fiji
- Install Mastodon
- Restart Fiji

::: {#fig-setup-fiji}

{{< video "media/Video1-Start_Fiji_and_install_BigStitcher.mp4" >}}

Start Fiji and install Mastodon.

:::


* Objective: load/create mastodon dataset, get familiar with navigating bigdataviewer and lineage windows, perform basic manual cell tracking with cell divisions, basic editing lineages, try semi-automated detection and tracking, some advanced analysis?
* We will use the Girstmair, J. (2024). Mastodon Auto-Tracking Demo on Parhyale hawaiensis Limb Development. Zenodo. https://doi.org/10.5281/zenodo.13944688 Mastodon dataset from the original data from this paper https://elifesciences.org/articles/34410
* Mastodon detailed documentation https://mastodon.readthedocs.io/

Download dataset
* Go to https://zenodo.org/records/13944688
* Click to download on https://zenodo.org/records/13944688/files/Mastodon_Auto-Tracking_Demo_Ph-limb-dev.zip?download=1
* Wait. It's a 4.3GB ZIP file
* Move the file to a working directory
* Unzip Mastodon_Auto-Tracking_Demo_Ph-limb-dev.zip
* Wait. It'll be unzipped to 23GB.

Download and open Fiji
* Go to https://fiji.sc
* Choose Distribution: Stable
* Click the big download button
* Copy fiji-stable-linux64-jdk.zip to working directory and unzip it
* Open the new directory fiji-stable-linux64-jdk/Fiji.app/
* Double-click on fiji-linux-x64 launcher
* Fiji will open

Install dependencies
* Click on Help > Update...
* The updater will open and say Fiji is up-to-date
* Click Manage Update Sites
* List of plugins available to install in Fiji
* Search for "mastodon"
* Several Mastodon related plugins will appear
* Click on the checkbox for "Mastodon"
* Click Apply and Close
* Click Apply Changes
* Wait until downloads are finished
* Restart Fiji (close window and double-click the launcher)

Open Mastodon project
* In Fiji click on Plugins > Tracking > Mastodon > Mastodon Launcher
* Mastodon Launcher window will open
* Click on "open Mastodon project" (top left) and "Open another project" (bottom right)
* Navigate to the directory Mastodon_Auto-Tracking_Demo_Ph-limb-dev/
* Select the file Parhyale_LimbDev_30tps.mastodon
* Several new windows will open (Console, Mastodon, BigDataViewer, TrackScheme, Data table)

Inspect the dataset
* Let's focus on the Mastodon window. Close Console, BigDataViewer, TrackScheme, Data table
* This is the main project menu from where you can open windows, set options, process data and save the project
* The most important buttons for this tutorial are "bdv" (BigDataViewer) and "trackscheme"
* Click on bdv and make the window larger
* Drag the timepoint slider at the bottom to see cells moving and dividing
* Using your acquired BigDataViewer skills, focus on the surface of the embryo
* If you get lost, press shift+z to re-orient the embryo
* Find a cell that divides before timepoint 15 and looks trackable
* Zoom on it using ctrl+shift+scroll and center it by holding the right button and dragging the mouse
* Use shift+scroll to navigate through z and m-n to go through time
* You are ready to track

Manual tracking
* On the Mastodon project window, click on the trackscheme button
* The trackscheme window will appear
* Resize the bdv window to be side-by-side with the trackscheme
* Click on the bdv window, set the timepoint to some frames before mitosis, shift+scroll to find the center of the nuclei, put your mouse pointer there and press a
* A round magenta circle will appear over the nuclei and in the trackscheme
* With your mouse over the circle, use shift+q and shift+e to adjust the size of the spot to roughly the nucleus diameter
* Zoom in on the new spot in the trackscheme, hover and click on it and watch what happens in the bdv window
* Go back to the bdv, hover the pointer over the circle and hold the spacebar to adjust the position of the circle and the nuclei
* Now let's add a second spot
* Hover the mouse inside the circle and hold a. This will advance to the next frame showing you the first spot in white dashed line and the second spot in white solid line with a white solid link between the two. Still holding a, position the second spot, then release a to create the new linked spot
* Check how the second spot and a link was created in the trackscheme automatically
* Continue to track the nuclei for a few more frames, until the frame immediately before division
* Note that when you click on a spot in the bdv window, the corresponding spot is highlighted in the trackscheme window
* See what happens to the bdv when clicking the spots trackscheme... (nothing, unless it is the spot in view)
* Let's change that
* In the menu bar of bdv and trackscheme windows there are locks 1,2,3. Click on lock 1 in both windows
* Now click through spots in the trackscheme; the view in the bdv will change to show the selected spot at the center
* Before we continue tracking the cell division, let's check one of the amzing mastodon features
* Click on the bdv button in the Mastodon project window and another bdv window will open
* Now activate lock 1 and click in one of the trackscheme spots; both windows will be synchronized!
* Why is this useful for manual tracking? Adjust the view to center the spot in the second bdv window, press shift+y, and select a spot from the trackscheme. Now we have both XY and ZY views of the same nucleus! Which is great for tracking in 3D. You can check for instance, that your spot is well centered in Z and adjust it in this window
* Ok. Continue the tracking of one of the daughter cells. Select the last spot in the trackscheme, go to the xy bdv, hover the mouse over the circle and hold a, move the spot, and release a to add it. Do it for a few frames
* Then go back to the pre-division spot and do the same for the other daughter cell
* This will create the first branch of the lineage tree (adjust the trackscheme view to see it)

Semi-automatic tracking
* This mode will try to guess where the next nuclei are and automatically create the spots and links.
* It requres you to set one spot, let's pick a different nuclei. Choose a bright one you like
* Now, hovering above the circle press ctrl+t
* A lineage will appear in the trackscheme. Check how accurate it is by clicking on the spots and watching their position relative to the nucleus in the bdv windows
* Try going further by hovering a spot and pressing ctrl+t to continue the semi-automated tracking. See how long can you go, how it behaves with cell divisions, and which cells work well with it and which don't
* There are many parameters that can be adjusted to tweak the semi-automated tracking behavior, check the documentation

Automatic detection and linking
* The final part of this tutorial is to try automatic detection and linking of spots
* This is the dream, loading your data getting your lineage, but in practice it is a lot dirtier and cleaning, fixing and curation is needed to get a nice informative lineage
* We will use a simplified version of the protocol included in this dataset in the file Protocol_Auto-Detection_Auto-Linking.docx
* In the Mastodon window, go to Plugins > Tracking > Detection...
* Press Next twice (leave options as is)
* Choose Advanced DoG detector and press Next
* Keep Detect: bright blobs, change Estimated diameter to 35px and Quality threshold to 100. Behavior should remain as Add
* Click Preview and see how well the detection will work by exploring a new bdv window. Do you observe too many false positives? You can change the diameter, for example, and try the preview again to see what happens to the detected spots
* Once satisfied, press Next and wait
* When the detection is done, press Finish.
* The bdv windows and the trackscheme will be showing all the spots. Explore a bit bdv and trackscheme. If you zoom in a lot you'll see the unlinked, individual spots per frame
* Before we try to automatically link these spots, let's remove low quality detections
* On Mastodon window click on Table, resized it to have more space, and resize the column Detection q... to show Detection quality
* Click on Detection quality to sort the table
* Click on the first row to select it. Select all rows where Detection quality is <400
* Then click Edit > Delete Selection
* Close the table
* You can also manually delete obviously wrong spots by hovering and pressing d. Clean up the ones outside the embryo
* Now let's try linking
* In the main Mastodon window click on Plugins > Tracking > Linking...
* Keep All spots selected for all timepoints (0-29) and press Next
* Choose Lap linker and click Next
* Change the parameters to...
	* Frame to frame linking: Max distance to 40px
	* Gap closing: Max distance to 60px (keep others as is)
	* Track division: Check Allow track division, set Max distance to 40px, and press + to add a Feature penalty and set it to Center ch1 to 0.3
* Press Next to start linking and wait... then press Finish
* Note that there are now tracks in the bdv and trackscheme windows. Explore them a bit
* Mastodon can calculate features (position, displacement, velocity, etc) of individual spots, links and branches. Let's do that
* In the main Mastodon window press "compute features". A Feature calculation window will open.
* Press compute and wait... when it's done, close it.

Basic feature visualization
* Finally, let's visualize the computed features that might be interesting or useful.
* In the bdv window press File > Preferences to open the feature color coding visualization parameters
* On Settings > Feature Color Modes click on Duplicate (it'll generate a Number of links (2)) and then Rename. Rename it to Velocity
* On the Coloring Spots change Read spot color from to Incoming link and change Feature to Link velocity. Then click on autoscale in the range
* On the Coloring Links change Read link color from to Link and change Feature to Link velocity. Then also click on autoscale.
* Click Apply (nothing will happen) then OK
* On the bdv window press View > Coloring > Velocity
* Do the same for the other bdv window and the trackscheme
* This gives a visual representation of cells which have a high displacement per frame. These might be artifacts in linking unrelated spots or, in a good processed lineage, reveal some biological process like cell migration

Plotting
* To finalize, a simple example of plotting
* Click on grapher in the main mastodon window, a plot window will open
* Press the lock 1 to lock the windows, select Link velocity - outgoing for X axis and Detection quality for Y axis and press Plot
* Find out if the spots with the highest link velocity are properly linked or is it an artifact

## References

::: {#refs}
:::
