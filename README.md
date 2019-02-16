## configurate
This shell Script will combine all your yaml-files under ./configuration/ into one big ./configuration.yaml recursively.
Home-Assistant doesnt seem to like, when you add another (for example) sensor:-section. The new Section seems to overwrite the existing one. This script however, will make sure that all sections with the same name will be combined.
There might be other ways to do this, or maybe its not even necessary with some setting here or there, but i thought its a nice little challenge to get myself some shell-fun from :D

### Benefits
While it makes sense to group sensors together, sometimes you might have a device that offers more than just one feature. My FritzBox for example acts as a Device-Tracker and Network-Monitor, needs Templates PLUS not all of its states need to be stored in the DB.
Normally, you'd have to insert configs to the according sections, making the whole configuration.yaml kind of confusing...
There are ways to include Directorys with !include-commands, but those could also just group one section-type together - or maybe i didnt understand how to use it right.
Now, you can simply make a fritzbox.yaml, add a sensor section, a device-tracker section and even define which values it should store in the DB through the recorder-section. AND as a side-effect, its even sorted alphabetically <3

## update_container.sh
The Dockerfile in this repository adds the MySQL functionality to the RaspberryPi3-Image that is provided by Home-Assistant (i guess).
While the Pi is a good place to have your Smart-home's brain inside, its not a good idea to put a Database on a SD-Card. It'll just wear it out faster and query's will be significantly slower.
The update_container.sh Script will simply remove the old Container (you might need to edit the name though), create a new Image containing MySQL-Support and plug that new Container in, preserving the configuration.
