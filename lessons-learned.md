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

 [EDIT]   ln -s ~/Volumes/Codework/dotfiles/.tmux.conf ~/Users/hrokr/.tmux.conf
 seems to have actually done the trick.

Once that was done and verified with both Atom and Vim that the alias would open
changes could be made which were reflected in the original, it was a pretty fast
operation to replace .test with the (then moved) originals of the other files.

Now, to do a git init

## zsh: bad assignment while trying to alias
Fixed by taking out the spaces around the "=".  Apparently, zsh doesn't like
wasted space.

## .vimrc errors
... and neither does vim.

## changing the font and font size
This took a while because some fonts have long names (Droid Sans Mono for
Powerline Nerd Font Complete:h18 -- yeah looking at you. Arial, you're good).
This get confounded when it looks like OS X truncates the name. For example,
only Vim showed the full name; Fontbook didn't list the Complete as does Vim's
picklist.

What finally worked was:

`:set guifont=*`

... which brought up a picklist via Edit --> Select Font. Then

`:set guifont?`

... which didn't work. What did work was modifing the .vimrc with this:

<code> if has('gui_running')
set guifont=PASTED FONT AND SIZE HERE
endif </code>

The pasted part you get by running this command, and pasting into the
appropriate section above

`:put =&guifont`

So, yeah, one more problem knocked down.

## Changing the color scheme in vim
You should have a ~/.vim directory but will need a colors subdirectory. If you
neither you can do it in one shot with:

`mkdir -p ~/.vim/colors`

## ... is the ~/.tmux.conf file being loaded at all?
keybindings for splitting windows, reloading .conf file and the color theme
settings don't seem to work. I took out the theme but I'm not sure. Hot for
Words must investigate. This may be due to broken symlinks. I say that because I
keep the following for Vim

'The airline statusline funcref function('airline#extensions#ctrlp#apply') has
already been added

... but the line has been commented out. So, it looks like neither of these are
loading. I tried to redo the symlinks with no effect. Then I deleted the
symlink, renamed the file and touched .tmux.conf and made couple of quick
changes which I did a cat on to confirm it worked, then reestablished the link,
confirmed it worked and am now finally good to go.

## Dealing with the Vim error message
    The airline statusline funcref function('airline#extensions#mundo#statusline') has already been added.The airline statusline funcref function('airline#extensions#mundo#statusline') has already been added.

see: https://stackoverflow.com/questions/45040937/how-do-i-remove-duplicates-from-vim-scriptnames-file

## Getting the bottom line to display correctly
The bottom line was in red no matter what I did and the formatting was jacked.
This is what I get for a) not knowing tmux already and b) using someone else's
.tmux.conf files. Or, rather some othere people's conf files.

### ... for the status line (line 79)
    set -g status-left '#[fg=white](#S)'

### ... for the status line (line 19)
    set-window-option -g window-status-current-fg green

... I'll combine this into something a bit better in the future.

## Punchlist the First
Wherein it will be shown many of those details which are missing or deemed
useless.

* tmux shows user@computer, hh:mm and dd-month-yy -- I'm pretty sure I know that
or can another way to let me know. Gotta go.

* tmux colors -- jacked up.

* vim -- solarized not found. I kinda like solarized but I think it's a little off
I probably need to fix this.

* simlink for vimrc is gone. Easiest fix so far.

* tmux.conf and vimrc need to be gone over at least once.

... and the big one...

still gotta learn tmux and vim

## Vimtutor -- why isn't that better known?!?

## Code folding to label sections -- well, that's useful.
started with the zshrc file.

## Well, damn. How do I remove a bunch of dotfiles that aren't tracked anyway?
BLUF: git rm .vim -r

Here is what happened: I was reading ProVim and the author had a .vim folder in 
addition to the .vimrc file. Considering that would be things like modules, it
seemed like a good idea. 

Not so much. 

It turns out that since they are hosted on github anyway, that's something 
github doesn't like, which I guess makes sense. I moved the .vim folder back
and still had to wrestle with getting the dot files gone. Still some issues in
that font and spacing is messed up as well as missing line numbers (because I
deleted the machiene's .vimrc) but it's better than nothing.

## Replacing that annoying 127 error (or 1, 9, etc) in oh-my-zsh
In the .zshrc file to get that annoying 127 arrow to display as just a red x, do the following:

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

The first line make the red x’s but also wrecks the checkmarks
The second line fixes that.

## Default shell, iTerm2 and how IT JUST DOESN'T MATTER what commands you use for changing the shell in iTerm - use the prefs.
a quick reminder:
`bin/zsh != /usr/local/bin/zsh` 
just put that last part in the preferences --> profile --> command area and call it good.
