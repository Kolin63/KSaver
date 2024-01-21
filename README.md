# KSaver
A simple way to save and load game data in the Godot Engine. 

## How to use it
First, create a `KSaver` node somewhere in your project. Note that you only need one of these. 

### Generating the JSON Dictionary
In one of its parent nodes, you need to generate a JSON Dictionary. Go to the right sidebar and click into the `SaveVariables` tab. There you'll see a box that says `AccessName ActualName`. This will be how the data will be stored in the JSON File. 

Let's say we want to store a variable `score`. The simplest way to do this is just type `score` into the box and press enter. 

However, if you want the AccessName to be different from the ActualName, you can type something like, `PlayerScore score`. What this means is that the JSON file will look something like this: `{"PlayerScore" : 15}`

Now, click the copy button and paste that function somewhere in the parent node of the KSaver. 

### Grouping the parent node
With the parent node selected, go into `Node > Groups`. Add it to a group `KSave`. This will list it as a node that will be saved. 

### Using the functions
In the parent node, you can now use $KSaver.save() or $KSaver.load() to save and load your game data. 

And that's it! I tried to make this plugin as simple to use as possible, for beginners like myself.
