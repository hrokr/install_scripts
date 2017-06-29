# Troubleshooting setting up a git rep containing the original files which are
then symlinked to.

## Why I did this:
I tried moving all the dot files to a separate folder that I will (eventually)
want to set up as a git repo, and then push to the web for both teaching and
backup purposes.

But it didn't work. Bummer!

So, after getting things back to where they were -- twice, I'm testing it with
dummy file which I'll modify which I'll then append with the results. This is a
lot better than going from a customized version of oh-my-zsh to vanilla bash
with no tab completion and echoing of the current folder.

I might have it... finally. Finally, being the result of way, way too much time
spent working in order to get this.

## Anyway, what (finally) worked:
this:         ln -s /Volumes/Codework/dotfiles/.test ~/.test
instead of:   ln -s  ~/Volumes/Codework/dotfiles/.test ~/.test

Once that was done and verified with both Atom and Vim that the alias would open
changes could be made which were reflected in the original, it was a pretty fast
operation to replace .test with the (then moved) originals of the other files.

Now, to do a git init

## zsh: bad assignment while trying to alias
Fixed by taking out the spaces around the "=".  Apparently, zsh doesn't like wasted space. 
